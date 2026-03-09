---
name: hierarchy-visualizer
description: Creates interactive D3.js hierarchy visualizations with 4 view modes (Fractal Tree, Notion List, Force-Directed, Radial Cluster). Use when user wants to visualize tree structures, hierarchical data, PRDs, requirements, org charts, file structures, or says "visualize hierarchy", "tree view", "show structure", "render tree", "hierarchy diagram".
---

# Hierarchy Visualizer

Interactive multi-view visualization for hierarchical data using D3.js.

## When to Use This Skill

Use when the user wants to visualize their PRD, project requirements, or any hierarchical JSON data. The visualizer reads from a JSON file and renders it as an interactive diagram.

## Agent Instructions

### Step 1: Identify the PRD JSON file
Ask the user for the path to their PRD JSON file, or look for common filenames:
- `prd.json`
- `requirements.json`
- `hierarchy.json`
- Any `.json` file in their project folder

### Step 2: Link the PRD to the visualizer

The HTML file loads `requirements-hierarchy.json` by default. You have two options:

**Option A: Copy visualizer to project folder (Recommended)**
```bash
# Copy visualizer files to user's project
cp hierarchy-visualizer.html d3.min.js /path/to/user/project/

# Rename or symlink their PRD to the expected filename
ln -s /path/to/user/project/their-prd.json /path/to/user/project/requirements-hierarchy.json

# Start server from their project folder
cd /path/to/user/project && python3 -m http.server 8080
```

**Option B: Copy PRD to visualizer folder**
```bash
# Copy user's PRD to replace the example
cp /path/to/user/project/prd.json assets/requirements-hierarchy.json

# Start server from assets folder
cd assets && python3 -m http.server 8080
```

### Step 3: Open in browser
```
http://localhost:8080/hierarchy-visualizer.html
```

## Data Format

The PRD JSON must follow this structure:

```json
{
  "id": "root",
  "title": "Product Requirements",
  "status": "processing",
  "children": [
    {
      "id": "auth",
      "title": "Authentication",
      "status": "done",
      "children": []
    }
  ]
}
```

**Required fields:**
- `id` — unique identifier (string)
- `title` — display name (string)
- `status` — one of: `todo`, `processing`, `problem`, `done`
- `children` — array of child nodes (empty array for leaves)

**Optional fields:** `type`, `domain`, `stage`, `owning_sig`, `granularity`, `complexity`, `source_url`, `goals`

## View Modes

- **Notion List** — Collapsible hierarchical list (default)
- **Fractal Tree** — Radial branching with physics
- **Force-Directed** — Draggable node-link diagram
- **Radial Cluster** — Circular dendrogram

## Controls

- **View switcher** — Top-left dropdown
- **Zoom/Pan** — Scroll wheel, click-drag
- **Collapse/Expand** — Click nodes or L1/L2/L3 buttons
- **Status filter** — Click Todo/Proc/Prob/Done labels
- **Theme toggle** — Sun/moon icon (top-right)
- **Auto-sync** — JSON updates every 5 seconds

## Status Colors

- Todo: Gray `#8b949e`
- Processing: Yellow `#e3b341`
- Problem: Orange `#ffa657`
- Done: Green `#238636`

## Troubleshooting

**Blank visualization?** → Use local HTTP server, not `file://`

**JSON not loading?** → Check that `requirements-hierarchy.json` exists in the same folder as the HTML file

**Need custom styling?** → See `references/customization.md`
