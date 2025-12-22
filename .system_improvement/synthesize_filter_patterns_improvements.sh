#!/bin/bash

# FILTER_PATTERNS.md Improvement Synthesizer
# Claude synthesizes Gemini & Codex reviews into concrete improvements

set -e

IMPROVEMENT_DIR="/home/ashsubband/landsignal/.system_improvement"
CONTEXT_DIR="/home/ashsubband/landsignal"

echo "╔═══════════════════════════════════════════════════════════════════╗"
echo "║     FILTER_PATTERNS.md Improvement Synthesis - STAGE 2          ║"
echo "║   Claude Integrates Gemini & Codex & Grok Feedback              ║"
echo "╚═══════════════════════════════════════════════════════════════════╝"
echo ""

# Create synthesis context
create_synthesis_context() {
    echo "📦 Creating synthesis context..."
    
    cat > "$IMPROVEMENT_DIR/synthesis_prompt.txt" << 'SYNTHESIS_PROMPT'
# SYNTHESIS TASK: Integrate Peer Reviews into FILTER_PATTERNS.md

You are Claude, the original author of FILTER_PATTERNS.md. You've received peer reviews from THREE reviewers: Gemini, Codex, and Grok.

## YOUR TASK

Synthesize their feedback and create an IMPROVED version of FILTER_PATTERNS.md.

### Decision-Making Process:

**For Critiques of Existing Patterns:**
1. If ALL THREE reviewers agree on an improvement → Implement it (strong consensus)
2. If TWO reviewers agree and one is neutral → Implement it (majority consensus)
3. If TWO reviewers agree and one disagrees → Use your judgment based on evidence
4. If ONE suggests improvement and others are neutral → Implement if logical
5. If all THREE DISAGREE → Check iteration results, use your judgment, explain decision

**For New Pattern Suggestions:**
1. If TWO+ reviewers suggest similar pattern → Definitely add it
2. If ONE suggests and it's strong → Add it
3. If pattern overlaps with existing → Merge or explain why separate

**For Structure Changes:**
1. Prioritize changes that help ALL agents
2. Add navigational aids (tags, decision trees, round guides)
3. Keep what works, improve what doesn't

### Output Format:

```markdown
# FILTER_PATTERNS.md v2.0 (Post-Peer Review)

[Updated version of FILTER_PATTERNS.md incorporating all accepted feedback]
```

AND separately:

```markdown
# IMPROVEMENT_DECISIONS.md

## Summary of Changes

**Patterns Modified:** [Count]
**New Patterns Added:** [Count]
**Structure Changes:** [Count]

---

## PART 1: Existing Pattern Improvements

### Pattern X: [Name]

**Gemini Feedback:** [Summary]
**Codex Feedback:** [Summary]
**Grok Feedback:** [Summary]
**Decision:** [Accepted/Rejected/Modified]
**Rationale:** [Why]
**Changes Made:** [Specific changes]

[Repeat for each pattern that received feedback]

---

## PART 2: New Patterns Added

### NEW: Pattern X: [Name]

**Proposed By:** Gemini / Codex / Grok / Multiple
**Decision:** Added / Rejected / Merged with Pattern Y
**Rationale:** [Why]
**Final Implementation:** [How it appears in v2.0]

[Repeat for each new pattern proposal]

---

## PART 3: Structure & Usability Changes

### Change: [Name]

**Proposed By:** Gemini / Codex / Both
**Decision:** Implemented / Rejected / Modified
**Rationale:** [Why]
**Implementation:** [What was changed]

[Repeat for each structural suggestion]

---

## PART 4: Rejected Feedback

### Rejected: [Suggestion]

**Proposed By:** [Gemini/Codex]
**Why Rejected:** [Clear explanation]

[Be transparent about what wasn't accepted and why]

---

## SUMMARY METRICS

**Gemini Suggestions:** [X accepted / Y total]
**Codex Suggestions:** [X accepted / Y total]
**Consensus Changes:** [X changes where both agreed]
**Judgment Calls:** [X changes where Claude decided]

**Overall Improvement:** [Qualitative assessment of how much better v2.0 is]
```

---

### Critical Rules:

1. **Be Honest About Trade-offs**
   - If simplifying for Gemini complicates for Codex, acknowledge it
   - Document why you chose one approach over another

2. **Maintain Pattern Quality**
   - Don't add patterns just to please reviewers
   - Ensure new patterns are truly reusable (not one-off)
   - Keep strategic rationale clear

3. **Improve Usability for ALL**
   - If Gemini wants tags and Codex wants decision trees → Add both
   - If one wants more detail and other wants brevity → Use collapsible sections
   - Optimize for collaborative workflow (all agents use same doc)

4. **Update Cross-References**
   - If patterns change, update PRESET_STRATEGY_GUIDE.md links
   - Update Requirements template if pattern organization changes
   - Update orchestrate_collaborative.sh if round guidance added

5. **Version Control**
   - Clearly mark as v2.0
   - Keep changelog of what changed
   - Note in header: "Post-Peer Review (Gemini & Codex)"

---

## REFERENCE FILES

- Current FILTER_PATTERNS.md (original)
- PresetFiltersBuiltIntoSearchLand.md ⭐ (raw 86 presets - verify reviewer claims)
- PRESET_STRATEGY_GUIDE.md (your original analysis)
- Review_Gemini.md (Gemini's feedback)
- Review_Codex.md (Codex's feedback)
- Review_Grok.md (Grok's feedback)

**CRITICAL:** If reviewers say "Preset #47 should be Pattern 14" or "Preset #52 is miscategorized", 
you need to READ those raw presets to verify their claims before accepting/rejecting.

---

**BEGIN SYNTHESIS NOW**

Your goal: Create a BETTER FILTER_PATTERNS.md that all 4 agents (Claude, Gemini, Codex, Grok) will use effectively.
SYNTHESIS_PROMPT

    # Append reviews
    cat "$IMPROVEMENT_DIR/Review_Gemini.md" \
        "$IMPROVEMENT_DIR/Review_Codex.md" \
        "$IMPROVEMENT_DIR/Review_Grok.md" >> "$IMPROVEMENT_DIR/synthesis_prompt.txt"
    
    # Include iterations if they exist (reviewers reconsidered their positions)
    if [ -f "$IMPROVEMENT_DIR/Iteration_Gemini.md" ] || [ -f "$IMPROVEMENT_DIR/Iteration_Codex.md" ] || [ -f "$IMPROVEMENT_DIR/Iteration_Grok.md" ]; then
        echo "" >> "$IMPROVEMENT_DIR/synthesis_prompt.txt"
        echo "=== UPDATED POSITIONS AFTER ITERATION ===" >> "$IMPROVEMENT_DIR/synthesis_prompt.txt"
        echo "" >> "$IMPROVEMENT_DIR/synthesis_prompt.txt"
        
        # Only include iteration files that exist
        [ -f "$IMPROVEMENT_DIR/Iteration_Gemini.md" ] && cat "$IMPROVEMENT_DIR/Iteration_Gemini.md" >> "$IMPROVEMENT_DIR/synthesis_prompt.txt"
        [ -f "$IMPROVEMENT_DIR/Iteration_Codex.md" ] && cat "$IMPROVEMENT_DIR/Iteration_Codex.md" >> "$IMPROVEMENT_DIR/synthesis_prompt.txt"
        [ -f "$IMPROVEMENT_DIR/Iteration_Grok.md" ] && cat "$IMPROVEMENT_DIR/Iteration_Grok.md" >> "$IMPROVEMENT_DIR/synthesis_prompt.txt"
        
        echo "" >> "$IMPROVEMENT_DIR/synthesis_prompt.txt"
        echo "NOTE: Use the UPDATED positions above when they exist. Iteration happened because of disagreements." >> "$IMPROVEMENT_DIR/synthesis_prompt.txt"
    fi
    
    # Append reference materials (for verifying reviewer claims)
    echo "" >> "$IMPROVEMENT_DIR/synthesis_prompt.txt"
    echo "=== REFERENCE MATERIALS ===" >> "$IMPROVEMENT_DIR/synthesis_prompt.txt"
    echo "" >> "$IMPROVEMENT_DIR/synthesis_prompt.txt"
    
    cat "$CONTEXT_DIR/FILTER_PATTERNS.md" \
        "$CONTEXT_DIR/SearchlandContext/PresetFiltersBuiltIntoSearchLand.md" \
        "$CONTEXT_DIR/PRESET_STRATEGY_GUIDE.md" >> "$IMPROVEMENT_DIR/synthesis_prompt.txt"
    
    echo "✅ Synthesis context created ($(wc -l < $IMPROVEMENT_DIR/synthesis_prompt.txt) lines)"
}

# Run synthesis
run_synthesis() {
    echo ""
    echo "🤖 Running synthesis (Claude integrating feedback)..."
    
    cat "$IMPROVEMENT_DIR/synthesis_prompt.txt" | \
    claude > "$IMPROVEMENT_DIR/SYNTHESIS_OUTPUT.md" 2>&1
    
    echo "✅ Synthesis complete"
}

# Extract improved FILTER_PATTERNS.md
extract_improved_version() {
    echo ""
    echo "📝 Extracting improved FILTER_PATTERNS.md v2.0..."
    
    # This will need manual extraction or parsing
    # For now, just note that it's in SYNTHESIS_OUTPUT.md
    
    echo "⚠️  Manual step required:"
    echo "   1. Review: $IMPROVEMENT_DIR/SYNTHESIS_OUTPUT.md"
    echo "   2. Extract 'FILTER_PATTERNS.md v2.0' section"
    echo "   3. Extract 'IMPROVEMENT_DECISIONS.md' section"
    echo "   4. Replace: $CONTEXT_DIR/FILTER_PATTERNS.md"
    echo "   5. Create: $IMPROVEMENT_DIR/IMPROVEMENT_DECISIONS.md"
}

# Main execution
echo "═══════════════════════════════════════════════════════════════════"
echo "STAGE 1: Preparing Synthesis Context"
echo "═══════════════════════════════════════════════════════════════════"
create_synthesis_context

echo ""
echo "═══════════════════════════════════════════════════════════════════"
echo "STAGE 2: Running Synthesis"
echo "═══════════════════════════════════════════════════════════════════"
run_synthesis

echo ""
echo "═══════════════════════════════════════════════════════════════════"
echo "STAGE 3: Extraction (Manual)"
echo "═══════════════════════════════════════════════════════════════════"
extract_improved_version

echo ""
echo "═══════════════════════════════════════════════════════════════════"
echo "✅ SYNTHESIS COMPLETE"
echo "═══════════════════════════════════════════════════════════════════"
echo ""
echo "📊 Review synthesis output:"
echo "   • $IMPROVEMENT_DIR/SYNTHESIS_OUTPUT.md"
echo ""
echo "⏭️  Next: Extract and apply improvements (manual for now)"
echo ""

