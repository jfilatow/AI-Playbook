# Branching Strategy

## Repository Structure

This repository is a fork of MYOB-Technology/MYOB-AI-Codex with a clear branching strategy for development and upstream synchronization.

## Branch Overview

```
MYOB-Technology/MYOB-AI-Codex (Upstream)
         ↓
    [Forked]
         ↓
jfilatow/AI-Playbook (Your Fork)
    ├── main (stable, synced with MYOB)
    ├── develop (active development)
    └── feature/* (feature branches)
```

## Branch Descriptions

### `main` Branch
- **Purpose**: Stable production-ready version
- **Protection**: Should always be deployable
- **Updates**: 
  - Synced regularly with MYOB upstream
  - Only receives PRs from `develop` or hotfix branches
  - No direct commits (use PRs)

### `develop` Branch
- **Purpose**: Active development and integration
- **Usage**: Your day-to-day working branch
- **Updates**:
  - Create feature branches from here
  - Merge completed features back here
  - Test thoroughly before merging to `main`

### `feature/*` Branches
- **Purpose**: Individual features or experiments
- **Naming**: `feature/description-of-feature`
- **Lifecycle**: 
  - Branch from `develop`
  - Work on specific feature
  - PR back to `develop` when complete
  - Delete after merge

## Workflow

### Daily Development Workflow

```bash
# 1. Switch to develop branch
git checkout develop

# 2. Pull latest changes
git pull origin develop

# 3. Create feature branch
git checkout -b feature/my-new-feature

# 4. Make your changes
# ... edit files ...

# 5. Commit changes
git add .
git commit -m "feat: add my new feature"

# 6. Push feature branch
git push origin feature/my-new-feature

# 7. Create Pull Request on GitHub (optional)
gh pr create --base develop --head feature/my-new-feature

# 8. After PR is merged, clean up
git checkout develop
git pull origin develop
git branch -d feature/my-new-feature
```

### Syncing with MYOB Upstream

```bash
# 1. Switch to main branch
git checkout main

# 2. Fetch MYOB updates
git fetch myob-upstream

# 3. Merge MYOB changes
git merge myob-upstream/main

# 4. Resolve any conflicts if needed

# 5. Push to your fork
git push origin main

# 6. Update develop with main changes
git checkout develop
git merge main
git push origin develop
```

### Releasing to Main

```bash
# When develop is stable and ready

# 1. Ensure develop is up to date
git checkout develop
git pull origin develop

# 2. Switch to main
git checkout main
git pull origin main

# 3. Merge develop into main
git merge develop --no-ff -m "release: merge develop into main"

# 4. Tag the release (optional)
git tag -a v1.0.0 -m "Release version 1.0.0"

# 5. Push main and tags
git push origin main
git push origin --tags
```

## Branch Protection Rules (Recommended)

### For `main` Branch
- Require pull request reviews before merging
- Require status checks to pass
- Require branches to be up to date before merging
- No force pushes
- No deletions

### For `develop` Branch
- Allow direct pushes for quick iterations
- Encourage PRs for significant features
- Regular merges to `main` when stable

## Common Scenarios

### Starting New Work

```bash
# Always branch from develop for new work
git checkout develop
git pull origin develop
git checkout -b feature/your-feature-name
```

### Experimenting with DEFRA Features

```bash
# Create experimental branch
git checkout develop
git checkout -b experiment/defra-integration

# Cherry-pick specific DEFRA commits
git cherry-pick <defra-commit-hash>

# Or merge specific files
git checkout defra/main -- path/to/file
```

### Quick Hotfix to Main

```bash
# For urgent fixes
git checkout main
git checkout -b hotfix/urgent-fix

# Make fix
git add .
git commit -m "fix: urgent hotfix"

# Merge to main
git checkout main
git merge hotfix/urgent-fix
git push origin main

# Also merge to develop
git checkout develop
git merge hotfix/urgent-fix
git push origin develop

# Delete hotfix branch
git branch -d hotfix/urgent-fix
```

### Comparing Branches

```bash
# See differences between branches
git diff main..develop

# See commits in develop not in main
git log main..develop --oneline

# Visual branch structure
git log --graph --oneline --all --decorate
```

