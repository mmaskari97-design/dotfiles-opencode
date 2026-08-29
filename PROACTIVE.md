# FULL PROACTIVE GITHUB SYSTEM

## RULE: Never build from scratch if it exists

Before ANY build, search in order:
1. `github_search_repositories` query="<thing> stars:>1000"
2. `github_search_code` query="<implementation> language:typescript"
3. `github_search_issues` query="<breakage> fix tool"
4. `get_file_contents` from best repo to mimic pattern

## GitHub MCP Tools Available:
- `search_repositories` — trending repos
- `search_code` — code across all public repos
- `search_issues` — known bugs/fixes
- `get_file_contents` — read any file from any public repo
- `list_commits` — see recent fixes
- `create_repository` — create repo for user
- `fork_repository` — fork template instead of building
- `create_or_update_file` / `push_files` — push customized code
- `create_branch` + `create_pull_request` — PR workflow
- `search_users` — find experts

## Philosophy:
- Don't build auth → fork better-auth/clerk/lucia
- Don't debug breakage → find tool that prevents it
- Use public repos as framework resource to mimic
- Fork + customize > build from zero

## Examples:
- User: "build dashboard" → search "shadcn dashboard template stars:>5000" → fork → customize → push to new repo
- User: "auth keeps breaking" → search issues "auth breakage fix" → find tool → use it