# Grant Writing Module

Generate high-quality grant applications for Solana ecosystem programs. Ground all content in project context and verified ecosystem references.

## When to Use

- Solana Foundation grant applications
- Colosseum hackathon and accelerator submissions
- Superteam grant and bounty proposals
- General hackathon submissions on Solana

## Prerequisites

Load [project-context.md](project-context.md) and verify these fields exist:

- `project.name`
- `project.description`
- `project.stage`
- `goals.next_milestone`

If missing, ask before proceeding. Also load [ecosystem.md](ecosystem.md) for program-specific requirements.

## Grant Program Selection

Ask the user which program they're applying to (if not specified):

| Program | Best For | Typical Ask |
|---------|----------|-------------|
| **Solana Foundation** | Open-source infra, tooling, public goods | $10K–$250K |
| **Colosseum** | Hackathon winners, accelerator cohort | $250K investment + perks |
| **Superteam** | Regional grants, bounties, Earn tasks | $1K–$50K |
| **Hackathon (general)** | MVP demos, early validation | Prizes + exposure |

Reference [ecosystem.md](ecosystem.md) for current program details. Never invent program names or deadlines.

## Output Structure

Generate all sections below. Mark any section with missing data as `[NEEDS INPUT: description]`.

### 1. Executive Summary (150–300 words)

- Problem statement (who suffers, how much)
- Your solution (what it does, why Solana)
- Traction or validation (only facts from context)
- What you're asking for and what it unlocks

### 2. Problem & Opportunity

- Target user pain point (from `target_users`)
- Market context on Solana (without fabricated TAM numbers)
- Why now (ecosystem timing, technical enablers)

### 3. Solution & Architecture

- High-level product description
- Technical architecture (on-chain vs off-chain split)
- Key integrations (from `integrations` field)
- Solana-specific advantages (speed, cost, composability)

If the project has on-chain components, describe at a high level. Do not invent program IDs or deployed addresses.

### 4. Milestones & Timeline

Structure as a table:

| Milestone | Deliverable | Timeline | Success Criteria |
|-----------|-------------|----------|------------------|
| M1 | ... | Week 1–4 | ... |
| M2 | ... | Week 5–8 | ... |
| M3 | ... | Week 9–12 | ... |

Align milestones with `goals.next_milestone` and `project.stage`.

### 5. KPIs & Metrics

Define measurable outcomes. Only include metrics the project can realistically track:

- **Usage**: DAU/WAU, transactions, volume
- **Adoption**: integrations, partners, pilot users
- **Technical**: uptime, latency, test coverage
- **Ecosystem**: open-source contributions, developer adoption

Never fabricate current metrics. Use "Target:" prefix for future KPIs.

### 6. Budget

| Category | Amount | Justification |
|----------|--------|---------------|
| Engineering | $X | ... |
| Infrastructure (RPC, hosting) | $X | ... |
| Audits | $X | ... |
| Marketing/Community | $X | ... |
| Operations | $X | ... |
| **Total** | **$X** | |

If budget amount unknown, provide a template with reasonable ranges and ask founder to fill in.

### 7. Roadmap (3–6 months)

- **Month 1**: Foundation (what ships)
- **Month 2**: Growth (what expands)
- **Month 3**: Scale (what compounds)

Tie to `project.stage` progression (e.g., devnet → mainnet-beta).

### 8. Team

From `team` field. For each member:
- Name and role
- Relevant experience (only what founder provides)
- Time commitment

If team is empty, note `[NEEDS INPUT: team bios]`.

### 9. FAQ

Anticipate reviewer questions:

- Why Solana over other chains?
- What's your moat?
- How do you sustain after grant funding?
- What's the token strategy? (respect `token` field — if no token, say so)
- Open source plan?

### 10. Appendix Checklist

- [ ] GitHub repo link (if applicable)
- [ ] Demo video or live product URL
- [ ] Architecture diagram
- [ ] Previous grant history (from `funding.grants_applied`)

## Program-Specific Guidance

### Solana Foundation

- Emphasize public goods and ecosystem benefit
- Show open-source commitment
- Reference Solana technical advantages specifically
- Include clear deliverables per milestone
- Link: https://solana.org/grants

### Colosseum

- Emphasize speed of execution and demo-ability
- Show hackathon progress or MVP
- Highlight team velocity
- Include competitive analysis (from `competitors`)
- Link: https://www.colosseum.org

### Superteam

- Connect to regional Superteam chapter if applicable
- Emphasize local ecosystem contribution
- Bounty-style deliverables work well
- Link: https://superteam.fun

### Hackathons

- Lead with demo and architecture
- Keep executive summary under 150 words
- Focus on what's built vs. what's planned
- Include live demo link if available

## Quality Rules

1. **Never fabricate** traction, users, revenue, or partnerships
2. **Never invent** grant programs or deadlines not in [ecosystem.md](ecosystem.md)
3. **Clearly distinguish** facts (from context) vs. assumptions vs. targets
4. **Use Solana-native language** — programs, transactions, composability, not generic blockchain terms
5. **Match stage to ask** — idea stage shouldn't request $250K without strong justification
6. **Update context** — after generating, suggest adding `funding.grants_applied` entry

## After Generation

Suggest the founder:
1. Review all `[NEEDS INPUT]` sections
2. Add specific metrics they can verify
3. Run `/what-next` to prioritize post-submission actions
4. Update `.launch-copilot/context.md` with grant application status
