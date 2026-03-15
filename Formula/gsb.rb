class Gsb < Formula
  desc "Pick a remote branch and switch to it quickly"
  homepage "https://github.com/PawaOx4th/gsb"
  url "https://github.com/PawaOx4th/gsb/archive/refs/tags/v0.0.5.tar.gz"
  sha256 "afab32fa1ad566e97931464bd3ad045ea1f59aa8b49be059e366667530a3153c"
  head "https://github.com/PawaOx4th/gsb.git", branch: "main"
  license "MIT"
  version "0.0.5"

  depends_on "git"

  def install
    bin.install "scripts/gsb" => "gsb"
  end

  test do
    output = shell_output("#{bin}/gsb --help")
    assert_match "Usage: gsb", output
  end
end
