# Contributing Back to MYOB-Technology/MYOB-AI-Playbook

## Overview

This guide shows you how to make edits and raise Pull Requests (PRs) to contribute your improvements back to the **MYOB-Technology/MYOB-AI-Playbook** repository.

---

## Current Setup

You're now on a special branch for MYOB contributions:

```
Your Fork: jfilatow/AI-Playbook
    ├── main (stable)
    ├── develop (your development)
    └── pr/myob-contributions (YOU ARE HERE) ← for PRs to MYOB
```

### Repository Configuration

```bash
# Your remotes
origin          git@github.com:jfilatow/AI-Playbook.git (your fork)
myob-upstream   git@github.com:MYOB-Technology/MYOB-AI-Playbook.git (PR target)
defra           https://github.com/DEFRA/defra-ai-sdlc.git (reference)
```

---

## Workflow for Contributing to MYOB

### Step 1: Sync with Latest MYOB Code

Before making changes, ensure you have the latest MYOB code:

```bash
# Fetch latest from MYOB
git fetch myob-upstream

# See what's new
git log --oneline pr/myob-contributions..myob-upstream/main

# If MYOB has updates, rebase your branch
git rebase myob-upstream/main
```

### Step 2: Make Your Changes

You're now on the `pr/myob-contributions` branch. Make your edits:

```bash
# Verify you're on the right branch
git branch
# * pr/myob-contributions  ← you should see this

# Make your changes to files
# ... edit files in your editor ...

# Check what you changed
git status
git diff

# Stage your changes
git add <files>

# Or stage all changes
git add .
```

### Step 3: Commit Your Changes

Use clear, descriptive commit messages following conventional commits:

```bash
# Commit with a good message
git commit -m "feat: add comprehensive branching strategy guide"

# Or for fixes
git commit -m "fix: correct broken links in API documentation"

# Or for documentation
git commit -m "docs: enhance getting started guide with examples"
```

**Commit Message Guidelines:**
- `feat:` - New features or enhancements
- `fix:` - Bug fixes
- `docs:` - Documentation changes
- `refactor:` - Code refactoring
- `style:` - Formatting, no code change
- `test:` - Adding tests
- `chore:` - Maintenance tasks

### Step 4: Push to Your Fork

Push your PR branch to your personal fork:

```bash
# Push to your fork (origin)
git push origin pr/myob-contributions

# First time push (set upstream tracking)
git push -u origin pr/myob-contributions
```

### Step 5: Create Pull Request to MYOB

Now create a PR from your fork to MYOB-Technology:

```bash
# Using GitHub CLI (recommended)
gh pr create \
  --repo MYOB-Technology/MYOB-AI-Playbook \
  --base main \
  --head jfilatow:pr/myob-contributions \
  --title "Your PR title" \
  --body "Detailed description of your changes"
```

**Or manually on GitHub:**

1. Go to: https://github.com/MYOB-Technology/MYOB-AI-Playbook
2. Click "Pull requests" → "New pull request"
3. Click "compare across forks"
4. Set:
   - **Base repository**: `MYOB-Technology/MYOB-AI-Playbook`
   - **Base branch**: `main`
   - **Head repository**: `jfilatow/AI-Playbook`
   - **Compare branch**: `pr/myob-contributions`
5. Click "Create pull request"
6. Fill in title and description
7. Submit

---

## PR Best Practices

### ✅ Good PR Characteristics

1. **Focused Changes**
   - One feature or fix per PR
   - Keep PRs under 400 lines of changes
   - Related changes grouped together

2. **Clear Description**
   ```markdown
   ## Description
   Brief summary of what this PR does
   
   ## Motivation
   Why this change is needed
   
   ## Changes Made
   - Added branching strategy documentation
   - Updated fork management guide
   - Created visual diagrams
   
   ## Testing
   How you tested these changes
   
   ## Screenshots (if applicable)
   Visual proof of changes
   ```

3. **Clean Commits**
   - Descriptive commit messages
   - Logical commit grouping
   - No merge commits (use rebase)

