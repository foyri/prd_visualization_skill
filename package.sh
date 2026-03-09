#!/bin/bash
# Package skill for distribution
# Version is managed via git tags (e.g., git tag v1.0.0)

SKILL_NAME="prd-visualization-skill"
VERSION=$(git describe --tags --always 2>/dev/null || echo "dev")

echo "📦 Packaging $SKILL_NAME v$VERSION..."

# Validate structure
echo "✓ Validating skill structure..."
if [ ! -f "SKILL.md" ]; then
    echo "❌ Missing SKILL.md"
    exit 1
fi

if [ ! -d "assets" ]; then
    echo "❌ Missing assets/ directory"
    exit 1
fi

# Create dist directory
mkdir -p dist

# Package as .skill file (zip with .skill extension)
# Only include skill-required files, exclude extra documentation
zip -r "dist/${SKILL_NAME}-${VERSION}.skill" \
    SKILL.md \
    assets/ \
    -x "*.DS_Store" \
    -x "__MACOSX/*"

echo "✅ Packaged: dist/${SKILL_NAME}-${VERSION}.skill"
echo ""
echo "📤 Publish to 4 skill hubs:"
echo ""
echo "   1. Clawhub (OpenClaw):"
echo "      npm install -g clawhub"
echo "      clawhub login"
echo "      clawhub publish . --slug $SKILL_NAME --version $VERSION --tags latest"
echo ""
echo "   2. Vercel Skills (auto-discoverable):"
echo "      Already available via: npx skills add foyri/prd_visualization_skill"
echo ""
echo "   3. SkillsMP:"
echo "      Visit: https://skillsmp.com"
echo "      Submit: https://github.com/foyri/prd_visualization_skill"
echo ""
echo "   4. MCP Market:"
echo "      Visit: https://mcpmarket.com"
echo "      Submit your MCP server/skill for listing"
