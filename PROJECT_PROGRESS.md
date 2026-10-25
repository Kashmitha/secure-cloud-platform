# PROJECT_PROGRESS.md

## Project Identity
Name: Enterprise Secure Cloud-Native Platform
Project Directory: 01-secure-cloud-platform
Current Phase: 0 - Planning
Current Status: Git environment learning checkpoint complete; documentation publication pending; requirements and initial threat model next
Last Updated: 2026-10-24 (Asia/Colombo)

## Project Objective
Build an enterprise-grade DevSecOps project through hands-on learning, design, implementation, security testing, and operations.

## Current Architecture
Architecture direction approved by the user on 2026-10-24 and recorded in LEARNING_ROADMAP.md. No application or infrastructure implementation yet.
Proposal presented in the 2026-10-24 session: an internal service-request platform with requester, operator, and administrator roles; a small Python API, PostgreSQL, and an OIDC identity provider. Develop in WSL using Docker Compose, progress to local Kubernetes, then consider time-limited AWS deployments. Proposed cloud target: ECR, EKS private worker nodes, managed PostgreSQL, TLS ingress, workload identity, managed secrets, and observability. The user approved this architecture direction; detailed design choices and cloud provisioning still require their appropriate review and approval.

## Technology Stack
Verified locally: WSL2 Ubuntu, Git, Docker Desktop integration, Docker Compose, AWS CLI, kubectl, Python, curl, and a VS Code launcher.
Proposed later: FastAPI, PostgreSQL, OIDC, kind, Helm, Terraform, GitHub Actions, Argo CD, appropriate security scanners and observability tools. Introduce incrementally after approval and prerequisites.

## Completed Tasks
- [x] Read AGENTS.md and complete initial PROJECT_PROGRESS.md.
- [x] Inspect repository, WSL environment, tool availability, Docker daemon connectivity, and representative ignore rules.
- [ ] Initialize and validate the full project learning environment (installations and practical labs remain).
- [x] Approve business scenario, architecture direction, and phased roadmap; detailed requirements remain unfinished.
- [x] Verify project-local Git configuration, configured identity, clean working tree, and representative ignore tests.
- [x] Complete learner explanation of Git concepts and validation results; reviewed with precision corrections.

## Current Task
Git environment checkpoint complete. Review and publish its documentation through a feature branch and pull request; begin the Phase 0 requirements and initial threat-model exercise. Phase 0 is not complete.

## Next Tasks
- [x] Architecture direction and roadmap approved; AGENTS.md and LEARNING_ROADMAP.md recorded in commit cd4a2b2.
- [x] Finish first learner checkpoint: user explained working tree/index/commit, local configuration scope, Docker client versus daemon, and ignore-test exit codes. Assistant reviewed answers and clarified snapshot/stability, WSL user scope, and separate Docker ignore rules.
- [ ] Review, commit, and publish the Git checkpoint documentation using a feature branch and pull request; no remote action performed by assistant.
- [x] LEARNING_ROADMAP.md exists with approved phases 0-9.
- [ ] Create README.md and DECISIONS.md incrementally; add TROUBLESHOOTING.md as useful incident evidence is produced. LEARNING_NOTES.md now records the Git checkpoint lessons.
- [ ] Define the first application acceptance tests and threat model before coding.

## Technical Decisions
Approved direction: internal service-request platform; local application, Compose, kind, then time-limited AWS after explicit cost/provisioning approval. See LEARNING_ROADMAP.md. Identity provider and detailed cloud design remain unresolved.
Inspection used Linux Git within WSL rather than adding a Windows Git safe.directory exception. Preserve the user's existing changes and the single Linux repository.

## Files Created or Modified
Before inspection, .gitignore, AGENTS.md, and PROJECT_PROGRESS.md already had uncommitted changes (one changed line each according to git diff --numstat).
Initial inspection updated only PROJECT_PROGRESS.md. Subsequent user work committed the permanent instructions and roadmap as cd4a2b2. The earlier review updated only PROJECT_PROGRESS.md. The completion review updates PROJECT_PROGRESS.md and creates LEARNING_NOTES.md; no application, infrastructure, or Git configuration changes by the assistant.

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
- Earlier working-tree CR findings no longer appear: git diff --check passes at this review. This does not prove all committed files use LF.
- Terraform, Helm, kind, and Node unavailable on inspected WSL PATH; install only when needed.
- VS Code WSL extension connection not verified; only launcher discovered.
- Git learning checkpoint complete. Documentation commit/push/PR remains pending. Detailed requirements and initial threat model remain unfinished. No technical Git blocker observed.

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
Last Commit: cd4a2b2 docs: preserve mentoring standards and approved roadmap.
Remote: origin configured; remote URL and credentials not printed.
Working Tree: PROJECT_PROGRESS.md was already modified at completion-review start; this review also creates LEARNING_NOTES.md. HEAD and local origin/main match (0 ahead, 0 behind). No live remote query performed; no commits or pushes made by the assistant.

