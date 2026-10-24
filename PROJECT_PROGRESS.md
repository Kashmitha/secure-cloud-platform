# PROJECT_PROGRESS.md

## Project Identity
Name: Enterprise Secure Cloud-Native Platform
Project Directory: 01-secure-cloud-platform
Current Phase: 0 - Planning
Current Status: Environment inspection complete; architecture proposal awaiting user approval
Last Updated: 2026-10-24 (Asia/Colombo)

## Project Objective
Build an enterprise-grade DevSecOps project through hands-on learning, design, implementation, security testing, and operations.

## Current Architecture
No approved architecture or application implementation yet.
Proposal presented in the 2026-10-24 session: an internal service-request platform with requester, operator, and administrator roles; a small Python API, PostgreSQL, and an OIDC identity provider. Develop in WSL using Docker Compose, progress to local Kubernetes, then consider time-limited AWS deployments. Proposed cloud target: ECR, EKS private worker nodes, managed PostgreSQL, TLS ingress, workload identity, managed secrets, and observability. These are proposals, not accepted decisions.

## Technology Stack
Verified locally: WSL2 Ubuntu, Git, Docker Desktop integration, Docker Compose, AWS CLI, kubectl, Python, curl, and a VS Code launcher.
Proposed later: FastAPI, PostgreSQL, OIDC, kind, Helm, Terraform, GitHub Actions, Argo CD, appropriate security scanners and observability tools. Introduce incrementally after approval and prerequisites.

## Completed Tasks
- [x] Read AGENTS.md and complete initial PROJECT_PROGRESS.md.
- [x] Inspect repository, WSL environment, tool availability, Docker daemon connectivity, and representative ignore rules.
- [ ] Initialize and validate the full project learning environment (installations and practical labs remain).
- [ ] Approve business requirements and architecture.

## Current Task
Review the proposed business scenario, requirements, and architecture with the user.

## Next Tasks
- [ ] Obtain approval or revisions for the architecture and roadmap proposal.
- [ ] First learner checkpoint: reproduce the read-only WSL/Git/tool checks, explain working tree/index/commit, and review existing line-ending differences.
- [ ] Create README.md, LEARNING_ROADMAP.md, and DECISIONS.md after approval; add LEARNING_NOTES.md and TROUBLESHOOTING.md as lessons and incidents occur.
- [ ] Define the first application acceptance tests and threat model before coding.

## Technical Decisions
No architecture decisions approved yet.
Inspection used Linux Git within WSL rather than adding a Windows Git safe.directory exception. Preserve the user's existing changes and the single Linux repository.

## Files Created or Modified
Before inspection, .gitignore, AGENTS.md, and PROJECT_PROGRESS.md already had uncommitted changes (one changed line each according to git diff --numstat).
This session updated only PROJECT_PROGRESS.md for the required handover. No application or infrastructure files created.

## Commands and Validation Results
- PowerShell Get-ChildItem / Get-Content: only .git, .gitignore, AGENTS.md, and PROJECT_PROGRESS.md existed; instructions and progress read completely.
- Windows git status/log: failed with dubious ownership warning for WSL UNC path. No safe.directory exception added.
- Initial sandboxed wsl --status / --list --verbose: failed with Wsl/E_ACCESSDENIED. Read-only WSL commands succeeded after approved execution outside that restriction.
- WSL cat /etc/os-release / uname -r: Ubuntu 26.04.1 LTS; kernel 6.18.33.2-microsoft-standard-WSL2.
- WSL git status --short --branch / git log -5 --oneline: main tracks origin/main; initial commit b275b61; three pre-existing modified tracked files. origin remote exists; network access/authentication not tested.
- WSL command -v: Git, VS Code launcher, Docker, AWS CLI, kubectl, Python3, curl found. Terraform, Helm, kind, Node not found on PATH; absence from PATH does not prove no installation elsewhere.
- WSL versions: Git 2.53.0; Docker client/server 29.7.2; Docker Desktop server 4.89.0; Compose v5.5.0; AWS CLI 2.37.9; kubectl v1.36.1; Python 3.14.4.
- docker version: PASS, daemon responds. No image pulled or container run.
- free -h / df -h .: approximately 15 GiB WSL RAM, 12 GiB available, 4 GiB swap, 948 GiB filesystem space available at inspection. Host physical capacity not independently checked.
- git check-ignore --no-index with synthetic paths: .env, demo.pem, terraform.tfstate, terraform.tfvars, and .terraform/example ignored; .env.example not ignored as intended. PASS for these examples only; not a comprehensive secret scan.
- git diff --check: FAIL before documentation update; trailing CR characters reported on the final lines of all three existing files. No normalization of .gitignore or AGENTS.md performed.
- No application, Kubernetes cluster, AWS identity, cloud connectivity, security scanner, or recovery tests run. No credentials or kubeconfig contents inspected.

## Known Issues and Blockers
- Windows Git ownership warning: use WSL Git for this Linux repository.
- Pre-existing final-line CR characters in .gitignore and AGENTS.md remain for learner review.
- Terraform, Helm, kind, and Node unavailable on inspected WSL PATH; install only when needed.
- VS Code WSL extension connection not verified; only launcher discovered.
- Architecture approval pending; no implementation blocker beyond this planned review gate.

## Lessons Learned
A CLI's presence is different from a working service: Docker daemon connectivity was verified separately. AWS CLI presence does not establish authentication. Ignore rules reduce accidental staging but do not remove tracked secrets or replace secret scanning.

## Environment and Dependencies
Host: Windows environment; exact Windows edition/build not independently verified.
Development: WSL2 Ubuntu 26.04.1, Linux filesystem repository, VS Code launcher present.
AI Assistant: Codex.
Cloud resources: None provisioned by this session; existing account resource inventory not inspected.

## Git State
Repository: Initialized (corrects original handover's uninitialized claim).
Branch: main, tracking origin/main.
Last Commit: b275b61 docs: initialize DevSecOps learning workspace.
Remote: origin configured; remote URL and credentials not printed.
Working Tree: .gitignore, AGENTS.md, PROJECT_PROGRESS.md modified; no commits or pushes made this session.

## Session Handover
Last Action: Read-only environment inspection and architecture/roadmap proposal; required progress update.
Next Exact Task: Obtain user approval or revisions to the proposed internal service-request platform and local-first roadmap, then guide the learner through the Phase 0 WSL/Git baseline checkpoint before application implementation.
Important Notes: Follow AGENTS.md and the learning-first approach. The user implements important tasks. No paid provisioning, installation, commits, pushes, or substantial scaffolding without required authorization. Architecture and roadmap are still proposals; formalize approved details in repository documents next.

## Session History
- 2026-10-24: Initial progress document created. It initially recorded Git as uninitialized and no environment validation.
- 2026-10-24: Initial mentoring inspection verified an existing Git repository, functioning WSL Docker integration, installed tools, and pre-existing line-ending issues. Corrected stale Git handover; proposed business scenario, architecture, roadmap, and first learner checkpoint. Architecture approval remains pending.

Validation note: Final status still shows the same three modified files. An attempted .NET write failed because PowerShell supplied a provider-qualified path; the file was then saved using Set-Content with LF endings. The final whitespace check retains only the pre-existing .gitignore and AGENTS.md findings.
