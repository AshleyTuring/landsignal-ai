# Multi-Agent Filter Generation System v3.1

**Purpose:** Generate diverse SearchLand filter strategies through parallel multi-agent orchestration.

---

## Overview

This system uses **3 Claude agents** running in parallel, each with a different analytical style:

| Agent | Analytical Style | Focus Areas |
|-------|------------------|-------------|
| **Gemini** | Data-driven, Quantitative | Regulatory compliance, Statistical signals, Emerging patterns |
| **Codex** | Creative, Unconventional | Workarounds, Arbitrage, Structural innovation, First-mover |
| **Claude** | Behavioral, Psychological | Motivation signals, Deal psychology, Risk-reward balance |

Each agent generates **2 approaches** (total: **6 diverse approaches**), then all agents **critique each other's work**, and finally a **consensus synthesis** determines which approaches are technically valid for testing.

---

## Workflow

### Phase 1: Divergent Generation (Parallel)
```
Agent Gemini → Approach A + Approach B
Agent Codex  → Approach C + Approach D
Agent Claude → Approach E + Approach F
```
**Duration:** ~2-3 minutes (parallel execution)  
**Output:** 6 diverse filter strategies

### Phase 2: Cross-Critique (Parallel)
```
Agent Gemini → Reviews ALL 6 approaches (technical validation)
Agent Codex  → Reviews ALL 6 approaches (technical validation)
Agent Claude → Reviews ALL 6 approaches (technical validation)
```
**Duration:** ~2-3 minutes (parallel execution)  
**Output:** 3 critique reports (18 total validations)

### Phase 3: Consensus Synthesis
```
Synthesis Agent → Analyzes all 3 critiques
                → Determines which approaches are VALID/CONDITIONAL/INVALID
                → Creates final validation matrix
                → Prioritizes approaches for testing
```
**Duration:** ~1-2 minutes  
**Output:** Final validation matrix with YES/NO decisions

---

## Quick Start

### Option 1: Run All Phases (Recommended)
```bash
cd /home/ashsubband/landsignal/projects/MixedUse-8Storey-2M-v3/.agents
./RUN_ALL.sh
```

This will:
1. Generate 6 approaches (Phase 1)
2. Critique all 6 approaches (Phase 2)
3. Synthesize consensus (Phase 3)
4. Output final validation matrix

**Total Time:** ~5-10 minutes

### Option 2: Run Phases Individually

**Phase 1 Only:**
```bash
./orchestrate_divergent.sh
```

**Phase 2 Only (after Phase 1):**
```bash
./orchestrate_critique.sh
```

**Phase 3 Only (after Phase 2):**
```bash
./orchestrate_consensus.sh
```

---

## Key Files

### System Configuration
- `agent_gemini_system.txt` - Gemini agent instructions
- `agent_codex_system.txt` - Codex agent instructions
- `agent_claude_system.txt` - Claude agent instructions

### Orchestration Scripts
- `RUN_ALL.sh` - Master launcher (all 3 phases)
- `orchestrate_divergent.sh` - Phase 1: Divergent generation
- `orchestrate_critique.sh` - Phase 2: Cross-critique
- `orchestrate_consensus.sh` - Phase 3: Consensus synthesis

### Generated Files (After Running)
- `context_package.txt` - Shared context (requirements + knowledge base)
- `critique_context.txt` - Context for critique phase
- `consensus_context.txt` - Context for consensus phase

---

## Outputs

### Phase 1 Outputs
Located in: `../01_DIVERGENT_GENERATION/`

- `AgentGemini_Output.md` - Approach A + Approach B
- `AgentCodex_Output.md` - Approach C + Approach D
- `AgentClaude_Output.md` - Approach E + Approach F

### Phase 2 Outputs
Located in: `../02_VALIDITY_CHECK/`

- `Critique_Gemini.md` - Gemini's validation of all 6
- `Critique_Codex.md` - Codex's validation of all 6
- `Critique_Claude.md` - Claude's validation of all 6

### Phase 3 Output
Located in: `../02_VALIDITY_CHECK/`

- **`FINAL_ValidationMatrix.md`** ⭐ - Final YES/NO decisions for each approach

---

## Validation Criteria

Each agent checks:

1. ✅ **Filter Existence** - Do filters exist in AvailableFiltersInSearchLand_ACTUAL.md?
2. ✅ **Correct Units** - acres (not sqm), sqft (not sqm), metres?
3. ✅ **Valid Syntax** - Per LEARNINGS_DATABASE.md?
4. ✅ **Logical Coherence** - No contradictions?
5. ✅ **Capital Feasibility** - Can £200k enable this?

### Validation Outcomes
- ✅ **VALID** - All agents agree, proceed to testing
- ⚠️ **CONDITIONAL** - Minor issues, fixable, proceed with fixes
- ❌ **INVALID** - Critical issues, do not test

---

## After Running

1. **Review** `FINAL_ValidationMatrix.md` to see which approaches are valid
2. **Extract filters** from VALID/CONDITIONAL approaches
3. **Test in SearchLand** across geographies (Slough, Birmingham, Manchester)
4. **Document results** in `../03_PARALLEL_TESTING/`
5. **Capture learnings** in `/LEARNINGS_DATABASE.md`

---

## Philosophy

### Why Multi-Agent?

**Divergent Thinking:**
- 3 different analytical styles = broader strategy coverage
- Reduces groupthink and blind spots
- Explores different strategic angles simultaneously

**Cross-Validation:**
- Each approach reviewed by 3 independent agents
- Catches technical errors before testing
- Consensus-driven validation (not single opinion)

**Empirical Testing:**
- ALL valid approaches tested in parallel
- Real SearchLand results decide winners
- No premature convergence

### Why NOT Single Agent?

❌ Single agent = single perspective = missed opportunities  
❌ Self-critique = confirmation bias  
❌ Iterative refinement = premature convergence  

✅ Multi-agent = diverse strategies = empirical validation  

---

## Requirements

- **Claude CLI** installed and authenticated
- **Bash** shell (Linux/Mac/WSL)
- **Project requirements** filled in `../00_REQUIREMENTS/Requirements.md`

---

## Troubleshooting

**Issue:** "claude: command not found"  
**Fix:** Install Claude CLI or run agents manually (Option A from earlier)

**Issue:** "Permission denied"  
**Fix:** `chmod +x *.sh`

**Issue:** "API authentication error"  
**Fix:** Run `claude login` to authenticate

**Issue:** Agents taking too long  
**Fix:** Normal for large context. Wait 2-3 min per phase.

---

## Version History

- **v3.1** (2025-11-19) - Multi-agent system with 86 preset insights
- **v3.0** (2025-11-19) - Divergent hypothesis testing methodology
- **v2.x** (2025-01-19) - Multi-iteration consensus (deprecated)

---

## Credits

**System Design:** Multi-agent divergent hypothesis testing  
**Knowledge Base:** 86 SearchLand presets, 35 strategies, 16 motivation signals  
**Methodology:** Parallel generation → Cross-critique → Consensus → Empirical testing

---

**Questions?** See `/MASTER_SetupFilters.md` for full methodology documentation.

