## Architektur & Tech‑Stack

**Sprache:** v1 Zsh‑Script (CLI + Loader), v2 evtl. Go‑Binary.

**Pipeline:** Deklaration → Merge (lokal>global) → Compile → Runtime (source).

**Hook:** `add-zsh-hook chpwd lam-compile-and-source`.

### Files & Dirs

**Deklaration:**

- **Lokal:** `./.lam-aliases` (vom CWD aus per **Walk‑Up** nächstgelegene Datei gesucht)
- **Global:** `~/.lam-aliases`

**Kompilat & Plugin:**

```
~/.lam/
  compiled/
    current.zsh           # GENERATED: nur `alias foo='...'`
$ZSH_CUSTOM/plugins/lam/lam.plugin.zsh
```

**Konfiguration (optional):** `~/.lamrc` (z.B. Pfade/Verbosity).

**ENV Variablen (optional):** `LAM_GLOBAL_FILE` (Default: `~/.lam-aliases`), `LAM_COMPILED_DIR` (Default: `~/.lam/compiled`).

**Priorität:** lokal > global.

**Runtime:** nur `compiled/current.zsh` wird gesourced.

---

## Datenmodell (MVP)

**Deklaration:** pro Zeile `name=command`

**Kompilat:** `alias name='command'` (gequotet; keine Auswertung).

**Validierung:** Kommentare/Leerzeilen ignorieren; Namen `[A-Za-z0-9_-]+`.

---

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

---

##
