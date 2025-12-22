#!/bin/bash

# Test Claude spawned as background subprocess (exactly like orchestrate_independent.sh does it)
# We run THIS script in foreground, but it spawns Claude in background

set -e

echo "========================================"
echo "Testing Claude Spawned as Background"
echo "========================================"
echo "This mimics the exact flow:"
echo "  RUN_ALL_ITERATIVE_v5.sh (foreground)"
echo "    → orchestrate_independent.sh (foreground)"
echo "      → run_claude() { ... } & (background)"
echo ""

TEST_DIR="/tmp/claude_spawn_test_$$"
mkdir -p "$TEST_DIR"

# Create test context
cat > "$TEST_DIR/test_context.txt" << 'EOF'
Please respond with: "Spawned subprocess SUCCESS"
EOF

echo "Test directory: $TEST_DIR"
echo ""

# This function mimics run_claude() from line 184-198 of orchestrate_independent.sh
run_claude() {
    if [ -z "$CLAUDE_LIMIT_HIT" ]; then
        echo "🔵 Running Claude..."
        echo "   Testing spawned subprocess"
        
        cat "$TEST_DIR/test_context.txt" | \
        claude --system-prompt "You are a test assistant" -p "Please respond with: SUCCESS" \
        > "$TEST_DIR/Claude_Output.md" 2>&1
        
        echo "✅ Claude complete"
    fi
}

# Spawn Claude in background (exactly like orchestrate_independent.sh line 235)
echo "Spawning Claude in background..."
run_claude &
CLAUDE_PID=$!

echo "Claude PID: $CLAUDE_PID"
echo ""

# Wait for it (exactly like orchestrate_independent.sh line 238)
echo "⏳ Waiting for Claude to complete..."
wait $CLAUDE_PID
CLAUDE_EXIT=$?

echo ""
echo "Claude exit code: $CLAUDE_EXIT"
echo ""

if [ $CLAUDE_EXIT -eq 0 ]; then
    echo "✓ SUCCESS - Claude executed properly"
    echo ""
    echo "Output from Claude:"
    echo "-------------------"
    cat "$TEST_DIR/Claude_Output.md"
    echo "-------------------"
else
    echo "✗ FAILURE - Claude failed"
    echo ""
    echo "Error output:"
    echo "-------------"
    cat "$TEST_DIR/Claude_Output.md"
    echo "-------------"
fi

# Cleanup
rm -rf "$TEST_DIR"

echo ""
echo "========================================"
echo "Test Complete"
echo "========================================"

