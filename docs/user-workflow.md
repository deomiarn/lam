1. **Install & Init**
- Plugin aktivieren (Oh-My-Zsh) und `lam init` ausführen.
- LAM legt Ordner an:
    - `~/.config/lam/profiles/` (Profil-Dateien, z. B. `default.aliases`)
    - `~/.config/lam/alias.d/global.aliases` (globale Ebene)
    - `~/.config/lam/compiled/current.zsh` (kompilierter Output)
1. **Aliases anlegen (einmalig je Profil / global)**
- Globale Aliases (immer verfügbar):
    - `lam alias add gs "git status -sb" --scope user`
- Profil-Aliases (gruppiert, wie „Node“, „Git“, „Docker“ etc.):
    - `lam alias add co "git checkout" --profile default`
1. **Projekt an ein Profil binden (wie asdf)**
- Im Projektroot **`.tool-versions`** pflegen (entweder per Command oder manuell):
    - `lam set -p lam default`
    - Ergebnis in `.tool-versions` (Zeile):

      `lam default`

1. **Wechsel ins Projekt (magie via Hook)**
- Beim `cd` in das Projekt:
    - LAM liest **globale** + **Profil-Datei** (aus `.tool-versions`)
    - mergen (Priorität: **Profil > Global**)
    - kompiliert nach `~/.config/lam/compiled/current.zsh`
    - `source …/current.zsh` → Aliases aktiv
1. **Arbeiten**
- `gs` außerhalb des Projekts → globale Variante
- `gs` im Projekt → Profil-Variante (falls im Profil überschrieben)
1. **Diagnose & Übersicht**
- `lam current` → zeigt aktives Profil + resolved Aliases für CWD
- `lam which gs` → zeigt, aus welcher Ebene `gs` kommt
- `lam list aliases --scope user|profile` → zeigt definierte Aliases
- `lam doctor` → prüft Setup, Hooks, Rechte
