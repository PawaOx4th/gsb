class Gsb < Formula
  desc "Pick a remote branch and switch to it quickly"
  homepage "https://github.com/PawaOx4th/gsb"
  url "https://github.com/PawaOx4th/gsb/archive/refs/tags/v0.0.1-beta.tar.gz"
  sha256 "9ac5727bae0942bdec982706a14d790241ba359d47f7f739384c7f4c7afa53c7"
  license "MIT"
  version "0.0.1-beta"

  depends_on "git"

  def install
    bin.install "scripts/gsb" => "gsb"
  end

  test do
    output = shell_output("#{bin}/gsb --help")
    assert_match "Usage: gsb", output
  end
end
