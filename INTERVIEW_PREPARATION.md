# SecureCloud Enterprise — Interview Preparation

> **Purpose:** Small, accurate interview questions and answers accumulated as you complete each section. Add **1–3 questions per completed section**, not a huge question dump. Include the reason behind the answer and a short example from this project once verified.
>
> **Status:** Phase 00 completed on 2026-10-26, with workspace evidence and Git workflow Q&As below. Interview mastery is not assumed. Phase 01.1 introductory access questions learned and verified on 2026-10-27; checkpoint merged via PR #4. Phase 01.2 introductory failure-handling question reviewed; checkpoint merged via PR #5. Phase 01.3 missing-login question reviewed on 2026-10-28; checkpoint merged via PR #6. Phase 01.4 expiry question reviewed on 2026-10-31; checkpoint merged via PR #7. Phase 01.5 atomicity question reviewed on 2026-10-31; checkpoint merged via PR #8. Phase 01.6 rejection-rule question reviewed on 2026-10-31; Git checkpoint pending.

## How to study

1. Answer aloud **before** reading the sample answer.
2. Explain a practical example from your repository once that phase is complete.
3. Be able to demonstrate the related command, configuration or validation.
4. If you cannot explain a tradeoff or failure case, revisit `ENGINEERING_GUIDE.md`.
5. After each completed section, add 1–3 concise Q&As and label them by phase/section.

## Phase 00 — Development environment and Git (starter)

**Q1. Why use WSL2 Ubuntu instead of developing the entire cloud-native platform only in Windows folders?**

**A:** WSL2 provides a Linux environment aligned with common containers, Kubernetes tooling and server operations. Keeping active repositories in the Linux filesystem reduces cross-filesystem friction. VS Code can edit the same Linux files through its WSL integration. Windows itself is still a valid host; the key is consistent execution and a single authoritative working copy.
**Project example:** repository paths and Linux Git were checked in WSL; learner confirmed the VS Code WSL: Ubuntu indicator on 2026-10-26.

**Q2. What is the difference between a Git commit, a branch and a pull request?**

**A:** A commit is a recorded snapshot of changes, a branch is a movable reference to a sequence of commits, and a pull request proposes integrating one branch into another with review and automated checks. For this project, a phase task should normally happen on a feature branch and be merged only after validation.

## Future section entries (add only after learning/verification)

Use this compact format:

```markdown
### Phase NN, Section NN.N — Topic (learned YYYY-MM-DD)
**Q1. [Concept, design or tradeoff question]?**
**A:** [Accurate 2–5 sentence answer.]
**Project example:** [Exact file, command, diagram or test demonstrated.]

**Q2. [Failure, security or troubleshooting question]?**
**A:** [Concise root-cause/mitigation answer.]
**Project example:** [Actual failure/validation evidence.]
```

### Suggested question themes by phase

| Phase | Interview themes to cover once implemented |
|---|---|
| 01 | Trust boundaries, threat modeling, functional vs non-functional requirements |
| 02 | Linux permissions, DNS/TLS, Git branch policies, pre-commit tradeoffs |
| 03 | Database transactions/idempotency, Redis persistence, API authorization |
| 04 | Multi-stage builds, image attack surface, BuildKit cache/secrets |
| 05 | Terraform state and drift, IAM least privilege, VPC routing, Ansible idempotence |
| 06 | Deployments vs StatefulSets, probes, Services, RBAC, debugging CrashLoopBackOff |
| 07 | Helm templates, values, releases, rollback |
| 08 | PR checks, OIDC CI credentials, Jenkins vs GitHub Actions, minutes optimization |
| 09 | EKS vs local Kubernetes, ECR image permissions, AWS workload identity |
| 10 | GitOps reconciliation, drift and rollback |
| 11 | Ingress vs Gateway API, TLS termination, load balancer placement |
| 12 | OIDC claims vs authorization, secret rotation, ESO failure modes |
| 13 | SAST/SCA/IaC scans, admission policies, false positives |
| 14 | SBOM, signing vs scanning, provenance, tampered artifact rejection |
| 15 | Metrics vs logs vs traces, cardinality, SLO/alerts |
| 16 | HPA vs PDB, RPO/RTO, restore testing |
| 17 | Architecture tradeoffs, cost, incident stories, engineering evidence |

**Rule:** Do not generate all future answers in advance. Update this file section by section as actual knowledge and evidence accumulate.

## Phase 00 — Git baseline workflow (COMPLETED 2026-10-26)

**Q1. What is the difference between staging, committing, and pushing?**

**A:** Staging selects the content for the next commit. A commit records that selected snapshot locally. Pushing publishes commits to a remote; uncommitted working-tree edits are not uploaded.
**Project example:** eight documentation paths were staged and checked, committed as 1ac55f2, then pushed to origin/codex/p00-project-realignment. Later progress-note edits stayed local until separately recorded.

**Q2. Does merging a pull request automatically update the local main branch?**

