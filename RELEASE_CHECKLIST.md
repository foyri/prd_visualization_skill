# Release Checklist — Hierarchy Visualizer Skill v1.0.0

## ✅ Pre-Release Validation

- [x] SKILL.md has proper YAML frontmatter (name, description)
- [x] Description includes "when to use" triggers
- [x] Assets organized in `assets/` directory
- [x] References created for detailed docs
- [x] No extraneous files (README, CHANGELOG in skill folder)
- [x] GitHub repo is public

## 📦 Packaging

```bash
# Make package script executable
chmod +x package.sh

# Run packaging
./package.sh

# Verify output
ls -lh dist/hierarchy-visualizer-1.0.0.skill
```

## 🚀 Distribution

### 1. Clawhub (Primary)
```bash
npm install -g clawhub
clawhub login
clawhub publish prd_visualization_skill/ \
  --slug hierarchy-visualizer \
  --version 1.0.0 \
  --tags latest \
  --changelog "Initial release with 4 view modes, dark/light theme, auto-sync"
```

### 2. Vercel Skills (Auto)
Already discoverable via:
```bash
npx skills add foyri/prd_visualization_skill
```

### 3. SkillsMP
Submit at: https://skillsmp.com/submit
- Paste GitHub repo URL
- Add tags: `visualization`, `d3`, `hierarchy`, `prd`

### 4. Social Media

**Twitter/X:**
```
🚀 Just released Hierarchy Visualizer skill!

Transform JSON hierarchies into interactive D3.js visualizations.
4 view modes • Dark/light theme • Auto-sync • Zero deps

Perfect for PRDs, project structures, org charts.

Install: clawhub install hierarchy-visualizer
Repo: github.com/foyri/prd_visualization_skill

#buildinpublic #dataviz #opensource
```

**LinkedIn:**
```
Excited to share my new open-source skill for visualizing hierarchical data!

Whether you're working with product requirements, project structures, or org charts — this tool transforms JSON into beautiful interactive visualizations.

✨ 4 view modes (Fractal Tree, Notion List, Force-Directed, Radial Cluster)
🎨 Light/Dark themes
🔄 Live sync as your data changes
⚡ Zero dependencies, runs anywhere

Available on Clawhub and Vercel Skills. Would love your feedback!

#ProductManagement #DataVisualization #OpenSource #DeveloperTools
```

**Hacker News:**
- Title: "Show HN: Interactive hierarchy visualizer for PRDs and project structures"
- URL: GitHub repo
- Key points: D3.js, 4 view modes, auto-sync, open source

**Reddit:**
- r/webdev: "I built a zero-dependency hierarchy visualizer"
- r/dataisbeautiful: "Interactive tree visualization tool"
- r/productmanagement: "Visualize your PRDs interactively"

## 📊 Post-Release Monitoring

- [ ] Track GitHub stars
- [ ] Monitor Clawhub installs
- [ ] Watch for issues/PRs
- [ ] Collect user feedback
- [ ] Plan v1.1 features based on feedback

## 🎯 Success Metrics

- 50+ GitHub stars in first week
- 10+ Clawhub installs
- 3+ organic social shares
- 1+ community contribution (issue or PR)
