# Learning Notes

## Git Environment Checkpoint

- The working tree contains checked-out files being edited. The staging area (index) holds the selected snapshot for the next commit. Further edits after git add require staging again if they should enter that commit.
- A commit records the staged snapshot with metadata and parent references. It can contain incomplete or broken work; testing and review establish confidence. Local commits are not remote backups until published.
- Revert creates a new commit undoing earlier changes; rebase rewrites a sequence of commits onto a new base. They are not interchangeable recovery commands. Do not rewrite shared history without agreement.
- git config --local affects one repository's .git/config and is not distributed through normal cloning. --global normally affects repositories for the current WSL user, not every user or the separate Windows Git environment.
- Commit identity is separate from GitHub authentication. Use the intended verified or GitHub-provided noreply email; do not record identity values or credentials in these notes.
- Project settings verified: core.autocrlf=input; core.editor=code --wait; pull.ff=only; fetch.prune=true; push.default=simple. These local settings are preferences, not shared security controls.
- git check-ignore returns 0 when at least one supplied path is ignored, 1 when none are ignored, and 128 for a fatal error. A single-path .env.example check returning 1 is the expected allowlist result.
- The .env.example file should contain placeholders only. Git allows it through the explicit !.env.example rule. .dockerignore separately controls Docker build context contents; Git ignore rules do not configure Docker.
- .gitignore does not remove already tracked files and does not replace secret scanning. A leaked credential must be revoked or rotated, not merely ignored.
- docker --version reports the client version. docker version also attempts to contact the daemon; a successful server response verifies connectivity but does not prove an application works.
- git diff --check validates relevant diff whitespace. A clean result does not certify all repository files or history.
- origin/main is a local remote-tracking reference. Matching it does not independently verify live GitHub state.

## References
- Git configuration: https://git-scm.com/docs/git-config
- Ignore test behavior: https://git-scm.com/docs/git-check-ignore
- Initial threat-modeling lesson: https://community.owasp.org/Threat_Modeling