## Feature Branch Naming Conventions

Use descriptive names with prefixes:

- `feature/` - New features or enhancements
  - Example: `feature/add-ai-agent-guide`
- `fix/` - Bug fixes
  - Example: `fix/broken-links`
- `docs/` - Documentation updates
  - Example: `docs/update-readme`
- `experiment/` - Experimental features
  - Example: `experiment/defra-pillars`
- `refactor/` - Code refactoring
  - Example: `refactor/reorganize-sections`

## Git Commit Message Convention

Follow conventional commits format:

```
<type>: <description>

[optional body]

[optional footer]
```

**Types:**
- `feat:` - New feature
- `fix:` - Bug fix
- `docs:` - Documentation changes
- `style:` - Code style changes (formatting)
- `refactor:` - Code refactoring
- `test:` - Adding tests
- `chore:` - Maintenance tasks

**Examples:**
```bash
git commit -m "feat: add new AI orchestration framework guide"
git commit -m "fix: correct broken links in API documentation"
git commit -m "docs: update branching strategy"
git commit -m "refactor: reorganize getting started section"
```

## Remote Tracking

Your repository tracks three remotes:

```bash
git remote -v

# Output:
origin          git@github.com:jfilatow/AI-Playbook.git (your fork)
myob-upstream   git@github.com:MYOB-Technology/MYOB-AI-Codex.git (source)
defra           https://github.com/DEFRA/defra-ai-sdlc.git (reference)
```

### Managing Remotes

```bash
# Fetch all remotes
git fetch --all

# See all remote branches
git branch -r

# See all local and remote branches
git branch -a
```

## Visualization

### Current Branch State

```
myob-upstream/main (MYOB original)
        ↓
    [forked]
        ↓
origin/main (your stable) ← you are synced here
        ↓
    [branched]
        ↓
origin/develop (your development) ← you work here
        ↓
    [branched]
        ↓
feature/* (feature branches) ← create these for specific work
```

### Typical Development Flow

```
1. Create feature branch from develop
   develop → feature/new-thing

2. Work on feature
   feature/new-thing (commits)

3. Merge to develop
   feature/new-thing → develop

4. Test in develop

5. Merge to main when stable
   develop → main

6. Sync with MYOB
   myob-upstream/main → main → develop
```

## Best Practices

### ✅ Do's

- **Branch often** - Create feature branches for any significant work
- **Commit frequently** - Small, logical commits are easier to review
- **Sync regularly** - Pull upstream changes weekly
- **Use descriptive names** - Clear branch and commit names
- **Test before merging** - Ensure develop is stable before merging to main
- **Delete merged branches** - Keep repository clean
- **Document decisions** - Update docs as you make changes

### ❌ Don'ts

- **Don't commit directly to main** - Always use develop or feature branches
- **Don't force push to main** - Preserve history
- **Don't keep stale branches** - Clean up after merging
- **Don't mix unrelated changes** - One feature per branch
- **Don't ignore conflicts** - Resolve conflicts properly
- **Don't skip upstream syncs** - Stay current with MYOB

## Quick Reference

```bash
# See current branch
git branch

# Create and switch to new branch
git checkout -b branch-name

# Switch branches
git checkout branch-name

# List all branches
git branch -a

# Delete local branch
git branch -d branch-name

# Delete remote branch
git push origin --delete branch-name

# See branch history
git log --graph --oneline --all

# Compare branches
git diff branch1..branch2

# Show branch tracking
git branch -vv
```

## Getting Help

- **Git Documentation**: https://git-scm.com/doc
- **GitHub Flow**: https://guides.github.com/introduction/flow/
- **Git Branching**: https://git-scm.com/book/en/v2/Git-Branching-Branching-Workflows

---

## Current Branch Status

You are currently on: **`develop`** branch

To see all branches:
```bash
git branch -a
```

To return to main:
```bash
git checkout main
```

---

*Last Updated: October 28, 2025*  
*Repository: jfilatow/AI-Playbook*  
*Upstream: MYOB-Technology/MYOB-AI-Codex*

