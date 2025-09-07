## Ziele & Non‑Goals

**Ziele**

- Globale + repo‑lokale Aliases verwalten
- Priorität **Repo (.lam-aliases) > Global**
- **Walk‑Up** wie bei asdf (nächstgelegene Konfig gewinnt)
- asdf‑artige CLI‑Experience, aber **ohne** Profil/Version‑Konzept

**Non‑Goals v1**

- Kein Package‑Install/Update‑Flow
- Keine YAML/TOML‑Parser, keine Packs
- Kein Multi‑Shell (Bash/Fish)

---

## Personas & JTBD

- **Dev**: will bekannte asdf‑UX in simpel für Aliases
- **Teammitglied**: Repo teilt Shortcuts via `.lam-aliases`
- **Student**: will Hook‑/CLI‑Design verstehen

**JTBD:** „Beim Projektwechsel sollen **die richtigen Aliases** automatisch aktiv sein, ohne `.zshrc` zu editieren.“