**A:** No. GitHub updates the remote branch. After preserving local edits, switch to local main and pull; --ff-only refuses a divergent history instead of silently creating another merge. A clean status does not alone prove the branch is up to date without suitable remote verification.
**Project example:** PR #2 merged as c3c2474; learner synchronized local main. The reviewed checkpoint record f929c74 then merged through PR #3 as 2cb63f9; learner again pulled --ff-only and verified a clean synchronized main.

**Q3. Why use stash apply instead of stash pop during a careful handover?**

**A:** apply restores saved changes while retaining the stash as a backup. pop removes the stash after successful application. Keeping the backup until restoration and commit are verified makes recovery easier; neither action replaces review for conflicts or sensitive data.
**Project example:** phase00-checkpoint-notes preserved PROJECT_PROGRESS.md during main synchronization and remained in stash@{0} after notes were restored onto codex/p00-checkpoint-record.

## Phase 01.1 — Ownership and role separation (LEARNED 2026-10-27; checkpoint merged via PR #4)

**Q1. Does logging in authorize access to every customer account?**

**A:** No. Authentication establishes identity; authorization checks whether that identity may perform an action on a particular resource. A customer must not read or modify another customer's private account just because they are logged in.
**Project example:** the learner explained cross-customer privacy and unauthorized-change risks. API checks are planned, not implemented or tested.

**Q2. Why separate deployment permission from business permissions?**

**A:** Releasing software and performing account actions are different responsibilities. Grant only the permissions needed for each task; releasing a login fix does not require an application role that edits balances. Deployment remains powerful, so reviewed releases and restricted, audited privileged access are also needed.
**Project example:** the learner correctly selected deployment permission without balance-editing permission for a login bug fix. This verifies introductory understanding, not a deployed control.

## Phase 01.2 — Unavailable data versus a valid zero (LEARNED 2026-10-27; checkpoint merged via PR #5)

**Q1. Why must a failed account read not default to a successful zero balance?**

**A:** An unavailable database means the balance is unknown. Zero is a possible valid stored value, but substituting it after a read failure invents financial information. For this project's current acceptance draft, return a controlled error without account data or internal database details.
**Project example:** the learner recognized that no balance data should be returned during database unavailability; the mentor clarified that not every account necessarily has a nonzero balance. This was a scenario review, not an executed API test.

## Phase 01.3 — Account identifiers are not authentication (LEARNED 2026-10-28; checkpoint merged via PR #6)

**Q1. Is knowing an account ID sufficient to read its private balance?**

**A:** No. The ID selects a record; it does not establish the requester's identity or authorize access. The API must reject unauthenticated private-account requests without returning private data, even if the website normally redirects users to login. Authenticated requests still require ownership/permission checks.
**Project example:** the learner correctly rejected balance disclosure based on account-ID knowledge and identified privacy/fraud risks. AC-AUTH-01 is a proposed requirement, not implemented authentication or an executed security test.

## Phase 01.4 — Expired authentication proof (LEARNED 2026-10-31; checkpoint merged via PR #7)

**Q1. Does account ownership or a past login make expired authentication proof acceptable?**

**A:** No. The API must reject a protected request whose only proof is expired, without returning private data. Ownership is an authorization condition and does not replace current valid authentication. An approved refresh/sign-in flow may obtain fresh valid proof for a later request; it does not make the expired proof valid.
**Project example:** the learner correctly denied balance/personal-data access and identified the risk of accepting reused expired proof. AC-AUTH-02 specifies expired/invalid-proof rejection; these are design scenarios, not implemented controls or executed tests.

## Phase 01.5 — Atomic simulated transfers (LEARNED 2026-10-31; checkpoint merged via PR #8)

**Q1. What must happen if a transfer's credit fails before the transaction commits?**

**A:** Roll back the operation so neither balance change remains committed. Atomicity means the grouped writes take effect together or not at all. A successful commit saves both changes; a failed-before-commit operation must not be reported as a completed transfer. This does not imply that a lost response after commit means rollback.
**Project example:** with A=100/B=40 and transfer 25, the learner correctly identified successful A=75/B=65 and failed-before-commit A=100/B=40 after resolving a partial-write misconception. AC-TRANSFER-01 is a proposed requirement; no database/API test has run.

## Phase 01.6 — Invalid amount versus insufficient funds (REVIEWED 2026-10-31; Git checkpoint pending)

**Q1. Under the proposed no-overdraft rule, why reject a transfer of 80 or -10 when the source holds 50?**

**A:** 80 exceeds available funds; -10 violates the positive-amount rule. Either rejection must leave both balances unchanged and create no completed transfer. Zero completed transfers does not mean account balances become zero. Validation must run at the API, not only in browser controls.
**Project example:** learner correctly explained the two rejection reasons and stated 0 transfers; mentor clarified unchanged A=50/B=20. These are proposed AC-TRANSFER-02 scenarios, not executed API/database tests.
