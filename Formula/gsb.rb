class Gsb < Formula
  desc "Pick a remote branch and switch to it quickly"
  homepage "https://github.com/PawaOx4th/gsb"
  url "https://github.com/PawaOx4th/gsb/archive/refs/tags/v0.0.4.tar.gz"
  sha256 "07ef215126918dc77261255324f825b9f773af25df8d0b344a013367a142a818"
  head "https://github.com/PawaOx4th/gsb.git", branch: "main"
  license "MIT"
  version "0.0.4"

  depends_on "git"

  def install
    bin.install "scripts/gsb" => "gsb"
  end

  test do
    output = shell_output("#{bin}/gsb --help")
    assert_match "Usage: gsb", output
  end
end
