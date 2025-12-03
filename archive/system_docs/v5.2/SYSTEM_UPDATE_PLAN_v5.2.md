# System Update Plan v5.1 → v5.2

**Date:** 2025-11-20  
**Goal:** Implement comprehensive Stages 4-6 workflow with structured validation and research process

---

## Changes Required

### 1. Update orchestrate_synthesis.sh
**Current:** Simple "copy prompt to SearchLand" instructions  
**New:** Reference to Stage 4 (Refinement) workflow

### 2. Create Stage 4 Workflow Scripts
**New files needed:**
- `04_REFINEMENT/README.md` - Complete refinement workflow
- `04_REFINEMENT/validate_searchland_output.sh` - Check what AI created
- `04_REFINEMENT/VALIDATION_LOG.md` - Track what worked/didn't

### 3. Create Stage 5 Workflow Scripts
**New files needed:**
- `05_SITE_VALIDATION/README.md` - Visual assessment & multi-LLM analysis
- `05_SITE_VALIDATION/analyze_property.sh` - Per-property LLM analysis
- `05_SITE_VALIDATION/TENABLE/` - Folder for viable properties
- `05_SITE_VALIDATION/NON_TENABLE/` - Folder for rejected properties

### 4. Create Stage 6 Workflow Scripts
**New files needed:**
- `06_DEEP_RESEARCH/README.md` - Deep research planning
- `06_DEEP_RESEARCH/create_research_plan.sh` - Generate research checklist

### 5. Update README.md
**Merge:**
- README_v5.md content
- SYSTEM_IMPROVEMENT_PLAN.md relevant sections
- Full 10-step workflow from user's description

### 6. Consolidate CHANGELOG.md
**Merge into CHANGELOG:**
- CRITICAL_FIX_v7.md
- CODEX_CLI_FIX.md
- CLAUDE_CLI_FIX.md
- IMPROVED_PROMPTS.md
- SYSTEM_V5_COMPLETE.md
- V5.1_UPGRADE_SUMMARY.md
- BUG_FIX_ITERATION_DETECTION.md
- PROMPT_CONSISTENCY_FIX.md
- TASKS_COMPLETE_20251120.md

### 7. Archive Individual Fix Files
Move to: `archive/system_docs/v5_fixes/`

### 8. Template Files Organization
**Keep in templates/:**
- DivergentApproach.md → Used by orchestration scripts
- Requirements.md → Used by new_project.sh
- ValidationMatrix.md → Used by synthesis
- FilterRequirements.md, FilterIterations.md, FilterResults.md → Legacy (archive)
- IMPLEMENTATION_ITERATION.md → Legacy (archive)

---

## Workflow Summary (Your 10 Steps)

### Stage 3: Parallel Testing (Current - Phase 2 output)
- Validation matrix created
- Ready-to-test approaches extracted

### Stage 4: Refinement & Validation (NEW - Steps 1-5)
**Step 0:** Create Executive Summary for each approach
**Step 1:** Copy SearchLand AI prompt
**Step 2:** Paste screenshot of what SearchLand AI created
**Step 3:** Run validation script to check accuracy
**Step 4:** Update prompts based on issues, update LEARNINGS_DATABASE.md
**Step 5:** Document results & property screenshots in Executive Summary

### Stage 5: Site Validation (NEW - Steps 6-8)
**Step 6:** Each LLM analyzes each property → creates DOSSIER
**Step 7:** Tenable properties marked in Executive Summary
**Step 8:** DOSSIERS organized into TENABLE/ and NON_TENABLE/ folders

### Stage 6: Deep Research (NEW - Steps 9-10)
**Step 9:** Create deep research plan for tenable properties
**Step 10:** Manual enrichment (title docs, planning portal, comparables, etc.)

---

## Version Bump

- **Current:** v5.1 (bug fixes, prompt refactoring)
- **New:** v5.2 (full Stages 4-6 workflow)

---

**Status:** Plan created, ready for execution

