#!/usr/bin/env bash
set -euo pipefail

usage() {
    echo "Usage: $0 [--use-draft-space]"
    echo "Example: $0"
    exit 1
}

if [[ $# -gt 1 ]]; then
    usage
fi

use_draft_space=false

if [[ $# -eq 1 ]]; then
    if [[ "$1" != "--use-draft-space" ]]; then
        usage
    fi
    use_draft_space=true
fi

CONFLUENCE_DOMAIN=myobconfluence.atlassian.net
CONFLUENCE_PATH=/wiki/
CONFLUENCE_USER_NAME=ent.github-confluence.svc@myob.com
CONFLUENCE_API_KEY=$(aws ssm get-parameter --name /codex/confluence/token --no-cli-pager --query Parameter.Value | tr -d '"')

if $use_draft_space; then
    echo "Publishing to draft space..."

    # Remove the Confluence metadata from the markdown files
    # so that we don't publish to the production space page IDs
    # Run inside a container to avoid permission issues
    docker run --rm -v "$(pwd)/content:/content" bash -c \
        'find content -name "*.md" -exec bash -c '\''for f; do sed -i "/^<!-- confluence-.*: .* -->$/d" $f; done'\'' _ {} \;'

    CONFLUENCE_SPACE_KEY=CODEX
    CONFLUENCE_ROOT_PAGE_ID=10376743183
    md2conf_root_page_args=(
        -r
        "$CONFLUENCE_ROOT_PAGE_ID"
    )
    BRANCH_NAME=$BUILDKITE_BRANCH
    COMMIT_HASH=$(git rev-parse --short HEAD)
    GENERATED_BY="<b>DRAFT COPY ONLY!</b> Commit <a href=\"https://github.com/MYOB-Technology/codex/commit/$COMMIT_HASH\">$COMMIT_HASH</a> on branch <a href=\"https://github.com/MYOB-Technology/codex/tree/$BRANCH_NAME\">$BRANCH_NAME</a>. Check out the published <a href=\"https://myobconfluence.atlassian.net/wiki/spaces/TEC/pages/8855027852/MYOB+Codex\">Codex</a>."
else
    echo "Publishing to production space..."
    CONFLUENCE_SPACE_KEY=TEC
    md2conf_root_page_args=()
    GENERATED_BY='Codex Automation - Do not edit! Check out the <a href="https://github.com/MYOB-Technology/codex">original source</a>.'
fi

# Make the content writable by the container md2conf user
chmod -R o+w content

docker run --rm -v "$(pwd)/content:/workdir/content" leventehunyadi/md2conf:0.3.3 \
    -d "$CONFLUENCE_DOMAIN" \
    -p "$CONFLUENCE_PATH" \
    -u "$CONFLUENCE_USER_NAME" \
    -a "$CONFLUENCE_API_KEY" \
    -s "$CONFLUENCE_SPACE_KEY" \
    "${md2conf_root_page_args[@]}" \
    --ignore-invalid-url \
    --generated-by "$GENERATED_BY" \
    /workdir/content
