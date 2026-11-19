# wierdbytes/apps

[Homebrew](https://brew.sh) tap for wierdbytes' apps.

| Formula | What |
|---|---|
| `wierdrd` | [Wierdr](https://github.com/wierdbytes/wierdr)'s daemon on the Mac: your Herdr agents on the iPhone's Lock Screen and Dynamic Island |

## wierdrd

Wierdr offers to install and start it when it first connects to your Mac. By hand:

```sh
brew install wierdbytes/apps/wierdrd
brew services start wierdrd
```

Update: `brew upgrade wierdrd && brew services restart wierdrd`.
Remove: `brew services stop wierdrd && brew uninstall wierdrd`.

macOS 15 or later, Apple silicon and Intel. The binary comes from
[Wierdr's releases](https://github.com/wierdbytes/wierdr/releases); `Formula/wierdrd.rb` is
written by Wierdr's release workflow for each release, so changes made here are overwritten.
More: [docs/wierdrd.md](https://github.com/wierdbytes/wierdr/blob/master/docs/wierdrd.md).
