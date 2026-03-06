#!/bin/bash
# Package skill for distribution

SKILL_NAME="hierarchy-visualizer"
VERSION="1.0.0"

echo "📦 Packaging $SKILL_NAME v$VERSION..."

# Validate structure
echo "✓ Validating skill structure..."
if [ ! -f "prd_visualization_skill/SKILL.md" ]; then
    echo "❌ Missing SKILL.md"
    exit 1
fi

if [ ! -d "prd_visualization_skill/assets" ]; then
    echo "❌ Missing assets/ directory"
    exit 1
fi

# Create dist directory
mkdir -p dist

# Package as .skill file (zip with .skill extension)
cd prd_visualization_skill
zip -r "../dist/${SKILL_NAME}-${VERSION}.skill" . -x "*.DS_Store" -x "__MACOSX/*"
cd ..

echo "✅ Packaged: dist/${SKILL_NAME}-${VERSION}.skill"
echo ""
echo "📤 Next steps:"
echo "   1. Publish to Clawhub: clawhub publish prd_visualization_skill/ --slug $SKILL_NAME --version $VERSION"
echo "   2. Push to GitHub: git push origin main"
echo "   3. Submit to SkillsMP: https://skillsmp.com/submit"
