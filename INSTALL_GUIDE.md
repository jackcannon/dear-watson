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
