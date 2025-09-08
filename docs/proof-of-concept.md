## Projektstruktur (Dateibaum)

```
alias-manager/
  bin/
    lam
  plugin/
    lam.plugin.zsh
  docs/
    requirements.md
    architecture.md
    testing.md
    roadmap.md
  examples/
    .lam-aliases            # Beispiel-Repo-Datei
```

**Host‑Umgebung (nach Install/Init)**

```
~/.lam-aliases              # globale Deklaration
~/.lam/
  compiled/
    current.zsh
~/.lamrc                    # optional
$ZSH_CUSTOM/plugins/lam/lam.plugin.zsh
```
