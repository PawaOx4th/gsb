class Gsb < Formula
  desc "Pick a remote branch and switch to it quickly"
  homepage "https://github.com/PawaOx4th/gsb"
  head "https://github.com/PawaOx4th/gsb.git", branch: "main"
  license "MIT"

  depends_on "git"

  def install
    bin.install "scripts/gsb" => "gsb"
  end

  test do
    output = shell_output("#{bin}/gsb --help")
    assert_match "Usage: gsb", output
  end
end
