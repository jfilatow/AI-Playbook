# Fork Management Information

## Repository Setup

This repository is a personal fork of the MYOB AI Codex, configured to track multiple upstream sources.

### Remote Configuration

```bash
# Your personal fork (default for push/pull)
origin          git@github.com:jfilatow/AI-Playbook.git

# MYOB upstream (original source)
myob-upstream   git@github.com:MYOB-Technology/MYOB-AI-Codex.git

# DEFRA reference (alternative implementation)
defra           https://github.com/DEFRA/defra-ai-sdlc.git
```

### Current Status
- **Created**: October 28, 2025
- **Forked From**: MYOB-Technology/MYOB-AI-Codex
- **Your GitHub**: jfilatow/AI-Playbook

## Working with This Fork

### Daily Workflow

```bash
# Make changes to your local files
git add .
git commit -m "Your commit message"

# Push to your personal fork
git push origin main
```

### Syncing with MYOB Upstream

To get the latest changes from MYOB:

```bash
# Fetch updates from MYOB upstream
git fetch myob-upstream

# View what changed
git log --oneline main..myob-upstream/main

# Merge MYOB changes into your fork
git merge myob-upstream/main

# Resolve any conflicts if needed
# Then push to your fork
git push origin main
```

### Syncing with DEFRA Reference

To see or pull changes from DEFRA:

```bash
# Fetch updates from DEFRA
git fetch defra

# Compare with DEFRA
git diff main defra/main

# Cherry-pick specific DEFRA features (if desired)
git cherry-pick <commit-hash>

# Or merge specific files
git checkout defra/main -- path/to/specific/file.md
```

### Checking for Updates

```bash
# Check status of all remotes
git remote -v

# Fetch all remotes
git fetch --all

# See what's new in MYOB upstream
git log --oneline --graph main..myob-upstream/main

# See what's different in DEFRA
git log --oneline --graph main..defra/main
```

## Collaboration Options

### Contributing Back to MYOB

If you make improvements you'd like to contribute:

```bash
# Create a feature branch
git checkout -b feature/my-improvement

# Make your changes and commit
git add .
git commit -m "feat: add my improvement"

# Push to your fork
git push origin feature/my-improvement

# Then create a Pull Request from your fork to MYOB upstream
# (Note: MYOB's fork policy may prevent this - check with team first)
```

### Sharing Your Fork

Your fork is public at: **https://github.com/jfilatow/AI-Playbook**

Share this URL with others who want to:
- See your customizations
- Fork from your version
- Contribute to your fork

## Repository Relationships

```
MYOB Technology Codex (Original)
         ↓
   [Fork/Import]
         ↓
   MYOB AI Codex
         ↓
   [Your Fork]
         ↓
jfilatow/AI-Playbook (YOU ARE HERE)


Parallel Development:
   DEFRA AI SDLC (Reference)
         ↓
   [Connected as 'defra' remote]
```

## Key Features of Your Fork

Based on MYOB AI Codex, your fork includes:

✅ **Comprehensive Content**
- APIs (23 files)
- Operations (8 files)
- Governance (12 files)
- Data Products (5 files)
- Cloud (4 files)
- Delivery (20 files)
- Standards (4 files)

✅ **MYOB-Specific Features**
- MYOB Technology Codex integration
- Enterprise security standards
- Financial domain examples
- OWASP Top 10 guidance

✅ **AI Development Guidance**
- Context engineering
- AI agent orchestration
- Multiple AI frameworks
- Comprehensive prompt library

✅ **Comparison Documentation**
- MYOB vs DEFRA comparison
- Quick reference summary

## Customization Ideas

Now that you have your own fork, consider:

1. **Personalize the Content**
   - Remove MYOB-specific branding if desired
   - Add your own organization's standards
   - Customize examples for your domain

2. **Add Your Own Sections**
   - Personal notes and learnings
   - Custom tool configurations
   - Project-specific guidelines

3. **Experiment with DEFRA Features**
   - Cherry-pick "The Four Pillars" framework
   - Try Jekyll deployment setup
   - Add Obsidian configuration

4. **Create Your Own Standards**
   - Develop team-specific rules
   - Add custom Cursor rules
   - Build your own prompt library

## Maintenance Schedule

Recommended maintenance activities:

### Weekly
- Check for updates: `git fetch --all`
- Review your changes: `git status`
- Commit and push regularly

### Monthly
- Sync with MYOB upstream: `git fetch myob-upstream && git merge myob-upstream/main`
- Review DEFRA changes: `git log defra/main`
- Update comparison documents if needed

### Quarterly
- Review and clean up old branches
- Update documentation
- Consider contributing improvements back upstream

## Troubleshooting

### Merge Conflicts

If you get merge conflicts when syncing:

```bash
# Start the merge
git merge myob-upstream/main

# You'll see conflict markers in affected files
# Edit files to resolve conflicts

# Mark as resolved
git add <resolved-files>

# Complete the merge
git commit
```

### Reset to Upstream

If you want to discard your changes and reset to MYOB upstream:

```bash
# WARNING: This will lose your local changes!
git fetch myob-upstream
git reset --hard myob-upstream/main
git push origin main --force
```

### Create a Backup

Before major changes, create a backup branch:

```bash
git branch backup-$(date +%Y%m%d)
git push origin backup-$(date +%Y%m%d)
```

## Quick Reference Commands

```bash
# See all remotes
git remote -v

# Check current branch
git branch

# See what's changed locally
git status

# View commit history
git log --oneline --graph --all --decorate

# Compare with MYOB upstream
git diff main myob-upstream/main

# Compare with DEFRA
git diff main defra/main

# Fetch all updates
git fetch --all

# Push your changes
git push origin main
```

## Getting Help

- **GitHub Issues**: Create issues in your fork for tracking
- **Git Documentation**: https://git-scm.com/doc
- **GitHub CLI**: `gh --help`
- **MYOB Team**: Contact MYOB team for upstream questions
- **DEFRA Team**: Reach out via #ask-ace Slack for DEFRA questions

## Next Steps

1. ✅ Fork created and configured
2. ✅ README updated with fork information
3. ✅ Comparison documents available
4. 📝 Customize content for your needs
5. 📝 Add your own learnings and examples
6. 📝 Share with your team if desired

Happy coding! 🚀

