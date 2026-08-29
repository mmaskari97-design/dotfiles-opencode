# PROACTIVE.md — Full GitHub MCP Development Playbook

> **Prerequisite:** the GitHub MCP is only active when
> `GITHUB_PERSONAL_ACCESS_TOKEN` is set in the environment
> (see README.md "Secrets system"). It is currently **UNSET** — without it,
> every call below fails. Set it first.

## FULL GITHUB MCP CAPABILITIES — Use all:

### BEFORE any build:
- `search_repositories` (trendy, stars:>1000, language:xxx)
- `search_code` (how others implement it)
- `search_issues` (known breakages + fixes)
- `get_file_contents` from best repo to mimic

### INSTEAD of building from scratch:
- `fork_repository` of best template
- `create_repository` for user
- `push_files` with customized version
- `create_branch` + `create_pull_request` workflow

### PHILOSOPHY: Never rebuild what exists. Scrape, mimic, fork, customize.