# SearchLand Filter Projects Directory

This directory contains all filter creation projects, both active and archived.

## Directory Structure

```
projects/
├── README.md (this file)
├── archive/
│   └── [ProjectName-YYYYMMDD]/
│       ├── FilterRequirements.md
│       ├── FilterIterations.md
│       ├── FilterResults.md
│       └── PROJECT_INFO.md
└── [ActiveProjectName]/
    ├── FilterRequirements.md
    ├── FilterIterations.md
    ├── FilterResults.md
    └── PROJECT_INFO.md
```

## Quick Start

### Create New Project

```bash
cd /home/ashsubband/landsignal
./scripts/new_project.sh
```

### Work on Project

```bash
cd projects/[YourProjectName]
# Edit FilterRequirements.md
# Run iterations (see MASTER_SetupFilters.md)
# Document in FilterIterations.md
# Finalize in FilterResults.md
```

### Archive Completed Project

```bash
cd /home/ashsubband/landsignal
DATE=$(date +%Y%m%d)
mv projects/[ProjectName] projects/archive/[ProjectName]-$DATE
# Update PROJECTS_INDEX.md with learnings
```

## Archived Projects

See `PROJECTS_INDEX.md` in root directory for:
- Complete list of all projects
- Key learnings from each
- Templates for similar searches
- Statistics and patterns

## Current Archives

- **MixedUse-8Storey-2M-20250119**: £2M profit, 8-storey mixed-use, £200k capital
  - 3 iterations to convergence
  - Key lesson: Minimum 2 iterations essential
  - Reference for: Option agreements, tall building searches, limited capital

## Guidelines

1. **Always use project structure** - Don't work directly in root directory
2. **One project = One set of requirements** - Don't mix multiple searches
3. **Archive when complete** - Projects are valuable learning resources
4. **Document learnings** - Add to MASTER_SetupFilters.md and PROJECTS_INDEX.md
5. **Use past projects as templates** - Don't start from scratch every time

## See Also

- `../MASTER_SetupFilters.md` - Complete workflow and learnings
- `../PROJECTS_INDEX.md` - Index of all projects
- `../WORKFLOW.md` - Detailed step-by-step guide
- `../scripts/new_project.sh` - Quick project setup script

