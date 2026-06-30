---
description: "Initialize project context and establish persistent founder metadata"
---

You are initializing a new Solana founder project. Follow these steps:

## Step 1: Check for Existing Context

```bash
# Check if context already exists
if [ -f ".launch-copilot/context.md" ]; then
    echo "Existing context found. Will update rather than overwrite."
    # Read and display current context summary
else
    echo "No existing context. Creating new project profile."
fi
```

If context exists, show a summary and ask: "Update existing context or start fresh?"

## Step 2: Collect Project Information

Gather required fields through conversation. Ask in batches of 3 maximum.

### Batch 1 (Required)
1. **Project name** — What is your project called?
2. **Description** — What does it do? (2–4 sentences)
3. **Stage** — Where are you? (`idea` | `building` | `devnet` | `mainnet-beta` | `launched` | `scaling`)

### Batch 2 (Recommended)
4. **Tagline** — One-line pitch (optional)
5. **Target users** — Who is this for?
6. **Next milestone** — What's the single most important thing to achieve next?

### Batch 3 (Optional)
7. **Website** — Live URL (if any)
8. **GitHub** — Repository URL (if any)
9. **X handle** — Twitter/X handle (if any)

### Batch 4 (Optional)
10. **Team** — Who's on the team? (name + role)
11. **Funding status** — Bootstrapped, pre-seed, grant-funded, etc.
12. **Integrations** — Solana tools in use (Jupiter, Helius, etc.)

### Batch 5 (Optional)
13. **Token plans** — Do you have or plan a token?
14. **Competitors** — Who else solves this problem?
15. **Goals** — Top 3 current goals

## Step 3: Create Context File

Load [project-context.md](../skill/project-context.md) for the schema.

Create `.launch-copilot/context.md`:

```markdown
---
project:
  name: "[collected]"
  tagline: "[collected]"
  description: "[collected]"
  stage: [collected]
  website: "[collected]"
  github: "[collected]"
  docs: ""
  x_handle: "[collected]"
funding:
  status: [collected]
  raised: ""
  grants_applied: []
  grants_received: []
team: [collected]
token:
  has_token: [collected]
  symbol: ""
  status: none
integrations: [collected]
target_users: "[collected]"
competitors: [collected]
goals:
  list: [collected]
  next_milestone: "[collected]"
updated: "[today's date ISO]"
---

# Notes

## [today's date]
- Project initialized with Launch Copilot
```

Create the `.launch-copilot/` directory if it doesn't exist.

## Step 4: Confirm and Summarize

Display the created context in a readable summary:

```
✅ Project context created for [name]

Stage: [stage]
Milestone: [next_milestone]
Team: [count] members
Integrations: [list or "none yet"]

Context saved to: .launch-copilot/context.md
```

## Step 5: Recommend Next Steps

Based on `project.stage`, suggest the most relevant next command:

| Stage | Recommended Next |
|-------|-----------------|
| `idea` | `/what-next` — validate and scope |
| `building` | `/what-next` — prioritize MVP features |
| `devnet` | `/grant` or `/what-next` |
| `mainnet-beta` | `/launch` — launch readiness |
| `launched` | `/weekly-review` — track progress |
| `scaling` | `/what-next` — strategic priorities |

## Rules

1. **Never overwrite** existing context without confirmation
2. **Never fabricate** any project details
3. **Ask only** for missing fields on update
4. **Use founder-agent** persona — encouraging, direct
5. **Batch questions** — max 3 at a time

---

**Remember**: Good context makes every future command better. Invest 5 minutes now, save hours later.
