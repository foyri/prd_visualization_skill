---
name: hierarchy-visualizer
description: Creates interactive D3.js hierarchy visualizations with 4 view modes (Fractal Tree, Notion List, Force-Directed, Radial Cluster). Use when user wants to visualize tree structures, hierarchical data, PRDs, requirements, org charts, file structures, or says "visualize hierarchy", "tree view", "show structure", "render tree", "hierarchy diagram".
---

# Hierarchy Visualizer

Interactive multi-view visualization for hierarchical data using D3.js.

## Quick Start

1. Place all files in a folder:
   - `hierarchy-visualizer.html` (main app)
   - `d3.min.js` (D3 library)
   - `your-data.json` (hierarchical data)

2. Start local server:
   ```bash
   python3 -m http.server 8080
   ```

3. Open browser:
   ```
   http://localhost:8080/hierarchy-visualizer.html
   ```

## Data Format

JSON with hierarchical structure:

```json
{
  "id": "root",
  "title": "Root Node",
  "status": "processing",
  "children": [
    {
      "id": "child-1",
      "title": "Child Node",
      "status": "todo",
      "children": []
    }
  ]
}
```

**Required fields:**
- `id` — unique identifier
- `title` — display name
- `status` — `todo`, `processing`, `problem`, or `done`
- `children` — array of child nodes

**Optional fields:**
- `type`, `domain`, `stage`, `owning_sig`, `granularity`, `complexity`, `source_url`, `goals`

## View Modes

| Mode | Best For | Interaction |
|------|----------|-------------|
| **Notion List** | Quick overview, scanning | Collapsible sections |
| **Fractal Tree** | Complex hierarchies, aesthetics | Zoom, pan, parameter tuning |
| **Force-Directed** | Relationship exploration | Drag nodes, physics simulation |
| **Radial Cluster** | Compact circular layouts | Click to expand/collapse |

## Controls

- **View switcher** — Dropdown at top-left
- **Zoom/Pan** — Scroll wheel, click-drag
- **Collapse/Expand** — Click nodes or use L1/L2/L3 buttons
- **Status filter** — Click Todo/Proc/Prob/Done labels
- **Theme toggle** — Sun/moon icon (top-right)
- **Auto-sync** — JSON updates every 5 seconds

## Status Colors

| Status | Color |
|--------|-------|
| Todo | Gray `#8b949e` |
| Processing | Yellow `#e3b341` |
| Problem | Orange `#ffa657` |
| Done | Green `#238636` |

## Troubleshooting

**Blank visualization?**
→ Use local HTTP server, not `file://` protocol

**JSON not loading?**
→ Check console for errors; ensure valid JSON format

**Need custom styling?**
→ Edit CSS variables in HTML file (~line 78)
