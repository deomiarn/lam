**Problem:** Alias‑Definitionen sind verstreut; kein deterministisches Zusammenführen zwischen global und projektbezogen.

**Lösung (LAM) für Aliases:** asdf‑inspirierte, aber vereinfachte Mechanik:
Lege im Projekt eine .lam-aliases an, LAM findet sie per Walk‑Up, merged sie mit globalen Aliases und lädt automatisch beim cd.

- **Repo‑Datei:** `.lam-aliases` (je Zeile `name=command`).
- **Global:** `~/.lam/alias.d/global.lam-aliases`.
- **Walk‑Up:** Suche von **CWD → Eltern → `$HOME`** nach der **nächsten `.lam-aliases`** (wie asdf mit `.tool-versions`).
- **Merge:** Repo > Global.
- **Runtime:** Kompilat `~/.lam/compiled/current.zsh` wird gesourced (schnell & sicher).
- **CLI:** asdf‑artige Befehle: `lam alias add/rm`, `lam list aliases`, `lam current`, `lam which`, `lam compile`, `lam doctor`.

**KPIs:** Overhead < 10 ms; TTFA < 60 s; deterministischer Output.
