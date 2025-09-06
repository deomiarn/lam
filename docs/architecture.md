## Architekturüberblick

* **Sprache v1**: Zsh Script (CLI + Loader)
* **Sprache v2**: Go (Binary, Performance)
* **Pipeline**: Deklaration → Merge → Compile → Runtime
* **Hook**: `add-zsh-hook chpwd lam-compile-and-source`

## Struktur

```
alias-manager/
  README.md
  bin/lam
  plugin/lam.plugin.zsh
  docs/
    requirements.md
    architecture.md
    testing.md
    roadmap.md
  examples/
    global.lam-aliases
    repo/.lam-aliases
```

## Datenpfade

* User: `~/.config/lam/alias.d/global.lam-aliases`
* Repo: `./.lam-aliases`
* Output: `~/.config/lam/compiled/current.zsh`

## Komponenten

* **CLI Parser**: Subcommand Dispatch
* **File Handler**: Alias-Dateien lesen/schreiben
* **Merge Engine**: Repo überschreibt User
* **Loader Plugin**: Hook + Source

## Datenmodell

* Input: `alias=command` in `.lam-aliases`
* Output: `alias name='command'` in `compiled/current.zsh`
