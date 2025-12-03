#!/bin/bash

# FILTER_PATTERNS.md Peer Review Orchestrator
# Runs Gemini and Codex reviews in parallel

set -e

IMPROVEMENT_DIR="/home/ashsubband/landsignal/.system_improvement"
CONTEXT_DIR="/home/ashsubband/landsignal"

echo "╔═══════════════════════════════════════════════════════════════════╗"
echo "║       FILTER_PATTERNS.md Peer Review System - STAGE 2           ║"
echo "║     Gemini & Codex & Grok Review Claude's Pattern Work          ║"
echo "╚═══════════════════════════════════════════════════════════════════╝"
echo ""

# Create backup first!
create_backup() {
    echo "═══════════════════════════════════════════════════════════════════"
    echo "STAGE 0: Creating Backup"
    echo "═══════════════════════════════════════════════════════════════════"
    echo ""
    
    TIMESTAMP=$(date +%Y%m%d_%H%M%S)
    BACKUP_FILE="$IMPROVEMENT_DIR/FILTER_PATTERNS_BACKUP_${TIMESTAMP}.md"
    
    cp "$CONTEXT_DIR/FILTER_PATTERNS.md" "$BACKUP_FILE"
    
    echo "✅ Backup created: $BACKUP_FILE"
    echo ""
}

create_backup

# Create review context package
create_review_context() {
    echo "📦 Creating review context package..."
    
    cat "$IMPROVEMENT_DIR/FILTER_PATTERNS_REVIEW_PROMPT.md" \
        "$CONTEXT_DIR/FILTER_PATTERNS.md" \
        "$CONTEXT_DIR/SearchlandContext/PresetFiltersBuiltIntoSearchLand.md" \
        "$CONTEXT_DIR/PRESET_STRATEGY_GUIDE.md" \
        "$CONTEXT_DIR/LEARNINGS_DATABASE.md" \
        "$CONTEXT_DIR/SearchlandContext/AvailableFiltersInSearchLand_ACTUAL.md" \
        > "$IMPROVEMENT_DIR/review_context_full.txt"
    
    echo "✅ Review context created ($(wc -l < $IMPROVEMENT_DIR/review_context_full.txt) lines)"
}

# Gemini review
review_gemini() {
    echo ""
    echo "🤖 Running Gemini review..."
    
    cat "$IMPROVEMENT_DIR/review_context_full.txt" | \
    gemini -p "You are Gemini, an expert property analyst. Review FILTER_PATTERNS.md as instructed in the prompt." \
    > "$IMPROVEMENT_DIR/Review_Gemini.md" 2>&1
    
    echo "✅ Gemini review complete"
}

# Codex review
review_codex() {
    echo ""
    echo "🤖 Running Codex review..."
    
    # Codex doesn't read stdin - must give it file path
    codex exec --skip-git-repo-check "Read the file at $IMPROVEMENT_DIR/review_context_full.txt. You are Codex, an expert property analyst. Review FILTER_PATTERNS.md as instructed in the prompt." \
    > "$IMPROVEMENT_DIR/Review_Codex.md" 2>&1
    
    echo "✅ Codex review complete"
}

# Grok review
review_grok() {
    echo ""
    echo "🤖 Running Grok review..."
    
    cat "$IMPROVEMENT_DIR/review_context_full.txt" | \
    opencode run -m opencode/grok-code "You are Grok, an expert property analyst. Review FILTER_PATTERNS.md as instructed in the prompt." \
    > "$IMPROVEMENT_DIR/Review_Grok.md" 2>&1
    
    echo "✅ Grok review complete"
}

# Main execution
echo "═══════════════════════════════════════════════════════════════════"
echo "STAGE 1: Preparing Review Context"
echo "═══════════════════════════════════════════════════════════════════"
create_review_context

echo ""
echo "═══════════════════════════════════════════════════════════════════"
echo "STAGE 2: Running Parallel Reviews (3 Reviewers)"
echo "═══════════════════════════════════════════════════════════════════"
echo ""
echo "Launching Gemini, Codex, and Grok reviews in parallel..."
echo ""

# Run in parallel
review_gemini &
PID_GEMINI=$!

review_codex &
PID_CODEX=$!

review_grok &
PID_GROK=$!

# Wait for completion
echo "⏳ Waiting for reviews to complete..."
echo "   • Gemini review (PID $PID_GEMINI)"
echo "   • Codex review (PID $PID_CODEX)"
echo "   • Grok review (PID $PID_GROK)"
echo ""

