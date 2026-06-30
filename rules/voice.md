---
globs:
  - ".launch-copilot/**"
  - "**/ship*"
  - "**/changelog*"
  - "**/social*"
  - "**/tweet*"
  - "**/post*"
exclude:
  - "**/node_modules/**"
  - "**/dist/**"
---

# Build in Public Voice Rules

These rules apply when generating social media content, changelogs, weekly updates, and release notes for Solana founders.

## Authentic Over Polished

```markdown
# BAD
"We're thrilled to announce a groundbreaking innovation that will
revolutionize the DeFi landscape on Solana."

# GOOD
"Shipped: one-click treasury rebalancing for DAOs.
Took 3 weeks. Hardest part was handling partial fills across pools.
Try it: vaultflow.xyz"
```

- Specific accomplishments over vague claims
- Real struggles and learnings, not just wins
- Founder voice, not marketing department

## No Price Talk

Never include:
- Token price or price predictions
- Market cap or valuation
- "Buy" or "invest" language
- Financial advice of any kind
- Comparison to other token prices

```markdown
# BAD
"$VAULT is going to moon once we launch! Get in early!"

# GOOD
"We're focused on shipping product, not token price.
No token planned until we have strong user traction."
```

## No Fabricated Metrics

```markdown
# BAD
"10,000 users joined in the first week!"

# GOOD
"First 5 beta users this week. Small but real.
[ADD: your actual user count]"
```

- Only use metrics the founder provides
- Mark missing metrics as `[ADD: your metric here]`
- Never invent user counts, revenue, or growth rates

## No Fabricated Testimonials

```markdown
# BAD
"'VaultFlow changed how we manage our treasury' — DeFi Protocol CEO"

# GOOD
"Beta user feedback: 'finally something that handles partial fills'
[ADD: real quote from your users]"
```

Never invent quotes, user names, or partner endorsements.

## Solana-Native Language

```markdown
# BAD
"Our blockchain platform leverages distributed ledger technology."

# GOOD
"Built on Solana — sub-second confirmations, $0.00025 per tx.
Integrated with Jupiter for routing and Helius for indexing."
```

- Reference Solana ecosystem tools by name
- Use Solana-specific terms (programs, transactions, composability)
- Tag @solana when relevant
- Avoid generic "Web3" or "blockchain" buzzwords

## Tone Guidelines

| Tone | When | Example |
|------|------|---------|
| **Technical** | Dev tools, infra | "40% compute reduction on our Anchor program" |
| **Casual** | Consumer apps (default) | "Fixed that annoying wallet popup bug" |
| **Founder-story** | Milestones, journey | "6 months ago this was a napkin sketch" |

Default to casual unless user specifies otherwise.

## Content Structure

### X Posts
- Max 280 characters for single posts
- Hook first, details second
- End with CTA or link
- No hashtag spam (max 2 relevant tags)

### X Threads
- 3–5 posts maximum
- Post 1: Hook
- Post 2–3: Context and solution
- Final: CTA

### LinkedIn
- Professional but personal
- 3–4 short paragraphs
- Problem → solution → impact → CTA
- Relevant hashtags (max 5)

### Changelogs
- Factual, versioned
- Added / Changed / Fixed sections
- Link to PRs when available

## Consistent Cadence

Encourage:
- Weekly updates (same day each week)
- Ship announcements within 24 hours of shipping
- Monthly retrospectives

Discourage:
- Posting without shipping
- Engagement bait ("like if you agree")
- Excessive self-promotion without value

## Review Checklist

Before delivering content:

- [ ] Based on user-provided facts only
- [ ] No price or financial language
- [ ] No fabricated metrics or quotes
- [ ] Solana-native terminology used
- [ ] Tone matches user preference
- [ ] Placeholders marked for missing data
- [ ] CTA included where appropriate

---

**Remember**: Build in public builds trust. Trust comes from honesty, not hype. The founders with the strongest audiences share real progress — including the messy parts.
