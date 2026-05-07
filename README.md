# Homebrew Tap for Mouthpiece

This repository provides the Homebrew Cask for [Mouthpiece](https://github.com/NotWizard/Mouthpiece), an Electron desktop dictation app using whisper.cpp and cloud transcription providers.

## Install

```bash
brew tap NotWizard/mouthpiece
brew install --cask mouthpiece
```

You can also install directly without a separate tap command:

```bash
brew install --cask NotWizard/mouthpiece/mouthpiece
```

## Upgrade

```bash
brew update
brew upgrade --cask mouthpiece
```

## Uninstall

```bash
brew uninstall --cask mouthpiece
```

To remove app support files as well:

```bash
brew uninstall --cask --zap mouthpiece
```
