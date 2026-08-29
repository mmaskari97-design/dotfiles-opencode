# TRENDING TOOLS TO AVOID BREAKAGE — Updated: 2026-08-29

> Live-refreshed via `github_search_repositories` (verified: auth, dashboard,
> MCP servers, Next.js boilerplates). Check this file before building —
> fork + customize beats build-from-scratch.

## How to update this file (run weekly or on demand):
Use `github_search_repositories` per category (search below), pick the top
maintained repos, and replace entries. Helper: `scripts/refresh-trending.sh`.

### Auth (don't build — fork instead):
- **better-auth** — https://github.com/better-auth/better-auth
  Why: comprehensive TypeScript auth framework (2FA, multi-tenant, plugins);
  actively maintained (pushed 2026-08-28). Pick it over building auth.
- **better-auth-starter** — https://github.com/zexahq/better-auth-starter
  Why: instant Next.js auth + admin dashboard skeleton (Better Auth + Drizzle + Postgres).
- **better-auth-nextjs-starter** — https://github.com/daveyplate/better-auth-nextjs-starter
  Why: Better Auth + PostgreSQL + Drizzle + shadcn/ui + TanStack Query, all wired.

### Dashboard / UI (mimic):
- **shadcn-admin** — https://github.com/satnaing/shadcn-admin
  Why: production admin dashboard on Shadcn + Vite; mimic the layout patterns.
- **next-shadcn-dashboard-starter** — https://github.com/Kiranism/next-shadcn-dashboard-starter
  Why: Next.js 16 admin dashboard w/ tables, forms, auth, billing — MIT, AI-friendly.

### MCP Servers (never write one from scratch):
- **awesome-mcp-servers** — https://github.com/punkpeye/awesome-mcp-servers
  Why: catalog of existing MCP servers; search before building one.
- **github/github-mcp-server** — https://github.com/github/github-mcp-server
  Why: GitHub's official server — the one this stack uses.
- **microsoft/playwright-mcp** — https://github.com/microsoft/playwright-mcp
  Why: official browser-automation server (this stack migrated to it; old
  @modelcontextprotocol/server-playwright is dead on npm).
- **modelcontextprotocol/inspector** — https://github.com/modelcontextprotocol/inspector
  Why: visual debugging for MCP servers before trusting one.

### Next.js boilerplates (avoid rebuilding infra):
- **ixartz/Next-js-Boilerplate** — https://github.com/ixartz/Next-js-Boilerplate
  Why: Next.js 16 + TS + ESLint + Drizzle + Vitest + Playwright + Storybook + Sentry pre-wired.
- **ixartz/SaaS-Boilerplate** — https://github.com/ixartz/SaaS-Boilerplate
  Why: SaaS with auth, multi-tenancy, roles, i18n, landing page, DB — biggest build-risk removed.
- **Blazity/next-enterprise** — https://github.com/Blazity/next-enterprise
  Why: enterprise-grade Next.js, testing + tooling included.
- **vercel/next-forge** — https://github.com/vercel/next-forge
  Why: Vercel's Turborepo monorepo template — avoid wiring monorepo yourself.

### Anti-breakage workflow reminder:
- Search: "boilerplate nextjs 15", "mcp-server-*", "<feature> stars:>1000"
- Re-run with: `github_search_repositories query="trending <category> 2026 stars:>1000"`

---
> Agent: When user asks to build something, check this file first, then search GitHub live.