wait $PID_GEMINI
wait $PID_CODEX
wait $PID_GROK

echo ""
echo "═══════════════════════════════════════════════════════════════════"
echo "✅ INITIAL REVIEWS COMPLETE"
echo "═══════════════════════════════════════════════════════════════════"
echo ""
echo "📊 Results:"
ls -lh "$IMPROVEMENT_DIR/Review_"*".md" | awk '{print "   •", $9, "-", $5}'
echo ""

# Check for disagreements
check_disagreements() {
    echo "═══════════════════════════════════════════════════════════════════"
    echo "STAGE 3: Checking for Significant Disagreements"
    echo "═══════════════════════════════════════════════════════════════════"
    echo ""
    echo "Analyzing reviews for major conflicts..."
    echo ""
    
    # Create disagreement check prompt
    cat > "$IMPROVEMENT_DIR/disagreement_check.txt" << 'DISAGREE_CHECK'
You are analyzing THREE peer reviews for disagreements.

## YOUR TASK

Review Gemini, Codex, and Grok critiques and determine if there are SIGNIFICANT DISAGREEMENTS.

**SIGNIFICANT DISAGREEMENT means:**
- One says pattern is "clear" and others say "unclear" (split opinion)
- One suggests adding pattern X, another suggests removing/merging pattern X
- One suggests structure change that contradicts another's suggestion
- One ranks pattern as #1 priority, another ranks it as #10
- 2 reviewers agree on something, but the 3rd strongly disagrees

**NOT significant:**
- Minor wording differences
- All critique same pattern but suggest different improvements (all valid)
- One suggests more patterns than others (additive, not conflicting)
- All three agree (consensus!)

## OUTPUT FORMAT

```
DISAGREEMENT ANALYSIS:

Total Patterns Reviewed: 13 (or current count)
Reviewers: Gemini, Codex, Grok
Significant Disagreements Found: [Count]

[If count > 0:]

### Disagreement 1: [Pattern Name or Topic]
**Gemini Position:** [Summary]
**Codex Position:** [Summary]
**Grok Position:** [Summary]
**Conflict:** [Why these positions conflict]
**Requires Iteration:** YES / NO

[Repeat for each significant disagreement]

---

RECOMMENDATION: [ITERATE / PROCEED TO SYNTHESIS]
```

If ≥2 significant disagreements OR any disagreement marked "Requires Iteration: YES" → Recommend ITERATE
Otherwise → Recommend PROCEED TO SYNTHESIS

---

DISAGREE_CHECK

    cat "$IMPROVEMENT_DIR/Review_Gemini.md" \
        "$IMPROVEMENT_DIR/Review_Codex.md" \
        "$IMPROVEMENT_DIR/Review_Grok.md" >> "$IMPROVEMENT_DIR/disagreement_check.txt"
    
    # Run disagreement check
    cat "$IMPROVEMENT_DIR/disagreement_check.txt" | \
    claude > "$IMPROVEMENT_DIR/DISAGREEMENT_ANALYSIS.md" 2>&1
    
    echo "✅ Disagreement analysis complete"
    
    # Check if iteration needed
    if grep -q "RECOMMENDATION: ITERATE" "$IMPROVEMENT_DIR/DISAGREEMENT_ANALYSIS.md"; then
        echo ""
        echo "⚠️  SIGNIFICANT DISAGREEMENTS DETECTED"
        echo ""
        return 1  # Iteration needed
    else
        echo ""
        echo "✅ No significant disagreements - ready for synthesis"
        echo ""
        return 0  # No iteration needed
    fi
}

