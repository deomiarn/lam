# lam
Alias manager for zsh (asdf-Style)

Ein minimaler Alias-Manager nach dem **asdf-Prinzip**: lokale Deklaration pro Projekt + globale Deklaration im Home, Walk-Up-Suche, **lokal überschreibt global**. LAM kompiliert beide Ebenen in eine Datei, die deine Shell lädt.

## TL;DR
- **Lokal:** `.lam-aliases` im Projekt (nächstgelegene Datei per Walk-Up).
- **Global:** `~/.lam-aliases`.
- **Merge:** lokal > global → Ausgabe nach `~/.lam/compiled/current.zsh`.
- **Plugin:** lädt Kompilat beim Start & `cd`; Wrapper refresht nach `add`/`rm`.

## Voraussetzungen
- Zsh
- (Empfohlen) Oh My Zsh

## Installation (Oh My Zsh, One-Folder)
```zsh
# 1) Repo direkt als Plugin klonen
git clone <REPO_URL> "$ZSH_CUSTOM/plugins/lam"

# 2) Plugin aktivieren
# In ~/.zshrc:  plugins=(... lam ...)

# 3) LAM initialisieren
source ~/.zshrc
```

## Quick Start

```zsh
# globaler Alias
lam global add gs "git status -sb"

# im Projektordner: lokaler Alias (überschreibt global)
lam add gs "git status --ignored"

# sofort nutzbar (Plugin refresht automatisch)
gs
```

## Befehle (MVP)

- **Lokal:**

  `lam add <name> <cmd>`

  `lam rm <name>`

  `lam list`

- **Global:**

  `lam global add <name> <cmd>`

  `lam global rm <name>`

  `lam global list`

- **Status & Runtime:**

  `lam current` – zeigt lokale und globale Datei

  `lam which <alias>` – zeigt Quelle (lokal/global) und Befehl

  `lam compile` – merge & schreibe Kompilat

  `lam doctor` – prüft Setup

  `lam info` / `lam version`


## Wie es funktioniert

- **Dateien:**

  Lokal: `./.lam-aliases` (vom CWD per Walk-Up gesucht)

  Global: `~/.lam-aliases`

- **Kompilat:**

  `~/.lam/compiled/current.zsh` (nur Alias-Zeilen)

- **Laden:**

  Das Plugin kompiliert & sourct beim Start und bei jedem `cd`.

  Der Wrapper refresht außerdem direkt nach `lam add|rm` (lokal & global).


## Uninstall

```
# ~/.zshrc: lam aus plugins(...) entfernen
rm -rf "$ZSH_CUSTOM/plugins/lam"
rm -rf "$HOME/.lam"              # optional: Kompilate löschen
# globale Aliases: ~/.lam-aliases ggf. behalten oder löschen
source ~/.zshrc

```

## Status

MVP für **zsh**. Fokus: klare, deterministische Aliases mit minimalem Surface-Area.

```

Willst du, dass ich dir daraus gleich eine komplette `README.md` baue (inkl. kurzer Install-Sektion oben), oder soll es nur als Anhang zu deiner Projektdoku dienen?

```
