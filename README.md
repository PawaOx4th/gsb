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

1. Create a git tag (example: `v0.1.0`) and GitHub release.
2. Download release tarball URL:
   `https://github.com/PawaOx4th/gsb/archive/refs/tags/v0.1.0.tar.gz`
3. Calculate sha256:

```sh
curl -L -o gsb-v0.1.0.tar.gz https://github.com/PawaOx4th/gsb/archive/refs/tags/v0.1.0.tar.gz
shasum -a 256 gsb-v0.1.0.tar.gz
```

4. In `Formula/gsb.rb`, replace `head` with `url` and `sha256` for that release.
5. Commit formula update in your tap repository (or this repository if installing via raw URL).

## License

Choose and add your preferred license (for example MIT) before publishing.
