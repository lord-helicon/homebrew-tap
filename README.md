# homebrew-tap

Homebrew formulae by [lord-helicon](https://github.com/lord-helicon).

| Formula | Install | Notes |
|---|---|---|
| [lazyssh](https://github.com/lord-helicon/lazyssh) | `brew install lord-helicon/tap/lazyssh` | Terminal UI for managing SSH connections. Published automatically by GoReleaser when a lazyssh release is tagged. |
| [stackd](https://github.com/lord-helicon/stackd) | `brew install lord-helicon/tap/stackd` | Menu bar app for boxd cloud machines. Builds from source, needs Xcode 26 or later. |

Homebrew only loads formulae from third-party taps after you trust them. Trust a formula once before installing it:

```bash
brew trust --formula lord-helicon/tap/stackd
```
