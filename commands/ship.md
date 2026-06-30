---
description: "Generate build-in-public content: X posts, LinkedIn updates, changelogs, weekly updates, release notes"
---

You are generating build-in-public content for a Solana founder. Follow these steps:

## Step 1: Load Context

Read `.launch-copilot/context.md` and parse YAML front-matter.

**Required fields** — if missing, ask before proceeding:
- `project.name`
- `project.description`

**Optional but useful:**
- `project.x_handle`
- `project.tagline`
- `project.stage`

Display context summary:
```
Project: [name] | Stage: [stage] | Handle: @[x_handle]
```

## Step 2: Determine Content Type

Ask the user what they need (if not specified):

```
What content do you need?
1. X post (single tweet)
2. X thread (3–5 posts)
3. LinkedIn update
4. Changelog entry
5. Weekly shipping update
6. Release notes
7. Multiple types
```

## Step 3: Collect Accomplishments

Ask the user what to write about:

- What was shipped or accomplished? (this week/sprint/release)
- Any metrics they're comfortable sharing? (optional)
- Tone preference: technical, casual, or founder-story (default: casual)
- Link to include? (demo, docs, app)

**Never fabricate accomplishments.** Only write about what the user provides.

## Step 4: Generate Content

Using **growth-agent** persona, load [ship.md](../skill/ship.md) and apply [rules/voice.md](../rules/voice.md).

Generate requested content type(s):

### X Post
- Max 280 characters (or thread format)
- Include @solana tag when relevant
- No price speculation

### X Thread
- 3–5 posts with hook → context → solution → detail → CTA

### LinkedIn
- Professional tone, 3–4 paragraphs
- Problem → solution → impact → CTA

### Changelog
- Version, date, Added/Changed/Fixed sections

### Weekly Update
- Shipped, In Progress, Blockers, Next Week, Reflection

### Release Notes
- Highlights, Getting Started, What's Next, Links

## Step 5: Quality Check

Before delivering, verify:
- [ ] All content based on user-provided facts
- [ ] No fabricated metrics or testimonials
- [ ] No token price or market cap mentions
- [ ] Placeholders marked as `[ADD: your metric here]`
- [ ] Project name and description from context used
- [ ] Tone matches user preference

## Step 6: Offer Variations

If generating a single X post, offer:
> "Want me to also draft a LinkedIn version or expand this into a thread?"

## Step 7: Update Context

Suggest adding to context notes:
```markdown
## [today's date]
- Shipped: [what was accomplished]
- Published: [content type] on [platform]
```

## Step 8: Recommend Next Steps

After delivery:
1. Personalize before posting
2. Add real metrics where placeholders exist
3. Schedule consistent weekly updates
4. Run `/weekly-review` to track shipping cadence

---

**Remember**: Authenticity beats polish. A real update about a small win outperforms a manufactured announcement about fake traction.