4. **Up to Date**
   - Rebased on latest MYOB main
   - No conflicts
   - Tests passing (if applicable)

### ❌ Avoid

- ❌ PRs with your personal fork documentation (keep those separate)
- ❌ Multiple unrelated changes in one PR
- ❌ Commits with "WIP" or "fix typo"
- ❌ PRs that conflict with MYOB main
- ❌ Changes without clear explanation

---

## Example Workflow

### Scenario: You want to improve the Getting Started documentation

```bash
# 1. Start fresh from MYOB main
git checkout pr/myob-contributions
git fetch myob-upstream
git rebase myob-upstream/main

# 2. Make your edits
# ... edit pages/getting-started/README.md ...

# 3. Review changes
git diff pages/getting-started/README.md

# 4. Commit
git add pages/getting-started/README.md
git commit -m "docs: enhance Getting Started guide with practical examples and clarifications"

# 5. Push to your fork
git push origin pr/myob-contributions

# 6. Create PR
gh pr create \
  --repo MYOB-Technology/MYOB-AI-Playbook \
  --base main \
  --head jfilatow:pr/myob-contributions \
  --title "docs: enhance Getting Started guide" \
  --body "Improves the Getting Started documentation with:
- Practical examples for beginners
- Clearer setup instructions
- Visual diagrams for workflow
- Common troubleshooting tips"
```

---

## Managing Multiple PRs

### Create Separate Branches for Each PR

```bash
# For feature 1
git checkout myob-upstream/main
git checkout -b pr/feature-1
# ... make changes ...
git push origin pr/feature-1

# For feature 2
git checkout myob-upstream/main
git checkout -b pr/feature-2
# ... make changes ...
git push origin pr/feature-2

# For bug fix
git checkout myob-upstream/main
git checkout -b pr/fix-broken-links
# ... make changes ...
git push origin pr/fix-broken-links
```

### Track Your PRs

```bash
# List your PRs to MYOB
gh pr list --repo MYOB-Technology/MYOB-AI-Playbook --author @me

# Check PR status
gh pr status --repo MYOB-Technology/MYOB-AI-Playbook

# View specific PR
gh pr view <PR-number> --repo MYOB-Technology/MYOB-AI-Playbook
```

---

## Handling PR Feedback

### When MYOB Requests Changes

```bash
# 1. Checkout your PR branch
git checkout pr/myob-contributions

# 2. Make requested changes
# ... edit files ...

# 3. Commit changes
git add .
git commit -m "refactor: address PR feedback - improve clarity in examples"

# 4. Push (updates the PR automatically)
git push origin pr/myob-contributions
```

### If MYOB Main Has Updated

```bash
# Rebase your PR on latest MYOB
git fetch myob-upstream
git rebase myob-upstream/main

# If there are conflicts, resolve them
# ... resolve conflicts in your editor ...
git add <resolved-files>
git rebase --continue

# Force push (updates the PR)
git push origin pr/myob-contributions --force-with-lease
```

---

## What to Contribute

### Good Candidates for PRs

✅ **Documentation Improvements**
- Fixing typos and grammar
- Adding missing examples
- Clarifying confusing sections
- Adding diagrams or visuals

✅ **Bug Fixes**
- Broken links
- Incorrect code examples
- Missing files or assets

✅ **Enhancements**
- New prompt examples
- Additional tool guidance
- Case studies and real examples
- Best practices from your experience

✅ **Structure Improvements**
- Better organization
- Navigation enhancements
- Consistency improvements

### Keep in Your Fork (Don't PR)

🚫 **Personal Customizations**
- Your fork-specific documentation (FORK_INFO.md, etc.)
- Personal branch structure
- Organization-specific branding
- Comparison documents (MYOB_vs_DEFRA_Comparison.md)

🚫 **Experimental Features**
- Untested changes
- Work-in-progress content
- Organization-specific policies
- Personal notes

---

## PR Checklist

Before submitting a PR to MYOB, verify:

