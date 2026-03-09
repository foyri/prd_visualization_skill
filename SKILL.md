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

Complete JSON specification for hierarchical data.

### Required Fields (Per Node)

| Field | Type | Description |
|-------|------|-------------|
| `id` | string | Unique identifier across entire tree |
| `title` | string | Display name shown in visualization |
| `status` | string | One of: `todo`, `processing`, `problem`, `done` |
| `children` | array | Child nodes (empty array for leaf nodes) |

### Optional Fields

| Field | Type | Description |
|-------|------|-------------|
| `type` | string | Node category: `prd`, `section`, `feature`, `requirement` |
| `domain` | string | Parent domain or category name |
| `stage` | string | Development stage: `planning`, `design`, `development`, `testing`, `released` |
| `owning_sig` | string | Team or group responsible |
| `granularity` | string | Detail level: `coarse`, `medium`, `fine` |
| `complexity` | string | Complexity rating: `low`, `medium`, `high` |
| `source_url` | string | Link to source (GitHub, Jira, etc.) |
| `goals` | array | Array of goal strings |

### Example

```json
{
  "id": "root",
  "title": "Product Requirements Document",
  "status": "processing",
  "type": "prd",
  "children": [
    {
      "id": "auth",
      "title": "Authentication System",
      "status": "done",
      "type": "section",
      "stage": "released",
      "owning_sig": "Platform Team",
      "children": [
        {
          "id": "oauth",
          "title": "OAuth 2.0 Integration",
          "status": "done",
          "type": "feature",
          "complexity": "medium",
          "source_url": "https://github.com/org/repo/issues/123"
        }
      ]
    }
  ]
}
```

### Validation Rules

1. All `id` values must be unique across the entire tree
2. `status` must be one of the four defined values
3. `children` must always be present (use empty array `[]` for leaves)
4. Maximum recommended depth: 10 levels (performance degrades beyond this)
5. Maximum recommended total nodes: 1000 (for smooth interactivity)

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
