# Installation Guide

## iTerm / iTerm2

Config file: [`iTerm/Dear Watson.itermcolors`](iTerm/Dear%20Watson.itermcolors)

1. Open iTerm2.
2. Open **Settings** (or **Preferences**): `⌘,`, or `⌘I` to edit the current profile.
3. Go to **Profiles → Colors**.
4. Open the **Color Presets** menu and choose **Import…**.
5. Select `iTerm/Dear Watson.itermcolors`.
6. Open **Color Presets** again and choose **Dear Watson**.

You can also double-click the `.itermcolors` file to import it, then select **Dear Watson** from **Color Presets**.

## Gogh

Config file: [`gogh/Dear Watson.yml`](gogh/Dear%20Watson.yml)

[Gogh](https://github.com/Gogh-Co/Gogh) applies themes to terminals such as Gnome Terminal, Tilix, XFCE4 Terminal, Kitty, Alacritty, WezTerm, Pantheon / Elementary, and others. See [Gogh's terminal list](https://github.com/Gogh-Co/Gogh#-terminals).

1. Clone Gogh:

   ```bash
   git clone https://github.com/Gogh-Co/Gogh.git
   cd Gogh
   ```

2. Copy this theme into Gogh's `themes` folder:

   ```bash
   cp "/path/to/dear-watson/gogh/Dear Watson.yml" themes/
   ```

3. Generate the installer script (from the Gogh repo root):

   ```bash
   pip install pyyaml unidecode
   python3 tools/pipe-generateShFiles.py
   ```

4. Apply the theme. Set `TERMINAL` to the emulator you are using, for example `gnome-terminal`, `tilix`, `xfce4-terminal`, `kitty`, `alacritty`, `wezterm`, or `iTerm.app`:

   ```bash
   export TERMINAL=gnome-terminal
   ./installs/dear-watson.sh
   ```

On Debian/Ubuntu, Gnome Terminal also needs:

```bash
sudo apt-get install dconf-cli uuid-runtime
```

Alacritty and Terminator need extra Python packages from Gogh's `requirements.txt`.

## Ghostty

Config file: [`ghostty/Dear Watson`](ghostty/Dear%20Watson)

1. Copy the theme into Ghostty's themes folder:

   ```bash
   mkdir -p ~/.config/ghostty/themes
   cp "/path/to/dear-watson/ghostty/Dear Watson" ~/.config/ghostty/themes/
   ```

2. Set the theme in your Ghostty config (`~/.config/ghostty/config.ghostty`, or on macOS `~/Library/Application Support/com.mitchellh.ghostty/config.ghostty`). The separator must be `=`:

   ```
   theme = Dear Watson
   ```

   You can instead point at the file directly:

   ```
   theme = /path/to/dear-watson/ghostty/Dear Watson
   ```

3. (Optional) If bold prompt colours look dim, add this to the same Ghostty config:

   ```
   bold-is-bright = true
   ```

4. Reload the config (`⌘⇧,` on macOS, or `Ctrl+Shift+,` on Linux) or restart Ghostty.

On macOS, named themes are looked up in `~/.config/ghostty/themes` even if the main config lives under Application Support. Use the absolute path if the named lookup does not find it.

## cmux

Config file: [`ghostty/Dear Watson`](ghostty/Dear%20Watson)

[cmux](https://github.com/manaflow-ai/cmux) uses Ghostty's theme format and reads the same Ghostty config files.

1. Copy the theme into Ghostty's themes folder:

   ```bash
   mkdir -p ~/.config/ghostty/themes
   cp "/path/to/dear-watson/ghostty/Dear Watson" ~/.config/ghostty/themes/
   ```

2. Set the theme in your Ghostty config (`~/.config/ghostty/config`). You can open that file from **cmux → Ghostty Settings…**:

   ```
   theme = Dear Watson
   ```

   You can instead point at the file directly:

   ```
   theme = /path/to/dear-watson/ghostty/Dear Watson
   ```

3. Reload with **⌘⇧,** or **cmux → Reload Configuration**.

## Terminal (macOS)

Config file: [`MacOS-Terminal/Dear Watson.terminal`](MacOS-Terminal/Dear%20Watson.terminal)

1. Open **Terminal**.
2. Choose **Terminal → Settings**, then click **Profiles**.
3. Click the **⋯** (or gear) button and choose **Import…**.
4. Select `MacOS-Terminal/Dear Watson.terminal`.
5. Select **Dear Watson** in the profile list. To make it the default, click **Default**.

You can also drag the `.terminal` file onto the profiles list.

## Windows Terminal / Command Prompt

Config files:

- [`Windows/Dear Watson.json`](Windows/Dear%20Watson.json) — Windows Terminal
- [`Windows/Dear Watson.ini`](Windows/Dear%20Watson.ini) — Command Prompt via ColorTool

### Windows Terminal

This also covers Command Prompt when it runs as a Windows Terminal profile (the default on current Windows).

1. Open Windows Terminal **Settings**, then **Open JSON file**.
2. Copy the contents of `Windows/Dear Watson.json` into the `schemes` array.
3. On the Command Prompt profile (and any other profile you want), set:

   ```json
   "colorScheme": "Dear Watson"
   ```

4. Save the file. Windows Terminal reloads settings automatically.

### Command Prompt (classic console)

Use [ColorTool](https://github.com/microsoft/terminal/tree/main/src/tools/ColorTool) in a Command Prompt window:

```bat
ColorTool.exe -b "Windows\Dear Watson.ini"
```

`-b` applies the scheme to the current window and the default console colours. Use `-d` instead to change only the defaults.
