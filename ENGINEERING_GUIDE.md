# SecureCloud Enterprise — Engineering Learning Guide

> **Purpose:** Your concise, cumulative practical handbook. After every completed section, add a small entry explaining **what the technology does, why it is needed, where configured, how to use it, how to verify it and how to troubleshoot it**. This is not a replacement for the blueprint or full external documentation.
>
> **Status:** Phase 00 completed and published through PRs #2/#3 on 2026-10-26; local main synchronized at 2cb63f9. Phase 01.1 completed through merged PR #4 and main synchronization on 2026-10-27; Phase 01.2 completed through merged PR #5 and main synchronization; Phase 01.3 missing-login learning review passed on 2026-10-28; Git checkpoint pending. No application implementation yet.

## How to use this guide

- Read the **current phase** in `PROJECT_PROGRESS.md`.
- Read the corresponding entry below before performing the task.
- Add exact commands **only after testing them** in the real WSL/project environment; label illustrative commands as examples.
- Keep one short entry per completed section; move extensive explanations into `docs/` and link to them.
- Record real failures and their root causes, not generic error lists.
- Never store secrets, private tokens or production identifiers.

## Phase map — what and why

| Phase | Main tools | What you learn / why it matters | Current guide state |
|---|---|---|---|
| 00 | WSL2, VS Code, Git | Reproducible Linux workspace and trustworthy project baseline | Complete; PRs #2/#3 and merge 2cb63f9 |
| 01 | Architecture, threat modeling | Define requirements and trust boundaries before building | 01.1/01.2 complete; 01.3 missing-login review passed; publication pending |
| 02 | Linux, Bash, Python, Git, pre-commit | Automate and validate developer work locally | Pending |
| 03 | NestJS/Spring Boot, PostgreSQL, Redis | Build a realistic workload for the platform | Pending |
| 04 | Docker, BuildKit | Package the workload consistently and securely | Pending |
| 05 | Terraform, Ansible, AWS VPC/EC2/IAM/S3 | Reproduce and manage infrastructure safely | Pending |
| 06 | Kubernetes, kind/k3d | Schedule, expose and troubleshoot workloads | Pending |
| 07 | Helm | Reusable Kubernetes application packaging | Pending |
| 08 | GitHub Actions, Jenkins | Automate quality/security checks and compare CI models | Pending |
| 09 | AWS ECR, EKS, IAM | Managed Kubernetes, cloud registry and identity | Pending |
| 10 | Argo CD, GitOps | Reconcile deployments from Git and support rollback | Pending |
| 11 | Load Balancer Controller, Ingress/Gateway API | Expose services securely with routing/TLS | Pending |
| 12 | Keycloak, OIDC, Secrets Manager, ESO | Authenticate users and manage sensitive configuration | Pending |
| 13 | Semgrep, Trivy, Checkov, Gitleaks, Kyverno/Gatekeeper | Detect defects and enforce policy before deployment | Pending |
| 14 | Syft, Cosign, SBOM | Inventory dependencies and verify artifact integrity | Pending |
| 15 | Prometheus, Grafana, Loki, OpenTelemetry | Observe metrics, logs and traces to diagnose problems | Pending |
| 16 | HPA, PDB, backup/restore | Operate under load and recover from failures | Pending |
| 17 | Runbooks, evidence, portfolio | Prove the complete platform works and can be explained | Pending |

## Phase 00 — Workspace and Git baseline

**What:** WSL2 Ubuntu is a Linux development environment on Windows; VS Code provides the editor; Git records and compares project changes. **Why:** Linux-based containers and Kubernetes tooling behave most predictably when the active repository and CLI tools are in Linux. **Where:** The authoritative repo should be under `/home/<linux-user>/...`, not a second independently edited Windows copy.

**Initial read-only verification (illustrative; safe to run):**

```bash
pwd
realpath .
uname -a
git --version
git status --short --branch
git remote -v
git log -5 --oneline
```

**Expected:** Linux path and correct Git repository; do not assume remote or commits exist. **If Git fails:** Check whether `.git` exists, whether the folder is the right repository, and whether the current branch is initialized. Do not run `git init` inside an existing repo blindly.

**Security check:** Inspect `.gitignore` and staged changes before committing; do not print secret values in shared logs.

