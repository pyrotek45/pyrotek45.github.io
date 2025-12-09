#!/usr/bin/env bash
# Setup script to install git hooks

echo "🔧 Setting up git hooks..."
cp .git/hooks/pre-push .git/hooks/pre-push.bak 2>/dev/null || true

cat > .git/hooks/pre-push << 'EOF'
#!/bin/sh
# Pre-push hook to deploy the blog when pushing to master

current_branch=$(git symbolic-ref HEAD | sed -e 's,.*/\(.*\),\1,')

if [ "$current_branch" = "master" ]; then
    echo "🚀 Auto-deploying blog..."
    ./deploy.sh
fi

exit 0
EOF

chmod +x .git/hooks/pre-push
echo "✅ Git hooks installed! 'git push' will now auto-deploy."
