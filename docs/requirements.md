## Ziele & Non‑Goals

**Ziele**

- Super‑einfaches Alias‑Management mit **nur zwei Ebenen** (lokal & global)
- **Keine CLI‑Scopes/Flags** nötig
- Walk‑Up: Nächstgelegene `.lam-aliases` gilt (CWD → Eltern → Root; Fallback global)
- asdf‑ähnliche UX (Bekanntheit, Developer‑Erwartung)

**Non‑Goals v1**

- Kein Profil/Version‑System, keine Packs
- Kein Package‑Install/Update‑Flow
- Keine Multi‑Shell‑Unterstützung (nur Zsh)

---

## Personas & JTBD

- **Dev**: Will „einfach kurz Aliases pro Projekt“ – ohne `.zshrc`‑Frickelei.
- **Team**: Teilt `.lam-aliases` im Repo, alle haben dieselben Shortcuts.
- **Student**: Lernt Hooks/CLI/Dateikonventionen.

**JTBD:** „Wechsle ich das Projekt, sollen **die richtigen Aliases** sofort aktiv sein.“
