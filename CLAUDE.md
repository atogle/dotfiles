# CLAUDE.md (Global)

## 🧠 Workflow Protocol
1.  **Plan:** Start every task with a bulleted implementation plan.
2.  **Review:** Pause for user approval.
3.  **Branch:** Create a feature branch (`feature/description`) immediately after approval.
4.  **Test:** Write/Update tests (TDD) before implementation.
5.  **Verify:** Run tests locally and confirm success before PR.
6.  **PR:** Generate a PR description with Summary, Verification Proof, and Rationale.

## 🛠 Code Standards
- **Style:** Match existing patterns. When in doubt, read local configuration files (e.g., `.eslintrc`, `pyproject.toml`).
- **Commits:** Create atomic, small commits with semantic messages (e.g., `feat:`, `fix:`).
- **Security:** Use environment variables for secrets. Validate inputs at system boundaries.
- **Handling:** Fail gracefully with explicit error messages.

## 🤖 Interaction Style
- **Concise:** Provide code and facts. Omit pleasantries and filler ("I hope this helps").
- **Honest:** If you lack context, ask. If you cannot find a file, say so.
- **Context:** Read `README.md` or `docs/` files if the prompt implies domain complexity.

## ⚡️ Standard Commands
(Update these per project if necessary)
- **Test:** `npm test` or `pytest`
- **Lint:** `npm run lint` or `flake8`
- **Build:** `npm run build`