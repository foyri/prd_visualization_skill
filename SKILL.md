---
name: hierarchy-visualizer
description: Creates interactive hierarchy visualizations with 4 view modes (Fractal Tree, Notion List, Force-Directed, Radial Cluster). Use when user wants to visualize tree structures, hierarchical data, PRDs, requirements, or says "visualize hierarchy", "tree view", "show structure".
---

# Hierarchy Visualizer

Interactive D3.js-based multi-view visualization for hierarchical data structures.

## Capabilities

- **Fractal Tree View** - Radial branching structure with customizable parameters (branch angles, spacing, stroke)
- **Notion List View** - Collapsible hierarchical list with toggle sections (default view)
- **Force-Directed View** - Physics-based node-link diagram with draggable nodes
- **Radial Cluster View** - Circular dendrogram layout with clickable nodes

## Files Required

Place these 3 files in the same folder:

| File | Purpose |
|------|---------|
| `hierarchy-visualizer.html` | Main visualization (all CSS/JS embedded) |
| `d3.min.js` | D3.js library (v7.8.5) |
| `requirements-hierarchy.json` | Your hierarchical data |

## Usage

### Quick Start

**Option 1: Using Python HTTP server (recommended)**

```bash
# Navigate to the folder containing the 3 files
cd /path/to/hierarchy-visualizer/

# Start a local server (any available port)
python3 -m http.server 8080

# Open in browser
open http://localhost:8080/hierarchy-visualizer.html
```

**Option 2: Double-click the HTML file**

Simply double-click `hierarchy-visualizer.html` to open it in your default browser.

> **Note:** Some browsers block JSON loading from `file://` protocol. If the visualization appears blank, use Option 1 instead.

**Option 3: Using VS Code Live Server**

1. Open the folder in VS Code
2. Right-click `hierarchy-visualizer.html`
3. Select "Open with Live Server"

---

### Step 1: Prepare Your Data

Your JSON file must follow this hierarchy format:

```json
{
  "id": "root",
  "title": "Root Node",
  "status": "processing",
  "children": [
    {
      "id": "child-1",
      "title": "Child Node 1",
      "status": "todo",
      "children": [...]
    }
  ]
}
```

Required fields per node:
- `id` - Unique identifier
- `title` - Display name
- `status` - One of: `todo`, `processing`, `problem`, `done`
- `children` - Array of child nodes (empty array if leaf)

Optional fields:
- `type` - Node type (e.g., `prd`, `section`, `leaf_requirement`)
- `domain` - Parent domain name
- `stage` - Development stage
- `owning_sig` - Owning team/signature
- `granularity` - Detail level
- `complexity` - Complexity rating
- `source_url` - Link to source (e.g., GitHub)
- `goals` - Array of goal strings

### Step 2: Open the Visualization

1. Place all 3 files in a folder
2. Start a local server: `python3 -m http.server 8080`
3. Open browser: `http://localhost:8080/hierarchy-visualizer.html`

Or open the HTML file directly (may need `--allow-file-access-from-files` for JSON loading)

### Step 3: Interact with the Tree

**View Controls:**
- Dropdown menu to switch between 4 view types
- Zoom: Scroll wheel or pinch
- Pan: Click and drag

**Collapse/Expand:**
- Click nodes to toggle (fractal/radial views)
- Use L1, L2, L3 buttons for quick level selection
- Collapse All / Expand All buttons

**Status Filter:**
- Click Todo/Proc/Prob/Done labels to filter
- Click again to clear filter

**Theme:**
- Click sun/moon icon (top right) to toggle light/dark mode
- Preference saved to localStorage

**Parameters (Fractal View):**
- Adjust trunk spacing, branch angles, stroke widths
- Real-time preview
- Reset to Defaults button

## Theme Support

- **Light Mode** - Clean white background with dark text
- **Dark Mode** - Dark navy background with light text
- Toggle via sun/moon icon (top right)
- Preference saved to localStorage

## Auto-Sync

The visualization polls `requirements-hierarchy.json` every 5 seconds for changes. Update your JSON file and watch the tree update live.

## Status Colors

| Status | Color | Hex |
|--------|-------|-----|
| Todo | Gray | `#8b949e` |
| Processing | Yellow | `#e3b341` |
| Problem | Orange | `#ffa657` |
| Done | Green | `#238636` |

## Troubleshooting

### JSON not loading

**Error:** "File not found" or blank visualization

**Solutions:**
1. Ensure all 3 files are in the same folder
2. Use a local HTTP server (not `file://` protocol)
3. Check browser console for errors

### Zoom/pan resets on sync

**Fixed:** As of v2026-03-05, zoom state is preserved during auto-sync for Fractal and Radial Cluster views.

### Text hard to read in dark mode

**Fixed:** Theme-aware colors for all UI elements including status HUD, links, and nodes.

## Customization

Edit `hierarchy-visualizer.html` to customize:

- `STATUS_COLORS` object (line ~902) - Status color mapping
- `DEFAULTS` object (line ~908) - Default parameters
- CSS variables (lines ~78-103) - Theme colors

## Examples

### Example 1: PRD Visualization

User says: "Visualize my PRD structure"

Actions:
1. Generate `requirements-hierarchy.json` from PRD
2. Place in `pocs/` folder with HTML and D3
3. Open in browser

### Example 2: Project Hierarchy

User says: "Show me the project tree"

Actions:
1. Export project structure as JSON hierarchy
2. Use the visualizer to render
3. Adjust parameters for optimal view