# Run iteration if needed
run_iteration() {
    echo "═══════════════════════════════════════════════════════════════════"
    echo "STAGE 4: ITERATION - Resolving Disagreements"
    echo "═══════════════════════════════════════════════════════════════════"
    echo ""
    echo "All three reviewers will reconsider positions based on each other's feedback..."
    echo ""
    
    # Create iteration context
    cat > "$IMPROVEMENT_DIR/iteration_context.txt" << 'ITER_PROMPT'
# ITERATION: Reconsider Your Review

You provided an initial review of FILTER_PATTERNS.md. Another reviewer (Gemini/Codex) has also provided their review.

## DISAGREEMENTS IDENTIFIED

[Disagreement analysis will be included below]

## YOUR TASK

For EACH disagreement where you're involved:

1. **Read the other reviewer's position carefully**
2. **Reconsider your position:**
   - Were you wrong? (Admit it and update)
   - Were they wrong? (Explain why you're sticking to your position)
   - Were you both partially right? (Propose a synthesis)
3. **Update your position if warranted**

## OUTPUT FORMAT

For each disagreement:

```
### Disagreement: [Topic]

**My Original Position:** [What I said]
**Other Reviewer's Position:** [What they said]

**Upon Reconsideration:**
- [Have I changed my mind? Why/why not?]
- [Updated position if changed]
- [If unchanged: Why I'm confident in original position]

**FINAL POSITION:** [Clear statement]
```

Be intellectually honest. If the other reviewer made a good point you missed, acknowledge it.

---

ITER_PROMPT

    # Gemini iteration
    cat "$IMPROVEMENT_DIR/iteration_context.txt" \
        "$IMPROVEMENT_DIR/DISAGREEMENT_ANALYSIS.md" \
        "$IMPROVEMENT_DIR/Review_Gemini.md" \
        "$IMPROVEMENT_DIR/Review_Codex.md" \
        "$IMPROVEMENT_DIR/Review_Grok.md" > "$IMPROVEMENT_DIR/iteration_gemini_context.txt"
    
    echo "🤖 Gemini reconsidering positions..."
    cat "$IMPROVEMENT_DIR/iteration_gemini_context.txt" | \
    gemini -p "You are Gemini. Reconsider your review based on Codex and Grok's feedback." \
    > "$IMPROVEMENT_DIR/Iteration_Gemini.md" 2>&1 &
    PID_GEMINI=$!
    
    # Codex iteration
    cat "$IMPROVEMENT_DIR/iteration_context.txt" \
        "$IMPROVEMENT_DIR/DISAGREEMENT_ANALYSIS.md" \
        "$IMPROVEMENT_DIR/Review_Codex.md" \
        "$IMPROVEMENT_DIR/Review_Gemini.md" \
        "$IMPROVEMENT_DIR/Review_Grok.md" > "$IMPROVEMENT_DIR/iteration_codex_context.txt"
    
    echo "🤖 Codex reconsidering positions..."
    cat "$IMPROVEMENT_DIR/iteration_codex_context.txt" | \
    codex exec --skip-git-repo-check "You are Codex. Reconsider your review based on Gemini and Grok's feedback." \
    > "$IMPROVEMENT_DIR/Iteration_Codex.md" 2>&1 &
    PID_CODEX=$!
    
    # Grok iteration
    cat "$IMPROVEMENT_DIR/iteration_context.txt" \
        "$IMPROVEMENT_DIR/DISAGREEMENT_ANALYSIS.md" \
        "$IMPROVEMENT_DIR/Review_Grok.md" \
        "$IMPROVEMENT_DIR/Review_Gemini.md" \
        "$IMPROVEMENT_DIR/Review_Codex.md" > "$IMPROVEMENT_DIR/iteration_grok_context.txt"
    
    echo "🤖 Grok reconsidering positions..."
    cat "$IMPROVEMENT_DIR/iteration_grok_context.txt" | \
    opencode run -m opencode/grok-code "You are Grok. Reconsider your review based on Gemini and Codex's feedback." \
    > "$IMPROVEMENT_DIR/Iteration_Grok.md" 2>&1 &
    PID_GROK=$!
    
    # Wait for all three
    echo ""
    echo "⏳ Waiting for iteration to complete..."
    echo "   • Gemini iteration (PID $PID_GEMINI)"
    echo "   • Codex iteration (PID $PID_CODEX)"
    echo "   • Grok iteration (PID $PID_GROK)"
    echo ""
    
    wait $PID_GEMINI
    wait $PID_CODEX
    wait $PID_GROK
    
    echo "✅ Iteration complete"
    echo ""
    echo "📊 Updated positions:"
    ls -lh "$IMPROVEMENT_DIR/Iteration_"*".md" | awk '{print "   •", $9, "-", $5}'
}

# Execute disagreement check
if check_disagreements; then
    echo "═══════════════════════════════════════════════════════════════════"
    echo "⏭️  READY FOR SYNTHESIS (No Iteration Needed)"
    echo "═══════════════════════════════════════════════════════════════════"
else
    # Disagreements found - iterate
    run_iteration
    echo ""
    echo "═══════════════════════════════════════════════════════════════════"
    echo "⏭️  READY FOR SYNTHESIS (After Iteration)"
    echo "═══════════════════════════════════════════════════════════════════"
fi

echo ""
echo "Run: ./synthesize_filter_patterns_improvements.sh"
echo ""

