#!/bin/bash
# Shared prompts and system prompts for all v5 orchestration scripts

# System Prompt (for Claude CLI --system-prompt flag)
# Overrides default "short and concise" CLI instruction
SYSTEM_PROMPT="You are an expert property development analyst. Always provide full, detailed, comprehensive responses. Follow the prompt instructions exactly. Include all requested sections and details."

# Phase 0: Independent Generation
PROMPT_GENERATION="Generate 1-3 unique property search strategies based on the requirements in the context above."

# Phase 1: Cross-Validation (Critique)
PROMPT_CRITIQUE="Review all approaches for TECHNICAL AND BUSINESS CASE validity. Check: filter existence, syntax correctness, unit accuracy, capital feasibility, ROI calculations, and implementation viability. Preserve strategic diversity."

# Phase 1: Disagreement Analysis
PROMPT_DISAGREEMENT="Analyze critiques for TECHNICAL AND BUSINESS CASE DISAGREEMENTS only. Strategic differences are NOT disagreements."

# Phase 1.5: Technical Iteration
PROMPT_ITERATION="Reconsider your technical AND business case positions based on disagreements. Be evidence-based and precise. Note: For precedent-based approaches, business case is auto-valid (user requested); focus on filter accuracy."

# Phase 2: Synthesis
PROMPT_SYNTHESIS="Synthesize all approaches and critiques. Create validation matrix and extract ready-to-test approaches. Preserve diversity."

