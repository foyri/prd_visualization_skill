# PRD Visualization Skill

Interactive D3.js-based hierarchy visualization for product requirements, project structures, and tree data.

[![Clawhub](https://img.shields.io/badge/Clawhub-Install-blue)](https://clawhub.ai)
[![Skills](https://img.shields.io/badge/Vercel%20Skills-Add-green)](https://skills.sh)

## 🎯 What It Does

Transforms hierarchical JSON data into beautiful, interactive visualizations with 4 view modes:

- **Fractal Tree** — Radial branching with physics-based layout
- **Notion List** — Collapsible hierarchical list (default)
- **Force-Directed** — Draggable node-link diagram
- **Radial Cluster** — Circular dendrogram

## 📦 Installation

### Via Clawhub (OpenClaw)
```bash
clawhub install hierarchy-visualizer
```

### Via Vercel Skills
```bash
npx skills add foyri/prd_visualization_skill
```

### Manual
1. Clone this repo
2. Copy `assets/` folder to your project
3. Open `hierarchy-visualizer.html` in browser

## 🚀 Quick Start

```bash
# Start local server
cd assets/
python3 -m http.server 8080

# Open in browser
open http://localhost:8080/hierarchy-visualizer.html
```

## 📊 Example Data Format

```json
{
  "id": "root",
  "title": "Product Requirements",
  "status": "processing",
  "children": [
    {
      "id": "auth",
      "title": "Authentication System",
      "status": "done",
      "children": [...]
    }
  ]
}
```

## ✨ Features

- 🎨 Light/Dark theme toggle
- 🔍 Zoom & pan
- 📱 Responsive design
- 🔄 Auto-sync (polls JSON every 5s)
- 🏷️ Status filtering (Todo/Processing/Problem/Done)
- ⚡ Zero dependencies (D3.js bundled)

## 🛠️ Use Cases

- Product Requirement Documents (PRDs)
- Project hierarchies
- Org charts
- Decision trees
- File system visualization
- Any tree-structured data

## 📄 License

MIT
