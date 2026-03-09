---
name: hierarchy-visualizer
description: Creates interactive D3.js hierarchy visualizations with 4 view modes (Fractal Tree, Notion List, Force-Directed, Radial Cluster). Use when user wants to visualize tree structures, hierarchical data, PRDs, requirements, org charts, file structures, or says "visualize hierarchy", "tree view", "show structure", "render tree", "hierarchy diagram".
---

# Hierarchy Visualizer

Interactive multi-view visualization for hierarchical data using D3.js.

## Quick Start

```bash
python3 -m http.server 8080
open http://localhost:8080/hierarchy-visualizer.html
```

## Data Format

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

**Required:** `id` (unique), `title` (display name), `status` (`todo`/`processing`/`problem`/`done`), `children` (array)

**Optional:** `type`, `domain`, `stage`, `owning_sig`, `granularity`, `complexity`, `source_url`, `goals`

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

**JSON not loading?** → Check browser console for errors

**Need custom styling?** → See `references/customization.md`
