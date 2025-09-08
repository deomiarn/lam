**Problem:** Aliases liegen verstreut; kein sauberes, deterministisches Verhalten zwischen global und projektlokal.

**Lösung (LAM):** asdf‑inspirierte UX mit **nur zwei Ebenen**:

- **Lokal:** `.lam-aliases` im (nächstgelegenen) Projektordner (per Walk‑Up gesucht).
- **Global:** `~/.lam-aliases` im Homeverzeichnis.
- **Merge:** Lokal **über** Global → Kompilat `~/.lam/compiled/current.zsh` wird beim `cd` gesourced.
- **CLI:** simple Befehle wie `lam add`, `lam rm`, `lam list`, `lam global add`, `lam current`, `lam compile`, `lam which`, `lam doctor`.

**KPIs:** Overhead < 10 ms; TTFA < 60 s; deterministischer Output.

---

## TL;DR (Elevator Pitch)

**Wie asdf, aber ohne Versionskonzept:** Du pflegst **lokale Aliases** in `.lam-aliases` (Projekt), **globale** in `~/.lam-aliases`. Beim Ordnerwechsel lädt LAM automatisch **lokal ⟶ global** (lokal gewinnt).
