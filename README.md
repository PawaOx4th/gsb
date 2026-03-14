# gsb

`gsb` is a small CLI to pick a remote branch and switch to it quickly.

- Uses `fzf` when available.
- Falls back to numbered selection when `fzf` is not installed.
- Can fetch remote in blocking mode or background mode.

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

Install from this repository directly (HEAD):

```sh
brew install --HEAD https://raw.githubusercontent.com/PawaOx4th/gsb/main/Formula/gsb.rb
```

If you want a dedicated tap, create `PawaOx4th/homebrew-tools` and copy `Formula/gsb.rb` into that repository.

## Releasing with Homebrew

Automatic workflow:
- Pushing a tag like `v0.1.0` triggers `.github/workflows/formula-pr-on-tag.yml`.
- The workflow updates `Formula/gsb.rb` and opens a PR to `main` automatically.

1. Create and push release tag:

```sh
make release-tag TAG=v0.1.0
git push origin main --tags
```

2. Generate stable formula from that tag (automatic url + sha256):

```sh
make formula-from-tag TAG=v0.1.0
```

3. Commit formula change and push:

```sh
git add Formula/gsb.rb
git commit -m "release: v0.1.0 formula"
git push origin main
```

4. Create GitHub release for the same tag.

Note:
- Script location: `tools/update-formula-from-tag.sh`
- The script writes a stable formula file to `Formula/gsb.rb`.
- If you want to keep both stable and head formula, put one copy in a tap repository.

## License

Choose and add your preferred license (for example MIT) before publishing.
