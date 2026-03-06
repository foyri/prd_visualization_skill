# Skill Distribution Platforms

Research on how to release PRD Visualization Skill to Clawhub and other skill platforms.

Date: 2026-03-05

---

## 1. Clawhub (OpenClaw Skill Registry)

**Website:** https://clawhub.ai
**CLI Package:** `npm install -g clawhub` or `npx clawhub`

### Publish Steps

```bash
# 1. Install CLI
npm install -g clawhub

# 2. Login (GitHub OAuth, account must be 1+ week old)
clawhub login

# 3. Publish your skill
clawhub publish ./prd_visualization_skill \
  --slug prd-visualization-skill \
  --name "PRD Visualization Skill" \
  --version 1.0.0 \
  --tags latest \
  --changelog "Initial release"
```

### SKILL.md Requirements

- YAML frontmatter with `name`, `description`
- Optional: `version`, `metadata.openclaw.requires` (env vars, binaries)
- Markdown body with instructions

### Security & Moderation

- GitHub account must be at least 1 week old to publish
- Users can report skills; 3+ unique reports auto-hides skill
- Moderators can review hidden skills

---

## 2. Vercel Skills (skills.sh)

**Website:** https://skills.sh
**CLI:** `npx skills add <owner/repo>`

### Publish Steps

1. Put skill in a GitHub repo with `SKILL.md`
2. Add `README.md` with install instructions
3. Users install via: `npx skills add foyri/prd_visualization_skill`
4. Skills appear on skills.sh automatically via install telemetry

### SKILL.md Format

```yaml
---
name: prd-visualization-skill
description: Visualize PRD requirements as interactive D3.js hierarchies
---
# Skill instructions
```

### Name Requirements

- 1-64 characters
- Lowercase letters and numbers with single hyphens
- Must match directory name
- Pattern: `^[a-z0-9]+(-[a-z0-9]+)*$`

### Description Requirements

- 1-1024 characters
- Should explain what skill does AND when to use it

---

## 3. SkillsMP

**Website:** https://skillsmp.com

- 283,647+ skills marketplace
- Uses open SKILL.md standard
- Compatible with Claude Code, Codex CLI
- **Publish:** Share GitHub repo, skills get indexed automatically via CLI install telemetry

---

## 4. Other Platforms

| Platform | URL | Notes |
|----------|-----|-------|
| PolySkill | polyskill.ai | Open marketplace |
| ClaudeCodePlugins | claudecodeplugins.com | 1342+ skills |
| ClaudeMarketplaces | claudemarketplaces.com | 856 skills |
| LobeHub | lobehub.com/skills | Skills marketplace |

---

## SKILL.md Best Practices

### Structure

```yaml
---
name: skill-name
description: Short summary of what this skill does
version: 1.0.0
metadata:
  openclaw:
    requires:
      env:
        - MY_API_KEY
      bins:
        - curl
      primaryEnv: MY_API_KEY
---

# Skill Name

## What This Skill Does

Clear explanation of the skill's purpose.

## When to Use

- Scenario 1
- Scenario 2

## Inputs Needed

List any required inputs.

## Step-by-Step Procedure

1. First step
2. Second step
3. Final step

## Validation

How to know the task is complete.

## Common Failure Modes

- Issue 1: How to fix
- Issue 2: How to fix
```

### Optional Supporting Files

- `scripts/` - Executable helpers for deterministic automation
- `references/` - Longer docs, checklists, templates
- `assets/` - Static templates, sample configs, diagrams

---

## Recommended Distribution Strategy

1. **Ensure SKILL.md has proper format** (YAML frontmatter with name, description)
2. **GitHub repo** - Already done: https://github.com/foyri/prd_visualization_skill
3. **Publish to Clawhub:**
   ```bash
   npm install -g clawhub
   clawhub login
   clawhub publish . --slug prd-visualization-skill --version 1.0.0 --tags latest
   ```
4. **Vercel Skills** - Already discoverable via GitHub repo URL
5. **Submit to SkillsMP** - Manual submission or via GitHub

---

## Key Differences Between Platforms

| Platform | Review Process | Visibility | Install Method |
|----------|---------------|------------|----------------|
| Clawhub | Post-publish moderation | Public registry | `clawhub install <slug>` |
| Vercel Skills | None (telemetry-based) | GitHub-driven | `npx skills add <repo>` |
| SkillsMP | Auto-indexed | Public marketplace | Download or CLI |

---

## Security Considerations

- Skills are code - review before installing
- Be especially careful with `scripts/` directory (can execute commands)
- Pin to known repos and review diffs on updates
- Check declared `requires.env` matches actual skill behavior
