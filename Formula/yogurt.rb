class Yogurt < Formula
  desc "Local-first meeting copilot -- Granola's UX, your machine."
  homepage "https://github.com/jarvisrchen/yogurt"
  version "2.0.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/jarvisrchen/yogurt/releases/download/v2.0.0/yogurt-aarch64-apple-darwin.tar.gz"
      sha256 "b1d2d8bd7877cef241ed8ab8a162bfe6f432c64de5a7be0ded6d214e4095c6ce"
    else
      url "https://github.com/jarvisrchen/yogurt/releases/download/v2.0.0/yogurt-x86_64-apple-darwin.tar.gz"
      sha256 "60bdf6d0fd18ecd4c16d30dd0bf65abab3662e051b3b1d82043f4f2071fcd5c1"
    end
  end

  def install
    bin.install "yogurt"
  end

  test do
    assert_equal "yogurt #{version}", shell_output("#{bin}/yogurt --version").strip
  end
end
