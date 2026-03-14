class Gsb < Formula
  desc "Pick a remote branch and switch to it quickly"
  homepage "https://github.com/PawaOx4th/gsb"
  url "https://github.com/PawaOx4th/gsb/archive/refs/tags/v0.0.3.tar.gz"
  sha256 "8103f53f746d7afc9a94c24d4e00e4240774b7d403e106e1b7561529a8f4caec"
  head "https://github.com/PawaOx4th/gsb.git", branch: "main"
  license "MIT"
  version "0.0.3"

  depends_on "git"

  def install
    bin.install "scripts/gsb" => "gsb"
  end

  test do
    output = shell_output("#{bin}/gsb --help")
    assert_match "Usage: gsb", output
  end
end
