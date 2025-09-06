## Projektziele

- Globale und repo-spezifische Aliases verwalten
- Repo > User Priorität (deterministisch)
- CLI-Befehle analog zu **asdf**: `lam local`, `lam global`, `lam list`, `lam compile`, `lam doctor`
- Automatisches Laden via `chpwd`Hook

## Non-Goals (v1)

- Kein YAML/TOML Parser, keine „Packs“
- Kein Walk-Up über mehrere Ebenen
- Keine Bash/Fish Unterstützung
- Kein Remote-Sync

## Personas & JTBD

- **Entwickler**: will globale Aliases pflegen + im Projekt überschreiben
- **Teammitglied**: will repo-spezifische Aliases ohne `~/.zshrc`
- **Student**: will Shell-Ökosystem und CLI lernen

**Job-to-be-Done**: Richtige Aliases sollen automatisch beim Projektwechsel aktiv sein.
