# Learning Roadmap — Enterprise Secure Cloud-Native Platform

Approved: 2026-10-24
Current phase and completion status: see PROJECT_PROGRESS.md.

## Business Scenario
Build an internal service-request platform:
- Requesters submit and view their own requests.
- Operators triage, assign, and resolve requests.
- Administrators manage access.
- Audit events record important actions.

Use synthetic data and begin with one application service.

## Learning and Engineering Outcomes
Demonstrate reproducible environments, secure access, persistent data,
validated delivery, observability, failure recovery, and cost-aware
operations through practical implementation and recorded evidence.

Set measurable latency, availability, and recovery targets after defining
the workload. Do not claim production readiness without evidence.

## Approved Architecture Direction
Progress from:
1. A Python/FastAPI application and PostgreSQL.
2. A reproducible Docker Compose environment.
3. A local Kubernetes laboratory using kind.
4. A time-limited AWS deployment after cost review and explicit approval.

Use OIDC for authentication and application-enforced authorization.
The identity provider remains to be selected.

The target AWS architecture includes TLS ingress, ECR, EKS workers in
private subnets, private managed PostgreSQL, workload identity, managed
secrets, and observability.

Approval of this direction does not authorize provisioning or finalize
provider choices, sizing, networking details, or security policies.

## Phases and Completion Criteria

| Phase | Focus and dependencies | Completion evidence |
|---|---|---|
| 0 — Requirements and baseline | Approve scope; inspect WSL, Git, tools, and resources | Recorded inventory, approved architecture direction, learner Git baseline, initial requirements and threat model |
| 1 — Linux and networking | Build on the verified development environment | Learner explains and troubleshoots processes, permissions, ports, DNS, and HTTP |
| 2 — Application and data | Use Phase 1 skills; define acceptance tests before coding | Request workflow, migrations, input validation, authentication, authorization, and negative tests work |
| 3 — Containers | Containerize the working application | Reproducible Compose deployment, persistence, secure container settings, and failure behavior verified |
| 4 — Secure CI | Automate checks for the containerized application | Tests and relevant scans run; controlled unsafe changes fail checks |
| 5 — Local Kubernetes | Build on container and networking knowledge | Deployments, services, probes, limits, access boundaries, and recovery demonstrated |
| 6 — Packaging and GitOps | Understand plain manifests before Helm and Argo CD | Reviewed configuration deploys reproducibly; reconciliation and rollback demonstrated |
| 7 — AWS foundations | Apply identity, networking, and IaC concepts | Approved cost estimate; reviewed IAM, network, Terraform state, and teardown design; provision only after explicit approval |
| 8 — Cloud deployment | Use the validated AWS foundations | Application runs with verified access boundaries, workload identity, TLS, and operational checks |
| 9 — Production operations | Operate the deployed system | Dashboards, actionable alerts, backup restoration, incident exercise, cost review, and portfolio evidence |

## Technology Introduction
Introduce each component when needed:
- GitHub Actions for CI.
- Terraform for reproducible cloud infrastructure.
- Helm for Kubernetes packaging.
- Argo CD for GitOps reconciliation.
- Security scanners and policy checks appropriate to each artifact.
- Structured logs and health checks first; metrics, alerts, and traces
  when operational requirements justify them.

Record alternatives and final choices in DECISIONS.md.
Do not install every planned tool at the start.

## Learning Cycle and Milestone Gate
For every milestone:
Learn → Design → Implement → Test → Break → Troubleshoot → Secure →
Validate → Document → Commit.

The learner implements important tasks.
Include successful behavior, rejected behavior, and safe failure exercises.
Review evidence and understanding before advancing.
Update progress and documentation at each checkpoint.
Commits and remote actions require the user's approval.

## Initial Practical Checkpoint
Reproduce and explain:
- Linux repository location and executable paths.
- Working tree, staging area, and commits.
- Git status, recent history, diff summary, and whitespace findings.
- Docker client versus daemon availability.
- Ignore rules, including the intentionally allowed .env.example.

Review existing changes before staging.
Do not infer AWS authentication from CLI availability.