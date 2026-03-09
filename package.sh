#!/bin/bash
# Package skill for distribution

SKILL_NAME="hierarchy-visualizer"
VERSION=$(cat VERSION)

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
    references/ \
    -x "*.DS_Store" \
    -x "__MACOSX/*"

echo "✅ Packaged: dist/${SKILL_NAME}-${VERSION}.skill"
echo ""
echo "📤 Next steps:"
echo "   1. Publish to Clawhub: clawhub publish . --slug $SKILL_NAME --version $VERSION"
echo "   2. Push to GitHub: git push origin main"
echo "   3. Submit to SkillsMP: https://skillsmp.com/submit"
