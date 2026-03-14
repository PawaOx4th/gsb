# gsb

`gsb` is a small CLI to pick a remote branch and switch to it quickly.

- Uses `fzf` when available.
- Falls back to numbered selection when `fzf` is not installed.
- Default is no fetch (uses cached remote refs only).
- If cache is empty, gsb does a one-time fetch automatically and continues.
- Can fetch remote in blocking mode or background mode when requested.

## Requirements

- `git`
- `sh` (POSIX shell)
- Optional: `fzf`

## Usage

```sh
gsb [remote] [options]
```

Examples:

```sh
gsb
gsb upstream
gsb --fetch
gsb upstream --no-bg-status
```

## Local install

```sh
make install
```

To install in a custom prefix:

```sh
make install PREFIX="$HOME/.local"
```

## Homebrew (Tap)

Install via tap:

```sh
brew tap PawaOx4th/gsb https://github.com/PawaOx4th/gsb
brew install gsb
```

Install HEAD explicitly:

```sh
brew install --HEAD PawaOx4th/gsb/gsb
```

Note: `brew install PawaOx4th/gsb` is not supported by Homebrew for formula installation.

If you want a separate tap repository, create `PawaOx4th/homebrew-tools` and copy `Formula/gsb.rb` into that repository.

## Releasing with Homebrew

Automatic workflow:

- Pushing a tag like `v0.1.0` triggers `.github/workflows/formula-pr-on-tag.yml`.
- The workflow updates `Formula/gsb.rb` and opens a PR to `main` automatically.
- It also tries to enable PR auto-merge (if repository setting allows it).
- Generated formula keeps `head` so `brew install --HEAD PawaOx4th/gsb/gsb` continues to work.

1. Create and push release tag:

```sh
make release-tag TAG=v0.1.0
git push origin main --tags
```

2. Wait for workflow to open PR, review quickly, then merge (or let auto-merge handle it).

3. Create GitHub release for the same tag.

Manual fallback (if you do not want the automation):

1. Generate stable formula from that tag:

```sh
make formula-from-tag TAG=v0.1.0
```

2. Commit formula change and push:

```sh
git add Formula/gsb.rb
git commit -m "release: v0.1.0 formula"
git push origin main
```

Note:

- Script location: `tools/update-formula-from-tag.sh`
- The script writes stable `url`+`sha256` and preserves `head` in `Formula/gsb.rb`.
- If you want to keep both stable and head formula, put one copy in a tap repository.

## License

Choose and add your preferred license (for example MIT) before publishing.
