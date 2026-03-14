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

Create a tap repository, for example `yourname/homebrew-tools`, and add this formula file as `Formula/gsb.rb`.

Install command for users:

```sh
brew tap yourname/tools
brew install gsb
```

## Releasing with Homebrew

1. Create a git tag (example: `v0.1.0`) and GitHub release.
2. Download release tarball URL:
   `https://github.com/<owner>/<repo>/archive/refs/tags/v0.1.0.tar.gz`
3. Calculate sha256:

```sh
curl -L -o gsb-v0.1.0.tar.gz https://github.com/<owner>/<repo>/archive/refs/tags/v0.1.0.tar.gz
shasum -a 256 gsb-v0.1.0.tar.gz
```

4. Update `url`, `sha256`, and `version` in `Formula/gsb.rb`.
5. Commit formula update in your tap repository.

## License

Choose and add your preferred license (for example MIT) before publishing.
