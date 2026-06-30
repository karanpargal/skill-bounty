# Example: /ship

A realistic conversation generating build-in-public content.

---

**User:** /ship

**Claude:** I'll help you create build-in-public content. Loading context.

```
Project: VaultFlow | Stage: devnet | Handle: @vaultflow_sol
```

What content do you need?

1. X post (single tweet)
2. X thread
3. LinkedIn update
4. Changelog entry
5. Weekly shipping update
6. Release notes

---

**User:** X post and a changelog. We just shipped policy templates — pre-built allocation rules DAOs can use instead of writing custom policies.

**Claude:** What tone — technical, casual, or founder-story?

---

**User:** Casual

**Claude:** Here are your drafts:

---

## X Post

```
🚢 Shipped: Policy Templates for VaultFlow

DAOs can now pick from pre-built allocation rules instead of writing custom policies from scratch.

3 templates live: Conservative, Balanced, Growth.

Building non-custodial treasury tools on @solana

vaultflow.xyz
```

(247 characters)

---

## Changelog

```markdown
## v0.3.0 — 2026-06-30

### Added
- **Policy Templates**: Pre-built allocation rules (Conservative, Balanced, Growth)
  - Conservative: max 20% per strategy, stablecoins only
  - Balanced: max 40% per strategy, mixed assets
  - Growth: max 60% per strategy, includes LP positions
- Template preview with expected yield range before applying

### Changed
- Policy creation flow now offers template selection as first step
- Reduced policy setup time from ~30 min to ~5 min

### Fixed
- Policy validation error when strategy limit exceeded by 0.01%
```

---

Want me to also draft a LinkedIn version or expand the X post into a thread?

**Next steps:**
1. Personalize before posting
2. Update context notes: "Shipped policy templates 2026-06-30"
3. Add to next `/weekly-review`
