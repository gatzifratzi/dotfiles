# apple default writes

### sachen für dock:

- `defaults write com.apple.dock autohide-time-modifier -int 0; killall Dock`
- `defaults write com.apple.dock autohide-delay -float 0; killall Dock`

### key repeat
- `defaults write -g ApplePressAndHoldEnabled -bool false`

# coole fonts:

- [Monaspace](https://monaspace.githubnext.com/) die beste font family die ich je gefunden habe
    - `brew install --cask font-monaspace-nf`
- [Monocraft](https://github.com/IdreesInc/Monocraft) Minecraft font lol
    - man braucht egtl nur die nerd font (mit 4.2 heisst die nur "Monocraft", funktioniert also auch mit Zen)
    - `brew install --cask font-monocraft-nerd-font`
    - `brew install --cask font-monocraft`
- [Miracode](https://github.com/IdreesInc/Miracode) wie Monocraft nur nicht pixelig
    - `brew install --cask font-miracode`
- [Atkinson Hyperlegible](https://www.brailleinstitute.org/freefont/) San Serif Propo font
    - `brew install --cask font-atkinson-hyperlegible-next`
    - `brew install --cask font-atkinson-hyperlegible-mono`
- [Redaction](https://www.redaction.us/) Serif Propo font (ne version mit bolditalic ist in fonts)
# Homebrew sachen

## Casks
- middleclick
- boring-notch
- stats
- pika
- ghostty
- helium-browser
- zen
- zed
- obsidian
- skim
- spotify
- rstudio
- (google-drive)
- iina
- transmission
- whatcable
- (unnaturalscrollwheel)
- itsycal(geht auf m4 irgendwie nicht)
- Protonvpn
- proton-mail
- proton-drive
- Steam (ist gerade normalruntergeladen, weil nur so beta erreichbar ist.)

## formulae
- stow
- yazi
- zoxide
- fzf
- chafa (fuer fzf preview)
- powerlevel10k
- zsh-autosuggestions
- zsh-sytax-highlighting
- neovim
- bat
- pyenv (dann python 3.13.9)
- openjdk
- tectonic
- fd
- ripgrep
- ffmpeg
- btop
- clipboard (yazi plugin)
- fontforge
- media-info
- exiftool
- pinentry-mac (fuer gpg passphrase `echo "pinentry-program $(brew --prefix)/bin/pinentry-mac" >> ~/.gnupg/gpg-agent.conf` ich weiss nicht welches programm das normale pinentry oder gnupg mit installiert hat)

# MacStore Sachen
- Xcode
- Whatsapp
- Goodnotes

# Zed Extension (man kann safe die app support sachen kopieren)
- Html
- toml
- git firefly
- ruby
- catpuccin items
- make
- latex
- lua
- log
- python lsp
- blad runner 2049
- rose pine
- kanagawa themes
- 0x96f theme
- latx
- gemini
- ngxvamp
- gruvbox baby
- srcery