## Session Handover
Last Action: Reviewed learner answers, revalidated Git settings and ignore tests, completed the Git learning checkpoint, and documented lessons.
Next Exact Task: Learner reviews PROJECT_PROGRESS.md and LEARNING_NOTES.md, creates codex/git-baseline-checkpoint, stages only those documents, reviews and commits them, then pushes that branch and opens a PR when ready. Separately draft docs/requirements.md with actors, scope, role/action permissions, acceptance scenarios, and initial threats; submit for review. Phase 0 remains active; do not begin Phase 1 yet.
Important Notes: Follow AGENTS.md and the learning-first approach. The user implements important tasks. No paid provisioning, installation, commits, pushes, or substantial scaffolding without required authorization. Architecture direction and roadmap are approved; the Git environment learning checkpoint is complete, while documentation publication and the remaining Phase 0 requirements/threat-model work remain incomplete.

## Session History
- 2026-10-24: Initial progress document created. It initially recorded Git as uninitialized and no environment validation.
- 2026-10-24: Initial mentoring inspection verified an existing Git repository, functioning WSL Docker integration, installed tools, and pre-existing line-ending issues. Corrected stale Git handover; proposed business scenario, architecture, roadmap, and first learner checkpoint. Architecture approval remains pending.

Validation note: Final status still shows the same three modified files. An attempted .NET write failed because PowerShell supplied a provider-qualified path; the file was then saved using Set-Content with LF endings. The final whitespace check retains only the pre-existing .gitignore and AGENTS.md findings.
## Git Checkpoint Review — 2026-10-24
- Read AGENTS.md, PROJECT_PROGRESS.md, LEARNING_ROADMAP.md, and .gitignore completely; inspected directory and tracked files.
- git status --short --branch: clean main tracking origin/main before this progress update.
- git log -3 --oneline: cd4a2b2 followed by b275b61.
- git diff --stat and git diff --cached --stat: no changes before the progress update.
- git diff --check: PASS before the progress update; earlier whitespace findings are historical.
- git rev-parse --show-toplevel / command -v git: expected Linux project path and /usr/bin/git.
- git config --show-origin --get for core.autocrlf, core.editor, pull.ff, fetch.prune, push.default: all from .git/config; values input, code --wait, only, true, simple. PASS.
- Local user.name/user.email existence and git var GIT_AUTHOR_IDENT validation: PASS without displaying identity. Email ownership/GitHub verification and editor launch were not tested.
- git check-ignore --no-index .env demo.pem terraform.tfstate terraform.tfvars .terraform/example: all five paths printed. PASS for representative exclusions only.
- Standalone git check-ignore --no-index .env.example: no output, exit 1. PASS for the intended allowlist. An earlier combined exit-code wrapper was inconclusive because of shell quoting; the standalone rerun is the authoritative result.
- git ls-files: only .gitignore, AGENTS.md, LEARNING_ROADMAP.md, PROJECT_PROGRESS.md. No full historical secret scan performed.
- git rev-list --left-right --count HEAD...origin/main: 0 / 0. Local refs match; live GitHub authentication and remote state not checked.
- Learner understanding evidence: not yet provided; overall learning checkpoint INCOMPLETE. No next-phase lesson started.
- Documentation decision: correct stale approval/Git state while retaining original inspection history. Last-updated date remains 2026-10-24.
- Session history addition: 2026-10-24 — Verified configured Git environment; corrected handover for approved roadmap and commit cd4a2b2; left learning checkpoint open pending learner explanation.
## Git Checkpoint Completion — 2026-10-24
- Learner supplied all four requested explanations. Understanding accepted with refinements: commits store staged snapshots and do not inherently certify stability; global configuration is scoped to the WSL user; Docker ignore rules are separate; exit 1 from the single-path check means the path is not ignored, not that the command malfunctioned.
- Revalidated five local Git settings and local identity presence: PASS. Identity values not displayed; GitHub email ownership not verified.
- Revalidated representative exclusions: all five paths printed. PASS. Standalone .env.example check: no output, exit 1. PASS.
- git status at completion-review start: main tracks origin/main; PROJECT_PROGRESS.md modified, nothing staged. Latest commit cd4a2b2; local ahead/behind counts 0/0. No live remote query performed.
- git diff --check: PASS before documentation edits. No claim that historical committed line endings or full secret history were scanned.
- Changed documents: PROJECT_PROGRESS.md updated for completion and next task; LEARNING_NOTES.md created for reusable Git lessons. No configuration/application/infrastructure changes.
- GitHub checkpoint proposed: feature branch codex/git-baseline-checkpoint; commit docs: record verified Git environment checkpoint; push and PR performed by learner when ready. Publication is not claimed complete.
- Next lesson introduced: Phase 0 requirements and initial threat modeling. Learner drafts docs/requirements.md; requirements, tests, and controls are design proposals until reviewed and implemented.
- Session history addition: 2026-10-24 — Git environment learning checkpoint completed with technical evidence and learner answers. Phase 0 remains in progress; documentation publication and requirements exercise pending.
