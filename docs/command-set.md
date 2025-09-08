## CLI‑API (ohne Scopes, global via Subcommand)

**Lokal (Default: aktuelles Verzeichnis / nächstgelegene `.lam-aliases`)**

- `lam add <name> <command>` – legt `./.lam-aliases` an (falls fehlt) und fügt/ersetzt Alias
- `lam rm <name>` – entfernt Alias aus nächstgelegener `.lam-aliases`
- `lam list` – zeigt Inhalte der nächstgelegenen `.lam-aliases`

**Global**

- `lam global add <name> <command>` – schreibt nach `~/.lam-aliases`
- `lam global rm <name>`
- `lam global list`

**Status & Auflösung**

- `lam current` – zeigt Pfad der **aktiven lokalen** `.lam-aliases` (falls vorhanden) und, ob global gemerged wird
- `lam which <alias>` – zeigt Quelle (**local/global**) und expandierten Befehl

**Runtime/Utils**

- `lam compile` – merge lokal>global → schreibt `compiled/current.zsh`
- `lam doctor` – prüft Pfade, Rechte, Hook, Walk‑Up‑Treffer
- `lam version` / `lam info` – Version/Debuginfos
