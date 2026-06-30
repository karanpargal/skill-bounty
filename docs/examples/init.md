# Example: /init

A realistic conversation initializing a new Solana project.

---

**User:** /init

**Claude:** Welcome to Launch Copilot! I'll help you set up your project context so every future command is personalized to your startup.

No existing context found. Let's create your project profile.

**Batch 1 — Core info:**

1. What's your project called?
2. What does it do? (2–4 sentences)
3. What stage are you at? (`idea` | `building` | `devnet` | `mainnet-beta` | `launched` | `scaling`)

---

**User:** It's called VaultFlow. We help DAOs route idle treasury assets into vetted yield strategies with on-chain policy controls. We're on devnet with a working prototype.

**Claude:** Great — VaultFlow at devnet stage. A few more questions:

**Batch 2:**

4. One-line pitch? (optional)
5. Who are your target users?
6. What's your single most important milestone right now?

---

**User:** Tagline: "Non-custodial yield routing for Solana treasuries." Target users are DAO treasury managers with $100K+ idle SOL/USDC. Next milestone is getting 3 pilot DAOs on devnet beta.

**Claude:** Perfect. Last batch (all optional):

7. Website or GitHub URL?
8. Who's on the team?
9. Any Solana integrations in use? (Jupiter, Helius, etc.)

---

**User:** GitHub: github.com/vaultflow/vaultflow. Team is me (Alex, founder/CEO) and Jordan (lead engineer). We use Jupiter, Helius, and Squads.

**Claude:** Creating your project context now.

```
✅ Project context created for VaultFlow

Stage: devnet
Milestone: Devnet beta with 3 pilot DAOs
Team: 2 members
Integrations: Jupiter, Helius, Squads

Context saved to: .launch-copilot/context.md
```

**Recommended next steps for devnet stage:**

1. `/what-next` — get strategic priorities for your stage
2. `/grant` — start a Solana Foundation grant application
3. `/weekly-review` — establish a weekly review cadence

What would you like to do first?
