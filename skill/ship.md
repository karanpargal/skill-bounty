# Build in Public Module

Generate authentic build-in-public content for Solana founders. Inspired by Shiplog — ship, log, repeat.

## When to Use

- X (Twitter) posts about progress
- LinkedIn updates for professional audience
- Changelog entries
- Weekly shipping updates
- Release notes for product launches

## Prerequisites

Load [project-context.md](project-context.md) and verify:

- `project.name`
- `project.description`
- `project.x_handle` (optional — ask if they want to include handle)

Collect from user (if not in context):
- What was shipped or accomplished (this week/sprint)
- Any metrics they're comfortable sharing (optional)
- Tone preference: technical, casual, or founder-story

## Content Types

### 1. X Post (Single)

**Format options:**

**Ship announcement:**
```
🚢 Shipped: [feature name]

[1-2 sentences on what it does and why it matters]

[Optional: metric or user quote]

Building [project.name] on @solana

[link if applicable]
```

**Progress update:**
```
Week [N] building [project.name]:

✅ [accomplishment 1]
✅ [accomplishment 2]
🔄 [in progress]
⏳ [up next]

[1 sentence reflection or lesson learned]
```

**Technical insight:**
```
TIL building on Solana:

[Specific technical learning — real, not generic]

We're using [integration] for [reason].

[project.name] — [tagline]
```

**Rules for X:**
- Max 280 characters for single posts (or thread format for longer)
- No price speculation or token pumping
- No fabricated metrics
- Include @solana tag when relevant
- Authentic voice over marketing speak

### 2. X Thread (3–5 posts)

For bigger launches or milestones:

```
1/ [Hook — what you shipped and why it matters]

2/ [Problem context — what users faced before]

3/ [Solution — what you built, how it works]

4/ [Technical detail or architecture insight]

5/ [What's next + CTA (try it, give feedback, follow along)]
```

### 3. LinkedIn Post

**Format:**

```
[Hook — professional framing of what was accomplished]

[2-3 paragraphs:
- Context (problem/opportunity)
- What we built
- Impact or early results (only real data)
- Lesson learned]

[CTA — link, follow, feedback request]

#Solana #Web3 #BuildInPublic #[relevant hashtag]
```

**Rules for LinkedIn:**
- More professional tone than X
- Focus on problem-solving and team/learnings
- Avoid crypto jargon unless audience is technical
- No hype language

### 4. Changelog Entry

```markdown
## [Version] — [Date]

### Added
- [Feature]: [Brief description]

### Changed
- [Feature]: [What changed and why]

### Fixed
- [Bug]: [What was broken and how it's fixed]

### Technical
- [Infrastructure/deps update if relevant]
```

Keep factual. Link to PRs or commits if available.

### 5. Weekly Update

```markdown
# [Project Name] — Week [N] Update

**Stage:** [from context]
**Milestone:** [goals.next_milestone]

## Shipped This Week
- [Item 1]
- [Item 2]

## In Progress
- [Item 1] — [expected completion]

## Blockers
- [Blocker] — [what's needed to unblock]

## Next Week
- [Priority 1]
- [Priority 2]

## Metrics (if available)
- [Metric]: [value]

## Reflection
[1-2 sentences on what you learned or what surprised you]
```

### 6. Release Notes

For public product launches:

```markdown
# [Project Name] [Version] — [Release Title]

[Brief intro — what this release means for users]

## Highlights
- **[Feature 1]**: [User-facing description]
- **[Feature 2]**: [User-facing description]

## Getting Started
[3 steps to try the new release]

## What's Next
[Teaser for upcoming work — from goals]

## Links
- App: [website]
- Docs: [docs]
- GitHub: [github]
```

## Tone Guidelines

| Tone | When to Use | Example |
|------|-------------|---------|
| **Technical** | Dev tools, infra, protocols | "Deployed program upgrade with 40% compute reduction" |
| **Casual** | Consumer apps, community | "Finally fixed that annoying wallet popup bug" |
| **Founder-story** | Fundraising, milestones | "6 months ago this was a napkin sketch. Today it's live on mainnet." |

Default to **casual** unless user specifies otherwise.

## Content Principles

1. **Show, don't tell** — specific accomplishments over vague progress
2. **Be honest** — share failures and learnings, not just wins
3. **No fabrication** — never invent users, metrics, or testimonials
4. **Solana-native** — reference ecosystem tools by name when relevant
5. **Consistent cadence** — weekly updates build audience over time
6. **No price talk** — never discuss token price, market cap, or financial advice

## Future: GitHub Integration

> **MVP note:** This module currently works from user-provided accomplishments. Future versions will:
> - Read recent commits from `project.github`
> - Summarize PRs merged this week
> - Auto-generate changelog from conventional commits
> - Detect shipped features from release tags

For now, ask the user what they shipped or provide a commit summary.

## Output Selection

Ask the user which content type(s) they need, or infer from context:

| User says... | Generate |
|--------------|----------|
| "tweet about shipping X" | X post |
| "thread about our launch" | X thread |
| "linkedin update" | LinkedIn post |
| "changelog for v0.2" | Changelog entry |
| "weekly update" | Weekly update |
| "release notes" | Release notes |
| "all of the above" | All applicable types |

## Quality Rules

1. **Never fabricate** metrics, users, quotes, or testimonials
2. **Never include** token price, market cap, or financial projections
3. **Always use** real project name and description from context
4. **Mark placeholders** as `[ADD: your metric here]` when data is missing
5. **Match voice** to the founder's stated preference

## After Generation

Suggest the founder:
1. Review and personalize before posting
2. Add real metrics where placeholders exist
3. Schedule consistent weekly updates
4. Run `/weekly-review` to feed future `/ship` content
5. Update context notes with what was shipped