- [ ] Changes are on `pr/myob-contributions` (or similar PR branch)
- [ ] Rebased on latest `myob-upstream/main`
- [ ] No merge conflicts
- [ ] Commits have clear, conventional messages
- [ ] No personal fork documentation included
- [ ] Changes are focused and related
- [ ] PR description is clear and detailed
- [ ] Links work and images display correctly
- [ ] Markdown formatting is correct
- [ ] No broken cross-references

---

## Sync Strategy

### Keeping Your Fork and PRs in Sync

```bash
# Weekly: Sync your main with MYOB
git checkout main
git fetch myob-upstream
git merge myob-upstream/main
git push origin main

# Update develop from main
git checkout develop
git merge main
git push origin develop

# Rebase PR branches if needed
git checkout pr/myob-contributions
git rebase myob-upstream/main
git push origin pr/myob-contributions --force-with-lease
```

---

## Quick Reference Commands

```bash
# Start new PR work
git checkout myob-upstream/main
git checkout -b pr/descriptive-name

# Check you're on right branch
git branch
# * pr/descriptive-name

# Make changes and commit
git add .
git commit -m "type: descriptive message"

# Push to your fork
git push origin pr/descriptive-name

# Create PR to MYOB
gh pr create --repo MYOB-Technology/MYOB-AI-Playbook \
  --base main \
  --head jfilatow:pr/descriptive-name

# Check PR status
gh pr status --repo MYOB-Technology/MYOB-AI-Playbook

# Update PR after feedback
git add .
git commit -m "refactor: address feedback"
git push origin pr/descriptive-name
```

---

## Troubleshooting

### Can't Push to MYOB

You can't push directly to MYOB - that's correct! You push to your fork and create a PR:

```bash
# ✅ Correct: Push to your fork
git push origin pr/myob-contributions

# ❌ Wrong: Don't try to push to MYOB directly
git push myob-upstream pr/myob-contributions  # This will fail
```

### PR Shows Your Fork Documentation

Remove personal files from your PR branch:

```bash
# Remove files that shouldn't be in PR
git rm FORK_INFO.md FORK_SUCCESS.md MYOB_vs_DEFRA_Comparison.md
git commit -m "chore: remove fork-specific documentation"
git push origin pr/myob-contributions
```

### Conflicts When Rebasing

```bash
# Start rebase
git rebase myob-upstream/main

# If conflicts occur
# 1. Edit conflicted files
# 2. Remove conflict markers
# 3. Stage resolved files
git add <resolved-files>

# 4. Continue rebase
git rebase --continue

# Or abort if needed
git rebase --abort
```

---

## Current Status

✅ **You are set up to contribute!**

- **Current Branch**: `pr/myob-contributions`
- **Purpose**: Make edits for PR to MYOB
- **Target**: MYOB-Technology/MYOB-AI-Playbook
- **Your Fork**: jfilatow/AI-Playbook

### Next Steps

1. ✅ You're on `pr/myob-contributions` branch
2. 📝 Make your edits
3. 💾 Commit changes
4. 🚀 Push to your fork
5. 📨 Create PR to MYOB

---

## Important Notes

### ⚠️ MYOB Repository Policy

Earlier attempts showed that MYOB-Technology/MYOB-AI-Playbook may have fork policies that prevent direct forking through GitHub's fork button. However, you can still:

✅ Create PRs from your independent fork  
✅ Contribute through Pull Requests  
✅ Sync with MYOB upstream  

❓ Check with MYOB team about their contribution policy before submitting large PRs

### 🤝 Collaboration

For MYOB-specific questions:
- Contact the MYOB AI Codex team
- Check if there's a CONTRIBUTING.md in MYOB repo
- Ask about internal review process
- Inquire about preferred contribution style

---

## Resources

- **MYOB Repository**: https://github.com/MYOB-Technology/MYOB-AI-Playbook
- **Your Fork**: https://github.com/jfilatow/AI-Playbook
- **GitHub PR Guide**: https://docs.github.com/en/pull-requests
- **Conventional Commits**: https://www.conventionalcommits.org/

---

*Last Updated: October 28, 2025*  
*Current Branch: pr/myob-contributions*  
*Ready to contribute to MYOB-Technology/MYOB-AI-Playbook*