**Further reading:** https://learn.microsoft.com/windows/wsl/ ; https://git-scm.com/docs ; https://code.visualstudio.com/docs/remote/wsl

**Checkpoint:** Actual workspace/Git state documented; feature branch/PR plan reviewed; initial docs adopted without overwriting prior work.

## Standard entry template — append once a section is verified

```markdown
### Phase NN, Section NN.N — Topic (COMPLETED YYYY-MM-DD)
- **What:** One- or two-sentence explanation.
- **Why / enterprise use:** Which concrete problem it solves.
- **Alternatives:** Why this tool was chosen.
- **Where configured:** Exact repo paths, relevant resources and config names (no secrets).
- **How to use:** Minimal, verified commands and key options.
- **How to verify:** Actual checks, expected results and evidence link.
- **Common failure / fix:** Real error, cause, fix and re-test.
- **Security and cost:** Relevant controls and cleanup.
- **Official docs:** Current canonical URL.
- **Git checkpoint:** Branch, commit and PR when known.
```

## Quick rules to remember

1. Terraform **plan** is not a deployment; inspect before `apply` and plan a `destroy` for labs.
2. Kubernetes **readiness** controls traffic eligibility; **liveness** determines restart behavior.
3. GitOps desired state is in Git; avoid untracked manual cluster changes.
4. OIDC authentication proves identity; authorization still needs role and resource checks.
5. An SBOM lists components; scanning and signature verification are separate controls.
6. A successful backup is not proven recoverable until a restore test succeeds.
7. Logs, metrics and traces answer different operational questions; correlate them carefully.
8. Document evidence, not assumptions, and keep the public README truthful.

## Phase 00.1 — Workspace observations (historical sequence, 2026-10-26)

