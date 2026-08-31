class Yogurt < Formula
  desc "Local-first meeting copilot -- Granola's UX, your machine."
  homepage "https://github.com/jarvisrchen/yogurt"
  version "0.2.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/jarvisrchen/yogurt/releases/download/v0.2.0/yogurt-aarch64-apple-darwin.tar.gz"
      sha256 "568d5468ac1077029324d49acb56b87c7109b6498221d982f33f3e1237a7bed9"
    else
      url "https://github.com/jarvisrchen/yogurt/releases/download/v0.2.0/yogurt-x86_64-apple-darwin.tar.gz"
      sha256 "39f4e1cabe33e3c88c2ff937654fde5ad588a4594b22234ad89a542f64252ce8"
    end
  end

  def install
    bin.install "yogurt"
  end

  test do
    assert_match "yogurt", shell_output("#{bin}/yogurt --version")
  end
end
