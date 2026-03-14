class Gsb < Formula
  desc "Pick a remote branch and switch to it quickly"
  homepage "https://github.com/<owner>/<repo>"
  url "https://github.com/<owner>/<repo>/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "REPLACE_WITH_TARBALL_SHA256"
  license "MIT"
  version "0.1.0"

  depends_on "git"

  def install
    bin.install "scripts/gsb" => "gsb"
  end

  test do
    output = shell_output("#{bin}/gsb --help")
    assert_match "Usage: gsb", output
  end
end
