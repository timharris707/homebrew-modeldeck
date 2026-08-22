# ModelDeck Homebrew tap

Install [ModelDeck](https://modeldeck.ai/) with Homebrew:

```
brew install --cask timharris707/modeldeck/modeldeck
```

ModelDeck updates itself through its built-in updater, so Homebrew is only
the install channel. `brew upgrade` skips it by default; use
`brew upgrade --cask --greedy modeldeck` if you'd rather upgrade through
Homebrew.

The cask installs the same signed and notarized DMG published on the
[releases page](https://github.com/timharris707/modeldeck/releases).