- **What/why:** Linux Git and the editor must operate on one authoritative WSL repository; the remote selects the dedicated GitHub destination.
- **Where:** /home/devops_kashmitha/devsecops-mastery/01-secure-cloud-platform; Linux Git /usr/bin/git; branch codex/p00-project-realignment at b1186ac.
- **Verified commands:** pwd and command -v git returned those paths. git status --short --branch showed the expected documentation migration; git log -1 --oneline showed b1186ac; git diff --check produced no output and exited successfully; git diff --cached --stat showed an empty staging area before this checkpoint.
- **Learner-provided evidence:** git remote -v points to git@github.com:Kashmitha/secure-cloud-platform.git for fetch and push. This confirms the configured destination, not successful authentication or publication.
- **Staging concept:** git add selects content for the next commit, including deliberate deletions. git diff --cached reviews that exact selected snapshot. A plain unstaged diff does not include new untracked documents; review them after explicit staging.
- **Security:** a bounded check of current documents found no private-key headers, AWS access-key IDs, or recognized GitHub token patterns. Gitleaks/history scanning has not run; do not describe this limited check as comprehensive.
- **Troubleshooting:** if the branch/path differs, stop and inspect rather than running git init, resetting, or deleting files. A missing/new/deleted status can be expected during this approved documentation migration.
- **Current evidence:** baseline staged and checked; committed as 1ac55f2; pushed over SSH; PR #2 merged as c3c2474; local main synchronized; progress notes restored on codex/p00-checkpoint-record. The original observations above are historical, not the latest branch state.
- **Editor evidence:** learner explicitly confirmed the lower-left VS Code indicator shows WSL: Ubuntu on 2026-10-26. This is user-provided UI evidence, not an assistant-observed screenshot.
- **Closure:** [PR #3](https://github.com/Kashmitha/secure-cloud-platform/pull/3) published these records and merged as 2cb63f9; learner synchronized local main. Phase 00 complete on 2026-10-26.

## Phase 00 — Git baseline workflow demonstrated (2026-10-26)

- **What:** staging selects content; a commit records it locally; push publishes commits; a PR reviews/integrates a branch; pull updates the local branch afterward.
- **Why:** separate reviewable changes from the main baseline, retain evidence, and avoid losing uncommitted documentation while synchronizing.
- **Project evidence:** commit 1ac55f2; [merged PR #2](https://github.com/Kashmitha/secure-cloud-platform/pull/2); merge c3c2474; current records branch codex/p00-checkpoint-record based on that merge.
- **Verified learner commands:** git diff --cached --check passed; git commit and push -u origin codex/p00-project-realignment succeeded; git status/log verified synchronized main at c3c2474. A named path-specific stash preserved PROJECT_PROGRESS.md; restored working-tree status on the new branch shows only that file modified before these notes were added.
- **Command meanings:** --cached reads the staging area. push -u establishes upstream tracking. pull --ff-only updates without creating a merge commit and refuses diverged history. stash apply restores saved edits and retains the stash; pop also removes it on successful restoration.
- **Safe recovery:** stash only the intended tracked file; inspect stash list and working-tree changes; retain the backup until restoration and commit are verified. Stop on conflicts; do not force-reset or discard notes. Sensitive values must not be treated as safe merely because they are in a local stash.
- **Observed process issue:** baseline merged before the requested review pause. No rollback needed for the inspected docs; future PRs must wait for review. No formal GitHub approval/check status was claimed.
- **Security scope:** only documentation exists. Bounded credential-pattern checks found no matches; no comprehensive history scan or application security test has run. No AWS resources were created.
- **References:** https://git-scm.com/docs/git-add ; https://git-scm.com/docs/git-stash ; https://git-scm.com/docs/git-pull
- **Section gate satisfied:** checkpoint record f929c74 reviewed here, merged via PR #3 as 2cb63f9, and synchronized locally; WSL editor confirmed. Phase 00 complete. No automated CI pass or formal GitHub approval is claimed.

## Phase 01.1 — Business goal, actors, and protected assets (COMPLETED 2026-10-27)

### Objective and prerequisites

Understand the small financial-services simulation before deciding detailed permissions, network boundaries or tools. Phase 00 is complete; no new installation is required. The learner created docs/p01-business-architecture from verified main 2cb63f9; branch and HEAD verified on 2026-10-26. The docs/ prefix identifies documentation/design work; p01 identifies the phase. Future implementation uses feature/, fixes use fix/, and maintenance uses chore/. At branch creation the six prepared Markdown edits carried across with nothing staged. This is historical setup evidence.

### What and why

A business requirement describes a needed capability. A functional requirement states what the system does; a non-functional requirement states a quality or constraint such as confidentiality, availability, or bounded response time. Naming actors and assets first makes later authorization and failure tests specific instead of relying on installing security tools.

We are modeling a fictional provider with customer login, synthetic accounts, simulated transfers, mock notifications, audit events, and restricted administration. Thousands of customers is a design scenario, not tested capacity. No real money, customer PII, or production credentials.

### Proposed actors and role separation

| Actor | Intended responsibility | Boundary to preserve |
|---|---|---|
| Customer | Use permitted features on their own synthetic accounts | Cannot read or change another customer's private records |
| Application administrator | Perform specifically authorized business administration | No blanket right to rewrite transaction history or bypass audit |
| Platform engineer/operator | Deploy, observe, maintain, and recover services | Deployment permission does not automatically authorize business API actions; privileged database/cloud access must also be restricted and audited |

These are initial design roles for learner review, not implemented permissions. A platform administrator may possess powerful technical access; separating roles alone is not proof that business data is inaccessible to them.

### Clarification — deployment and business permissions (2026-10-27)

Deployment permission lets an engineer release an approved software version. Business permission lets an application identity perform a specific action on account data. Fixing a login bug needs the former; it does not justify giving the engineer an application role that can directly edit customer balances. These separate permissions reduce accidental changes and misuse if an identity is compromised.

An analogy: a mechanic may repair a taxi, but that does not grant permission to take money from its passenger. In this project, a customer may initiate an authorized simulated transfer through validation and audit rules; deploying the API does not itself grant that customer action. Synthetic balances still require integrity controls.

Deployment is powerful: malicious code could access data through the application's permissions. Role separation therefore also needs reviewed releases and restricted, audited database/cloud access. This is design guidance, not an implemented security guarantee.

Learning review passed on 2026-10-27: the learner explained the privacy risk of cross-customer access, then correctly identified that releasing a login bug fix needs deployment permission without balance-editing permission. The initial confusion was resolved with the repair analogy; this is a verbal design exercise, not an executed authorization test.

### Assets and architecture relevance

Protect synthetic account balances and transaction records against unauthorized change; identities and tokens against impersonation; audit evidence against tampering; configuration/credentials against exposure; service availability against outages. The API validates identity and authorizes actions before accessing PostgreSQL. Redis supports cache/async work and is not the durable source of financial transaction truth, per the blueprint.

Example functional requirement: an authenticated customer can retrieve their own account. Example security requirement: the API rejects unauthorized retrieval of another customer's account. Distinguishing login from permission is essential; a valid login alone does not authorize every record.

### Learner exercise and expected result

Branch creation is verified. Read this entry, then explain briefly:
1. Why should a logged-in customer still be denied another customer's private account data?
2. Why should deploying the API not automatically grant permission to alter account balances through it?

Discuss whether the proposed actors match the business scenario. The assistant maintains the Markdown; the learner reviews and explains the design. Do not write application code yet.

### Planned validation and failure scenario

- Positive: customer A reads their own synthetic account.
- Negative: customer A requests customer B's private account; no private data returned.
- Failure: database unavailable during a transfer; the platform must not falsely report a successful transfer. Transaction details and consistency rules are designed in later sections.

These are future acceptance scenarios, NOT EXECUTED tests. A review misconception to correct is assuming authentication, a UI-hidden control, or internal network placement replaces API authorization.

### Completion criteria and checkpoint

Learner branch exists; learner can distinguish actors, assets, authentication, and authorization; ownership and role separation are reviewed. Then document accepted scope/remaining questions and prepare one focused Phase 01.1 commit/PR, including the Phase 00 closeout notes. Later Phase 01 tasks define detailed requirements, trust boundaries, architecture decisions and risk register. Do not mark the whole phase complete after this introductory exercise.

### Official learning resources

- [OWASP threat modeling](https://community.owasp.org/Threat_Modeling)
- [OWASP authorization guidance](https://cheatsheetseries.owasp.org/cheatsheets/Authorization_Cheat_Sheet.html)

**Phase 01.1 Git closure:** reviewed commit e92d71f published and merged via [PR #4](https://github.com/Kashmitha/secure-cloud-platform/pull/4) as 0389e9c; main synchronized and progress notes restored on docs/p01-acceptance-requirements. No implemented authorization controls or CI pass implied.

## Phase 01.2 — Acceptance requirements: own-account read (COMPLETED 2026-10-27)

- **Objective:** Turn one business capability into observable outcomes that can later become tests.
- **Concept / why:** A requirement states what must happen. An acceptance scenario gives a starting situation (Given), an action (When), and an observable result (Then). This makes a vague statement such as “accounts are secure” reviewable before writing code. Plain prose is sufficient; no new test framework or installation is needed.
- **Where:** This guide holds the small draft; progress records its review state. The blueprint remains the scope authority. Current branch: docs/p01-acceptance-requirements at 0389e9c.
- **Proposed capability AC-READ-01:** An authenticated customer can retrieve their own existing synthetic account information when the data dependency is available. Ownership must be checked by the API; a supplied account identifier is not proof of permission. This read operation must not change balances.

| Scenario | Given | When | Then (proposed acceptance outcome) |
|---|---|---|---|
| Success | Customer A is authenticated, owns the requested existing account, and the database is available | A requests that account | Return A's stored synthetic account information without changing it |
| Unauthorized access | A is authenticated but the requested account belongs to B | A requests B's private account | Deny access and return none of B's private account data |
| Dependency failure | A is authenticated and the database cannot supply the requested account | A requests their account | Return a controlled error; do not invent a balance, return success with zero, or disclose connection secrets |

These three rows are **design scenarios, NOT EXECUTED tests**. They are a first slice, not the full acceptance suite. Anonymous/expired sessions, absent accounts and exact endpoint/status-code behavior will be specified later. No stale-cache fallback is proposed here.

- **Small learner task:** Review the rows and explain what should happen when the database is unavailable and why a zero balance is misleading. The assistant writes the documentation; the learner reviews the behavior. No application commands yet.
- **Expected result:** Learner distinguishes a legitimate stored zero from missing/unavailable data and accepts or corrects the proposed outcomes.
- **Validation/security plan:** Later tests must verify returned ownership, no cross-customer data, no write during reads and controlled dependency failure. For now validate scenario clarity through learner review; do not record runtime PASS.
- **Troubleshooting drill:** A proposed response says “success, balance 0” during a database outage. Identify that unavailable data has been converted into false account information; require an explicit failure instead.
- **Completion criteria:** Learner reviews these outcomes, explains the failure case, and any corrections/open questions are documented. Then perform the reviewed documentation Git checkpoint. This does not complete Phase 01's overall architecture/threat-model deliverables.
- **GitHub checkpoint:** After review, inspect changed files and staged diff, run whitespace and bounded secret-exposure checks, then guide learner commit/push/PR. Include restored previous-section evidence; do not create a separate cleanup-only PR.
- **Reference:** [OWASP authorization guidance](https://cheatsheetseries.owasp.org/cheatsheets/Authorization_Cheat_Sheet.html) for enforcing resource permissions. The scenario identifiers and proposed outcomes above are this project's design draft.

**Learning review — 2026-10-27:** Learner correctly identified that database unavailability must not produce balance data. Clarification: the true stored balance may be zero or nonzero; neither can be inferred from a failed read. A controlled error preserves the distinction between unknown data and a valid zero. The learner's answer is conceptual evidence only; the three draft scenarios have not been run against an API. Section Git checkpoint completed through PR #5 as recorded below.

**Phase 01.2 Git closure:** reviewed commit 352b3b8 published and merged through [PR #5](https://github.com/Kashmitha/secure-cloud-platform/pull/5) as a0faee1. Main synchronized; latest AGENTS/progress notes restored on docs/p01-authentication-cases. The acceptance scenarios remain unimplemented and unexecuted.

## Phase 01.3 — Authentication acceptance cases: missing login (LEARNING REVIEW PASSED 2026-10-28; Git checkpoint pending)

- **Objective:** Specify the minimum identity condition for reading private account data.
- **Concept / why:** Authentication establishes who is requesting access; authorization decides what they may access. An account identifier selects a record, but does not prove the requester's identity. A hidden page or an unguessable-looking identifier cannot replace API checks.
- **Where / prerequisites:** This guide holds the draft. Branch docs/p01-authentication-cases starts at a0faee1; Phase 01.2 is complete. No new technology, setup, installation or application command is required for this design exercise.
- **Proposed requirement AC-AUTH-01:** The API must reject a request for private account information when the requester has no valid authentication. Return no private account data and do not disclose whether a supplied account identifier exists to the unauthenticated requester. The exact HTTP response contract remains to be specified.
- **Given / When / Then:** Given a requester has not logged in and supplies no valid authentication, when they request private account information using a known account identifier, then reject access without returning the account's private data. This is a proposed scenario, NOT an executed API test.
- **Small learner task / expected result:** Explain whether a requester who knows a valid account identifier may retrieve its private data without a valid login, and why. The learner reviews; the assistant writes the Markdown.
- **Validation/security plan:** Later send a direct API request without authentication, bypassing the browser UI, and check that the API denies access and returns no private data or existence signal. No runtime PASS is claimed now. Compare with the earlier positive own-account scenario, which requires both identity and ownership checks.
- **Troubleshooting drill:** The website redirects to login, but a direct API request still returns account data. That is incomplete protection: enforce authentication at the API, not only the website.
- **Completion criteria:** Learner reviews the proposed missing-login behavior and explains why account-ID knowledge is insufficient; corrections/open questions are recorded. Prepare the reviewed documentation checkpoint. Expired/invalid credentials and detailed response codes are follow-up cases, not silently completed here.
- **GitHub checkpoint:** After learning review, present explicit staging/checks, commit, push, PR creation and merge instructions together; learner executes and shares results for verification. Stop on unexpected changes, failures or unmet GitHub requirements. Include restored prior checkpoint evidence and the permanent workflow preference; no cleanup-only PR needed.
- **Reference:** [OWASP authorization guidance](https://cheatsheetseries.owasp.org/cheatsheets/Authorization_Cheat_Sheet.html). These requirement identifiers are local design labels, not implemented endpoints.

**Learning review — 2026-10-28:** Learner correctly explained that exposing balance data to someone who only knows an account ID violates privacy and may assist fraud. Account-ID knowledge proves neither identity nor permission; valid authentication and resource authorization are still required. A balance alone is not proof of another person's identity. This confirms the introductory missing-login case conceptually, not through an executed API test. Expired/invalid credentials and exact response codes remain unfinished; commit/push/PR/merge must be verified before advancing.
