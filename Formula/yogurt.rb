class Yogurt < Formula
  desc "Local-first meeting copilot -- Granola's UX, your machine."
  homepage "https://github.com/jarvisrchen/yogurt"
  version "0.3.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/jarvisrchen/yogurt/releases/download/v0.3.0/yogurt-aarch64-apple-darwin.tar.gz"
      sha256 "cac88dcb5cdd8d64bfe5207f244ed646c2c83be63ce6da1961b43e47a50bd181"
    else
      url "https://github.com/jarvisrchen/yogurt/releases/download/v0.3.0/yogurt-x86_64-apple-darwin.tar.gz"
      sha256 "9a15bbc5db95e21e4fee2c98fa4da804b967e2f34d4bd75c3811a829cfbf99f0"
    end
  end

  def install
    bin.install "yogurt"
  end

  test do
    assert_match "yogurt", shell_output("#{bin}/yogurt --version")
  end
end
