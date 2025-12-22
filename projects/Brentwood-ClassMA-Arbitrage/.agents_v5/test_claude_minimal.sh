#!/bin/bash

# Minimal test to replicate Claude command failure
# This mimics the exact environment of orchestrate_independent.sh

set -e

echo "========================================"
echo "Testing Claude Command in Subprocess"
echo "========================================"
echo ""

# Create test directory
TEST_DIR="/tmp/claude_test_$$"
mkdir -p "$TEST_DIR"

# Create a test context file (similar to shared_context.txt)
cat > "$TEST_DIR/test_context.txt" << 'EOF'
# Test Context

This is a minimal test context to verify Claude command execution.

## Requirements

Please respond with: "Claude command executed successfully in subprocess"
EOF

echo "✓ Test context created at: $TEST_DIR/test_context.txt"
echo ""

# Test 1: Check if claude is in PATH
echo "Test 1: Checking if 'claude' is in PATH..."
if command -v claude &> /dev/null; then
    echo "✓ claude found at: $(which claude)"
else
    echo "✗ claude NOT found in PATH"
    echo "Current PATH: $PATH"
fi
echo ""

# Test 2: Try running claude with the exact syntax from orchestrate_independent.sh
echo "Test 2: Running claude with exact syntax from script..."
echo "Command: cat \$TEST_DIR/test_context.txt | claude --system-prompt \"Test\" -p \"Respond with SUCCESS\" > output.txt 2>&1"
echo ""

cat "$TEST_DIR/test_context.txt" | \
claude --system-prompt "You are a test assistant" -p "Please respond with only the word SUCCESS" \
> "$TEST_DIR/claude_output.txt" 2>&1

echo "✓ Claude command completed"
echo ""

# Show output
echo "Output from Claude:"
echo "-------------------"
cat "$TEST_DIR/claude_output.txt"
echo "-------------------"
echo ""

# Cleanup
echo "Cleaning up test directory: $TEST_DIR"
rm -rf "$TEST_DIR"

echo ""
echo "========================================"
echo "Test completed successfully!"
echo "========================================"

