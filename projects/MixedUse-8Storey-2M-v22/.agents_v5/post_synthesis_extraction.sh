#!/bin/bash

# Post-Synthesis Extraction Script - v5.2.3
# Extracts individual approach files from SYNTHESIS_OUTPUT.md
# Can be run standalone or called from orchestrate_synthesis.sh

set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_DIR="$(cd "$SCRIPT_DIR/.." && pwd)"
VALIDITY_DIR="$PROJECT_DIR/02_VALIDITY_CHECK"
TESTING_DIR="$PROJECT_DIR/03_PARALLEL_TESTING"
SYNTHESIS_FILE="$VALIDITY_DIR/SYNTHESIS_OUTPUT.md"

echo ""
echo "╔══════════════════════════════════════════════════════════════╗"
echo "║  Post-Synthesis Extraction                                   ║"
echo "╚══════════════════════════════════════════════════════════════╝"
echo ""

# Check if synthesis output exists
if [ ! -f "$SYNTHESIS_FILE" ]; then
    echo "❌ ERROR: SYNTHESIS_OUTPUT.md not found at $SYNTHESIS_FILE"
    echo "   Run orchestrate_synthesis.sh first"
    exit 1
fi

echo "📊 Found SYNTHESIS_OUTPUT.md ($(wc -l < "$SYNTHESIS_FILE") lines)"

# Create testing directory
mkdir -p "$TESTING_DIR"

# Extract individual approaches
# Format expected: # **APPROACH X: Name**
echo ""
echo "🔄 Extracting individual approach files..."
echo ""

# Use awk to extract each approach section
awk '
BEGIN { 
    in_approach = 0
    approach_letter = ""
    output_file = ""
}

# Detect start of new approach (e.g., "# **APPROACH A:")
/^# \*\*APPROACH [A-Z]:/ {
    # Close previous file if open
    if (in_approach == 1 && output_file != "") {
        close(output_file)
    }
    
    # Extract letter (A, B, C, etc.)
    match($0, /APPROACH ([A-Z]):/, arr)
    approach_letter = arr[1]
    
    # Create output filename
    output_file = "'"$TESTING_DIR"'/Approach" approach_letter "_ReadyToTest.md"
    
    print "  → Extracting Approach " approach_letter " to " output_file
    
    in_approach = 1
    
    # Write the header line
    print $0 > output_file
    next
}

# Detect end of approach section (next ## or #)
/^# \*\*APPROACH [A-Z]:/ && in_approach == 1 {
    # This is actually handled above, but keep for clarity
}

# Detect end of all approaches (e.g., "**END OF SYNTHESIS")
/^\*\*END OF SYNTHESIS/ || /^\*\*Total Files Generated/ {
    if (in_approach == 1 && output_file != "") {
        close(output_file)
        in_approach = 0
    }
    next
}

# Write content to current approach file
in_approach == 1 {
    print $0 >> output_file
}
' "$SYNTHESIS_FILE"

echo ""
echo "✅ Extraction complete"
echo ""

# Count extracted files
extracted_count=$(ls -1 "$TESTING_DIR"/Approach*_ReadyToTest.md 2>/dev/null | wc -l)

if [ "$extracted_count" -eq 0 ]; then
    echo "❌ ERROR: No approach files extracted"
    echo "   Check SYNTHESIS_OUTPUT.md format"
    echo "   Expected format: # **APPROACH X: Name**"
    exit 1
fi

echo "📊 Summary:"
echo "  • Approaches extracted: $extracted_count"
echo ""

# List extracted files
echo "📂 Files created:"
for file in "$TESTING_DIR"/Approach*_ReadyToTest.md; do
    if [ -f "$file" ]; then
        filename=$(basename "$file")
        lines=$(wc -l < "$file")
        echo "  ✅ $filename ($lines lines)"
    fi
done

echo ""
echo "╔══════════════════════════════════════════════════════════════╗"
echo "║  ✅ Extraction Complete                                      ║"
echo "╚══════════════════════════════════════════════════════════════╝"
echo ""
echo "Next: Run remainder of orchestrate_synthesis.sh to create ExecutiveSummary.md"
echo "Or: Manually review extracted files in $TESTING_DIR"
echo ""

