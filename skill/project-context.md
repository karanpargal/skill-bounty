# Project Context Specification

Every Launch Copilot module revolves around a shared, persistent project context. This file defines the schema, storage location, and read/write conventions.

## Storage Location

```
<project-root>/
└── .launch-copilot/
    └── context.md
```

- Created by `/init` on first use
- Updated by any command when new information is learned
- Version-controlled alongside the project (recommended)
- Human-editable — founders can hand-edit YAML or notes

## File Format

`context.md` uses YAML front-matter for structured fields and a markdown body for freeform notes.

```markdown
---
project:
  name: ""
  tagline: ""
  description: ""
  stage: idea
  website: ""
  github: ""
  docs: ""
  x_handle: ""
funding:
  status: bootstrapped
  raised: ""
  grants_applied: []
  grants_received: []
team: []
token:
  has_token: false
  symbol: ""
  status: none
integrations: []
target_users: ""
competitors: []
goals:
  list: []
  next_milestone: ""
updated: ""
---

# Notes

Freeform founder notes, decisions, and context that don't fit structured fields.
```

## Field Definitions

### `project`

| Field | Type | Required for `/init` | Description |
|-------|------|---------------------|-------------|
| `name` | string | Yes | Project or product name |
| `tagline` | string | No | One-line pitch |
| `description` | string | Yes | What the project does (2–4 sentences) |
| `stage` | enum | Yes | Current lifecycle stage (see below) |
| `website` | string | No | Live site or landing page URL |
| `github` | string | No | Repository URL |
| `docs` | string | No | Documentation URL |
| `x_handle` | string | No | X/Twitter handle (without @) |

**Stage enum:** `idea` | `building` | `devnet` | `mainnet-beta` | `launched` | `scaling`

### `funding`

| Field | Type | Description |
|-------|------|-------------|
| `status` | enum | `bootstrapped` \| `pre-seed` \| `seed` \| `series-a` \| `grant-funded` \| `dao-funded` |
| `raised` | string | Amount raised (e.g., "$150K") — only if known |
| `grants_applied` | array | Grant programs applied to (e.g., `["Solana Foundation", "Colosseum"]`) |
| `grants_received` | array | Grants received with amounts if known |

### `team`

Array of objects: `{ name: string, role: string }`

### `token`

| Field | Type | Description |
|-------|------|-------------|
| `has_token` | boolean | Whether project has or plans a token |
| `symbol` | string | Token ticker if applicable |
| `status` | enum | `none` \| `planned` \| `devnet` \| `mainnet` \| `launched` |

### `integrations`

Array of strings naming Solana integrations in use or planned.

Examples: `Jupiter`, `Helius`, `Metaplex`, `Squads`, `Drift`, `Tensor`, `Phantom Connect`

### `target_users`

String describing primary user persona(s).

### `competitors`

Array of competitor project names (not fabricated — only what founder provides).

### `goals`

| Field | Type | Description |
|-------|------|-------------|
| `list` | array | Current goals (strings) |
| `next_milestone` | string | Single most important upcoming milestone |

### `updated`

ISO 8601 date string (e.g., `2026-06-30`). Bumped on every write.

## Read Procedure

Every command and module follows this procedure before acting:

1. **Check** if `.launch-copilot/context.md` exists in the current project root
2. **If missing** and command is not `/init`: prompt user to run `/init` first, or collect minimal context inline
3. **Parse** YAML front-matter between `---` delimiters
4. **Compute** which fields are required for the current task (see per-module requirements below)
5. **Ask** only for missing required fields — never re-ask for fields already populated
6. **Use** the markdown notes body as supplemental context

## Write Procedure

When updating context:

1. Read existing `context.md` if present (merge, don't overwrite blindly)
2. Update only changed fields in YAML front-matter
3. Set `updated` to today's date
4. Preserve existing notes; append new notes with a dated header if adding
5. Write file to `.launch-copilot/context.md`
6. Create `.launch-copilot/` directory if it doesn't exist

## Per-Module Required Fields

| Module | Minimum Required Fields |
|--------|------------------------|
| `/init` | None (creates context) |
| `/grant` | `project.name`, `project.description`, `project.stage`, `goals.next_milestone` |
| `/launch` | `project.name`, `project.description`, `project.stage`, `integrations` |
| `/ship` | `project.name`, `project.description`, `project.x_handle` (or willingness to skip) |
| `/weekly-review` | `project.name`, `project.stage`, `goals.list` |
| `/what-next` | `project.name`, `project.description`, `project.stage` |

If fields are missing, ask for them before proceeding. Batch questions (max 3 at a time) to reduce friction.

## Example Context

```markdown
---
project:
  name: VaultFlow
  tagline: Non-custodial yield routing for Solana treasuries
  description: VaultFlow helps DAOs and protocols route idle treasury assets into vetted yield strategies with on-chain policy controls and real-time monitoring.
  stage: devnet
  website: https://vaultflow.xyz
  github: https://github.com/vaultflow/vaultflow
  docs: ""
  x_handle: vaultflow_sol
funding:
  status: bootstrapped
  raised: ""
  grants_applied: []
  grants_received: []
team:
  - name: Alex
    role: Founder / CEO
  - name: Jordan
    role: Lead Engineer
token:
  has_token: false
  symbol: ""
  status: none
integrations:
  - Jupiter
  - Helius
  - Squads
target_users: DAO treasury managers and protocol operators with $100K+ idle SOL/USDC
competitors:
  - Kamino
  - Friktion
goals:
  list:
    - Complete devnet beta with 3 pilot DAOs
    - Apply for Solana Foundation grant
    - Ship public docs
  next_milestone: Devnet beta with first pilot DAO
updated: 2026-06-30
---

# Notes

## 2026-06-30
- Decided to delay token until post-PMF
- Targeting Solana Foundation grant for Q3
- Colosseum Breakout hackathon as backup path
```

## Context-Aware Behavior Rules

1. **Never ask duplicate questions** — if a field exists in context, use it
2. **Never fabricate context** — if a field is empty, ask or mark as `[TBD]`
3. **Prefer updating context** — when user provides new info, write it back
4. **Respect stage** — recommendations must match `project.stage`
5. **Token awareness** — if `token.has_token` is false, don't assume tokenomics exist
