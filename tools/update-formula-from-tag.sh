#!/usr/bin/env sh

set -eu

OWNER="PawaOx4th"
REPO="gsb"
FORMULA_PATH="Formula/gsb.rb"

usage() {
  cat <<EOF
Usage: tools/update-formula-from-tag.sh <tag>

Example:
  tools/update-formula-from-tag.sh v0.1.0
EOF
}

if [ "${1-}" = "" ] || [ "${1-}" = "-h" ] || [ "${1-}" = "--help" ]; then
  usage
  exit 0
fi

if ! command -v curl >/dev/null 2>&1; then
  printf '%s\n' "curl is required" >&2
  exit 1
fi

if ! command -v shasum >/dev/null 2>&1; then
  printf '%s\n' "shasum is required" >&2
  exit 1
fi

tag="$1"
version="${tag#v}"
url="https://github.com/${OWNER}/${REPO}/archive/refs/tags/${tag}.tar.gz"

tmp_tar="$(mktemp)"
trap 'rm -f "$tmp_tar"' EXIT HUP INT TERM

printf '%s\n' "Downloading ${url}" >&2
curl -fL "$url" -o "$tmp_tar"

sha256="$(shasum -a 256 "$tmp_tar" | awk '{print $1}')"

cat >"$FORMULA_PATH" <<EOF
class Gsb < Formula
  desc "Pick a remote branch and switch to it quickly"
  homepage "https://github.com/${OWNER}/${REPO}"
  url "${url}"
  sha256 "${sha256}"
  license "MIT"
  version "${version}"

  depends_on "git"

  def install
    bin.install "scripts/gsb" => "gsb"
  end

  test do
    output = shell_output("#{bin}/gsb --help")
    assert_match "Usage: gsb", output
  end
end
EOF

printf '%s\n' "Updated ${FORMULA_PATH}" >&2
printf '%s\n' "  version: ${version}" >&2
printf '%s\n' "  sha256 : ${sha256}" >&2
