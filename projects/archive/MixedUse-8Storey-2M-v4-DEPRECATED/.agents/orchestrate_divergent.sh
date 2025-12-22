#!/bin/bash

# Multi-Agent Divergent Generation Orchestrator
# Runs 3 Claude agents in parallel, each with different analytical style

set -e

PROJECT_DIR="/home/ashsubband/landsignal/projects/MixedUse-8Storey-2M-v4"
AGENTS_DIR="$PROJECT_DIR/.agents"
CONTEXT_DIR="/home/ashsubband/landsignal"

echo "╔═══════════════════════════════════════════════════════════════════╗"
echo "║          Multi-Agent Divergent Generation System v3.1            ║"
echo "║                 3 Agents Running in Parallel                     ║"
echo "╚═══════════════════════════════════════════════════════════════════╝"
echo ""

# Create context package for all agents
create_context_package() {
    cat "$PROJECT_DIR/00_REQUIREMENTS/Requirements.md" \
        "$CONTEXT_DIR/SearchlandContext/AvailableFiltersInSearchLand_ACTUAL.md" \
        "$CONTEXT_DIR/FILTER_PATTERNS.md" \
        "$CONTEXT_DIR/PRESET_STRATEGY_GUIDE.md" \
        "$CONTEXT_DIR/LEARNINGS_DATABASE.md" > "$AGENTS_DIR/context_package.txt"
    
    echo "✅ Context package created ($(wc -l < $AGENTS_DIR/context_package.txt) lines)"
}

# Run Agent Gemini
run_agent_gemini() {
    echo ""
    echo "🤖 Starting Agent Gemini (Data-driven, Regulatory focus)..."
    
    cat "$AGENTS_DIR/agent_gemini_system.txt" "$AGENTS_DIR/context_package.txt" | \
    claude > "$PROJECT_DIR/01_DIVERGENT_GENERATION/AgentGemini_Output.md" 2>&1
    
    echo "✅ Agent Gemini complete: $PROJECT_DIR/01_DIVERGENT_GENERATION/AgentGemini_Output.md"
}

# Run Agent Codex
run_agent_codex() {
    echo ""
    echo "🤖 Starting Agent Codex (Creative, Workaround focus)..."
    
    cat "$AGENTS_DIR/agent_codex_system.txt" "$AGENTS_DIR/context_package.txt" | \
    claude > "$PROJECT_DIR/01_DIVERGENT_GENERATION/AgentCodex_Output.md" 2>&1
    
    echo "✅ Agent Codex complete: $PROJECT_DIR/01_DIVERGENT_GENERATION/AgentCodex_Output.md"
}

# Run Agent Claude
run_agent_claude() {
    echo ""
    echo "🤖 Starting Agent Claude (Behavioral, Motivation focus)..."
    
    cat "$AGENTS_DIR/agent_claude_system.txt" "$AGENTS_DIR/context_package.txt" | \
    claude > "$PROJECT_DIR/01_DIVERGENT_GENERATION/AgentClaude_Output.md" 2>&1
    
    echo "✅ Agent Claude complete: $PROJECT_DIR/01_DIVERGENT_GENERATION/AgentClaude_Output.md"
}

echo "═══════════════════════════════════════════════════════════════════"
echo "📦 STAGE 1: Preparing Context"
echo "═══════════════════════════════════════════════════════════════════"
create_context_package

echo ""
echo "═══════════════════════════════════════════════════════════════════"
echo "🚀 STAGE 2: Divergent Generation (Parallel Execution)"
echo "═══════════════════════════════════════════════════════════════════"
echo ""
echo "Launching 3 agents simultaneously..."
echo ""

# Run all agents in parallel
run_agent_gemini &
PID_GEMINI=$!

run_agent_codex &
PID_CODEX=$!

run_agent_claude &
PID_CLAUDE=$!

# Wait for all to complete
echo "⏳ Waiting for all agents to complete..."
echo "   • Agent Gemini (PID $PID_GEMINI)"
echo "   • Agent Codex (PID $PID_CODEX)"
echo "   • Agent Claude (PID $PID_CLAUDE)"
echo ""

wait $PID_GEMINI
wait $PID_CODEX
wait $PID_CLAUDE

echo ""
echo "═══════════════════════════════════════════════════════════════════"
echo "✅ STAGE 2 COMPLETE: All Agents Finished"
echo "═══════════════════════════════════════════════════════════════════"
echo ""
echo "📊 Results:"
ls -lh "$PROJECT_DIR/01_DIVERGENT_GENERATION/Agent"*"_Output.md" | awk '{print "   •", $9, "-", $5}'
echo ""
echo "Total approaches generated: 6 (2 per agent)"
echo ""
echo "═══════════════════════════════════════════════════════════════════"
echo "⏭️  NEXT: Stage 3 - Cross-Critique"
echo "═══════════════════════════════════════════════════════════════════"
echo ""
echo "Run: ./orchestrate_critique.sh"
echo ""

