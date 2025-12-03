#!/bin/bash
# Quick progress checker for Round 4 test

echo "╔══════════════════════════════════════════════════════════════╗"
echo "║  Round 4 Strategic Lens Test - Progress Check                ║"
echo "╚══════════════════════════════════════════════════════════════╝"
echo ""

# Check if processes are still running
echo "🔍 Checking running processes..."
PROCESSES=$(ps aux | grep -E "gemini|codex|opencode|claude" | grep -v grep | wc -l)
if [ "$PROCESSES" -gt 0 ]; then
    echo "   ⏳ Still running ($PROCESSES processes active)"
    ps aux | grep -E "gemini|codex|opencode|claude" | grep -v grep | awk '{print "      •", $11}'
else
    echo "   ✅ All processes completed"
fi
echo ""

# Check output files
echo "📄 Output files generated:"
OUTPUT_DIR="../01_DIVERGENT_GENERATION"
if [ -f "$OUTPUT_DIR/Gemini_Approaches.md" ]; then
    GEMINI_LINES=$(wc -l < "$OUTPUT_DIR/Gemini_Approaches.md")
    echo "   • Gemini: $GEMINI_LINES lines"
fi
if [ -f "$OUTPUT_DIR/Codex_Approaches.md" ]; then
    CODEX_LINES=$(wc -l < "$OUTPUT_DIR/Codex_Approaches.md")
    echo "   • Codex: $CODEX_LINES lines"
fi
if [ -f "$OUTPUT_DIR/Grok_Approaches.md" ]; then
    GROK_LINES=$(wc -l < "$OUTPUT_DIR/Grok_Approaches.md")
    echo "   • Grok: $GROK_LINES lines"
fi
if [ -f "$OUTPUT_DIR/Claude_Approaches.md" ]; then
    CLAUDE_LINES=$(wc -l < "$OUTPUT_DIR/Claude_Approaches.md")
    echo "   • Claude: $CLAUDE_LINES lines"
fi
echo ""

# Check log file
if [ -f "round4_test.log" ]; then
    echo "📋 Recent log entries:"
    tail -10 round4_test.log | sed 's/^/   /'
    echo ""
fi

# Check for completion
if [ -f "$OUTPUT_DIR/Gemini_Approaches.md" ] && \
   [ -f "$OUTPUT_DIR/Codex_Approaches.md" ] && \
   [ -f "$OUTPUT_DIR/Grok_Approaches.md" ] && \
   [ -f "$OUTPUT_DIR/Claude_Approaches.md" ] && \
   [ "$PROCESSES" -eq 0 ]; then
    echo "╔══════════════════════════════════════════════════════════════╗"
    echo "║  ✅ Round 4 Complete! Ready for analysis                     ║"
    echo "╚══════════════════════════════════════════════════════════════╝"
    echo ""
    echo "Next steps:"
    echo "  1. Compare Round 4 vs Round 3 diversity"
    echo "  2. Check if LLMs aligned with their strategic lenses"
    echo "  3. If successful → update master templates"
else
    echo "⏳ Round 4 still in progress... check back in a few minutes"
fi

