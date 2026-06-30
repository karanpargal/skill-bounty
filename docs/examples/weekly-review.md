# Example: /weekly-review

A realistic conversation running a weekly founder retrospective.

---

**User:** /weekly-review

**Claude:** Time for your weekly review. Loading context.

```
Project: VaultFlow
Stage: devnet
Milestone: Devnet beta with 3 pilot DAOs
Team: 2 members
Goals: 3 active
```

What did you complete this week?

---

**User:** Shipped policy templates, onboarded our 2nd pilot DAO, and submitted the Solana Foundation grant application. Still working on the monitoring dashboard. Blocked on audit scheduling — the firm we wanted is booked until August.

**Claude:** How are you feeling about progress overall?

---

**User:** Good but anxious about the audit delay. Might push mainnet timeline.

**Claude:**

---

# Weekly Review — VaultFlow
**Week of:** June 30, 2026
**Stage:** devnet

## Accomplishments

**Shipped**
- Policy templates (Conservative, Balanced, Growth)
- 2nd pilot DAO onboarded (2 of 3 target)
- Solana Foundation grant application submitted

**Progress**
- Monitoring dashboard ~60% complete

**Ecosystem**
- Grant application submitted to Solana Foundation

## Unfinished / Blocked

| Item | Status | Blocker | Owner |
|------|--------|---------|-------|
| Monitoring dashboard | 60% done | None — just needs time | Jordan |
| 3rd pilot DAO | Not started | Need intro from Superteam | Alex |
| Smart contract audit | Blocked | Preferred firm booked until August | Alex |

## Roadmap Progress

```
Milestone: Devnet beta with 3 pilot DAOs
Progress: [██████░░░░] ~65%
On track: ⚠️ At risk (audit delay may push mainnet)
```

| Goal | Progress | Status |
|------|----------|--------|
| 3 pilot DAOs on devnet | 2/3 | 🟡 |
| SF grant application | Submitted | 🟢 |
| Public docs | Not started | 🔴 |

## Launch Readiness

| Area | Status | Notes |
|------|--------|-------|
| Security/Audit | 🔴 | Blocked until August |
| RPC/Infra | 🟡 | Helius devnet, need mainnet plan |
| Monitoring | 🟡 | Dashboard in progress |
| Wallet Testing | 🟢 | Phantom + Solflare tested |
| Documentation | 🔴 | Not started |

## Next Week Priorities

| Priority | Action | Why | Effort |
|----------|--------|-----|--------|
| P0 | Onboard 3rd pilot DAO | Complete devnet beta milestone | M |
| P0 | Get backup audit quote | August delay threatens mainnet timeline | S |
| P1 | Finish monitoring dashboard | Launch blocker | M |
| P2 | Start public docs | Needed before mainnet | L |

## Suggested Updates

💡 **X post:** "2 of 3 pilot DAOs now testing VaultFlow on devnet. Policy templates cut setup time from 30 min to 5 min."

💡 **X post:** "Submitted our Solana Foundation grant application. Fingers crossed 🤞"

## Suggested Ecosystem Actions

| Action | Program | Why Now |
|--------|---------|---------|
| Ask Superteam for DAO intro | Superteam | Need 3rd pilot DAO |
| Get backup audit quotes | OtterSec, Neodyme | Primary firm delayed |

## Reflection

- The audit delay is your biggest risk. What's your backup plan if August slips further?
- You're at 2/3 pilot DAOs — who specifically is the 3rd and what's blocking the intro?
- What would make next week a success regardless of the audit timeline?

---

**Next steps:**
1. Run `/what-next` for deeper prioritization on the audit issue
2. Run `/ship` to post about the 2nd pilot DAO
3. Update context with review notes
