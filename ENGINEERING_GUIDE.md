# SecureCloud Enterprise — Engineering Learning Guide

> **Purpose:** Your concise, cumulative practical handbook. After every completed section, add a small entry explaining **what the technology does, why it is needed, where configured, how to use it, how to verify it and how to troubleshoot it**. This is not a replacement for the blueprint or full external documentation.
>
> **Status:** Phase 00 completed and published through PRs #2/#3 on 2026-10-26; local main synchronized at 2cb63f9. Phase 01.1 introductory learning review passed on 2026-10-27; documentation Git checkpoint pending. No application implementation yet.

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
| 01 | Architecture, threat modeling | Define requirements and trust boundaries before building | 01.1 learning review passed; Git checkpoint pending |
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

## Phase 01.1 — Business goal, actors, and protected assets (LEARNING REVIEW PASSED 2026-10-27; Git checkpoint pending)

### Objective and prerequisites

Understand the small financial-services simulation before deciding detailed permissions, network boundaries or tools. Phase 00 is complete; no new installation is required. The learner created docs/p01-business-architecture from verified main 2cb63f9; branch and HEAD verified on 2026-10-26. The docs/ prefix identifies documentation/design work; p01 identifies the phase. Future implementation uses feature/, fixes use fix/, and maintenance uses chore/. The six prepared Markdown edits carried into the branch; nothing is staged.

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
