# SecureCloud Enterprise — Interview Preparation

> **Purpose:** Small, accurate interview questions and answers accumulated as you complete each section. Add **1–3 questions per completed section**, not a huge question dump. Include the reason behind the answer and a short example from this project once verified.
>
> **Status:** Starter questions for Phase 00 only. These are preparation material, **not proof that Phase 00 has been completed**.

## How to study

1. Answer aloud **before** reading the sample answer.
2. Explain a practical example from your repository once that phase is complete.
3. Be able to demonstrate the related command, configuration or validation.
4. If you cannot explain a tradeoff or failure case, revisit `ENGINEERING_GUIDE.md`.
5. After each completed section, add 1–3 concise Q&As and label them by phase/section.

## Phase 00 — Development environment and Git (starter)

**Q1. Why use WSL2 Ubuntu instead of developing the entire cloud-native platform only in Windows folders?**

**A:** WSL2 provides a Linux environment aligned with common containers, Kubernetes tooling and server operations. Keeping active repositories in the Linux filesystem reduces cross-filesystem friction. VS Code can edit the same Linux files through its WSL integration. Windows itself is still a valid host; the key is consistent execution and a single authoritative working copy.

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
