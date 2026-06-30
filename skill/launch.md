# Launch Planning Module

Generate comprehensive launch checklists and readiness plans for Solana projects. Covers pre-launch, launch day, and post-launch phases.

## When to Use

- Preparing for mainnet launch
- Devnet → mainnet-beta transition
- Public beta or feature release
- Token launch coordination (if applicable)

## Prerequisites

Load [project-context.md](project-context.md) and verify:

- `project.name`
- `project.description`
- `project.stage`
- `integrations` (can be empty, but ask what's planned)

If `project.stage` is `idea` or `building`, recommend completing devnet deployment first.

## Launch Readiness Assessment

Before generating checklists, assess current stage:

| Stage | Launch Type | Recommendation |
|-------|-------------|----------------|
| `idea` | None yet | Focus on MVP, not launch |
| `building` | Internal alpha | Devnet deployment first |
| `devnet` | Public beta | Mainnet-beta launch plan |
| `mainnet-beta` | Public launch | Full launch checklist |
| `launched` | Feature release | Scoped release checklist |
| `scaling` | Major version | Enterprise launch checklist |

## Output Structure

Generate three phases. Each item is a checkbox with priority and owner suggestion.

### Phase 1: Pre-Launch Checklist (2–4 weeks before)

#### Security & Audits

- [ ] **Critical**: Smart contract audit completed (if on-chain)
- [ ] **Critical**: Audit findings remediated and re-verified
- [ ] **High**: Bug bounty program considered (Immunefi, etc.)
- [ ] **High**: Access controls reviewed (admin keys, upgrade authority)
- [ ] **Medium**: Dependency audit (npm, Cargo) for known vulnerabilities
- [ ] **High**: Rate limiting and abuse prevention in place

#### Infrastructure & RPC

- [ ] **Critical**: Production RPC provider configured (Helius, Triton, QuickNode)
- [ ] **Critical**: RPC failover/redundancy tested
- [ ] **High**: Rate limits and billing alerts configured
- [ ] **High**: CDN and hosting scaled for launch traffic
- [ ] **Medium**: Geographic RPC distribution if global audience
- [ ] **High**: Transaction simulation enabled in production

#### Monitoring & Observability

- [ ] **Critical**: On-chain transaction monitoring (Helius webhooks, custom indexer)
- [ ] **Critical**: Error alerting (PagerDuty, Discord, Slack)
- [ ] **High**: Uptime monitoring for frontend and API
- [ ] **High**: Dashboard for key metrics (DAU, tx volume, errors)
- [ ] **Medium**: Log aggregation (Datadog, Grafana)
- [ ] **Critical**: Rollback strategy documented and tested

#### Wallet Compatibility

- [ ] **Critical**: Phantom tested end-to-end
- [ ] **Critical**: Solflare tested end-to-end
- [ ] **High**: Backpack tested (if targeting power users)
- [ ] **High**: Mobile wallet support verified (MWA if mobile app)
- [ ] **Medium**: Wallet connection error handling polished
- [ ] **High**: Transaction signing UX tested (clear prompts, error messages)

#### Testing

- [ ] **Critical**: End-to-end test suite passing on mainnet-beta
- [ ] **Critical**: Load testing completed (expected peak traffic × 3)
- [ ] **High**: Edge cases tested (insufficient funds, network congestion, timeout)
- [ ] **High**: Devnet → mainnet migration path tested
- [ ] **Medium**: Cross-browser testing (Chrome, Safari, Firefox)
- [ ] **High**: Mobile responsive testing

#### Documentation

- [ ] **Critical**: User documentation live and accurate
- [ ] **High**: API documentation (if applicable)
- [ ] **High**: FAQ covering common issues
- [ ] **Medium**: Architecture overview (for technical users)
- [ ] **High**: Getting started guide with screenshots
- [ ] **Medium**: Troubleshooting guide

#### Legal & Compliance

- [ ] **High**: Terms of service published
- [ ] **High**: Privacy policy published
- [ ] **Medium**: Token legal review (if launching token)
- [ ] **Medium**: Geographic restrictions assessed
- [ ] **Low**: Trademark search (if new brand)

### Phase 2: Launch Day Checklist

#### T-24 Hours

- [ ] **Critical**: Final production deployment verified
- [ ] **Critical**: All monitoring dashboards green
- [ ] **High**: Team on-call schedule confirmed
- [ ] **High**: Rollback procedure rehearsed
- [ ] **High**: Support channels staffed (Discord, X)
- [ ] **Medium**: Pre-written announcement posts reviewed

#### T-0 (Launch)

- [ ] **Critical**: Deploy to production
- [ ] **Critical**: Verify deployment (smoke test all critical paths)
- [ ] **Critical**: Enable monitoring alerts
- [ ] **High**: Publish announcement on X
- [ ] **High**: Publish announcement on Discord/community
- [ ] **Medium**: Submit to Solana ecosystem directories
- [ ] **Medium**: Notify partners and integrations

#### T+1 Hour

- [ ] **Critical**: Monitor error rates and transaction success
- [ ] **Critical**: Monitor RPC health and latency
- [ ] **High**: Respond to community questions
- [ ] **High**: Check wallet connection success rates
- [ ] **Medium**: Share early traction metrics (if positive)

#### T+24 Hours

- [ ] **High**: Post-launch retrospective (internal)
- [ ] **High**: Address any critical bugs found
- [ ] **Medium**: Thank early users publicly
- [ ] **Medium**: Collect and document user feedback

### Phase 3: Post-Launch Checklist (1–4 weeks after)

#### Stability

- [ ] **Critical**: 7-day uptime report reviewed
- [ ] **High**: Performance bottlenecks identified and addressed
- [ ] **High**: User-reported bugs triaged and fixed
- [ ] **Medium**: RPC costs optimized based on actual usage

#### Growth

- [ ] **High**: Analytics baseline established
- [ ] **High**: User onboarding funnel analyzed
- [ ] **Medium**: First `/ship` content published (launch recap)
- [ ] **Medium**: Community feedback incorporated into roadmap
- [ ] **Low**: Press/outreach to Solana media (Superteam, ecosystem blogs)

#### Iteration

- [ ] **High**: Run `/weekly-review` for first post-launch week
- [ ] **High**: Run `/what-next` to prioritize post-launch work
- [ ] **Medium**: Update `.launch-copilot/context.md` stage to `launched`
- [ ] **Medium**: Plan first feature update based on user feedback

## Solana-Specific Considerations

### RPC Readiness

- Use dedicated RPC for production (not public endpoints)
- Configure priority fees for time-sensitive transactions
- Test during peak Solana network congestion periods
- Have fallback RPC provider ready

### Transaction UX

- Show clear transaction status (pending, confirmed, failed)
- Handle blockhash expiration gracefully
- Provide transaction explorer links
- Support transaction retry with updated blockhash

### Program Deployment

- Verify program ID on mainnet matches documentation
- Confirm upgrade authority is secured (multisig recommended)
- Document all deployed program addresses
- Verify IDL matches deployed program

## Risk Matrix

| Risk | Likelihood | Impact | Mitigation |
|------|-----------|--------|------------|
| RPC outage | Medium | Critical | Failover provider |
| Smart contract exploit | Low | Critical | Audit + monitoring |
| Traffic spike crash | Medium | High | Load testing + auto-scale |
| Wallet incompatibility | Medium | High | Multi-wallet testing |
| Network congestion | High | Medium | Priority fees + retry UX |

## Quality Rules

1. **Never recommend launch** without monitoring and rollback in place
2. **Always verify** testing checklist is addressed for the stage
3. **Match checklist scope** to `project.stage` — don't overwhelm early-stage projects
4. **Flag token launch** as higher risk if `token.has_token` is true
5. **Reference integrations** from context when relevant

## After Generation

Suggest the founder:
1. Assign owners to critical items
2. Set target launch date based on unchecked critical items
3. Run `/ship` to prepare announcement content
4. Schedule `/weekly-review` for launch week
