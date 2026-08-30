class Yogurt < Formula
  desc "Local-first meeting copilot -- Granola's UX, your machine."
  homepage "https://github.com/jarvisrchen/yogurt"
  version "0.1.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/jarvisrchen/yogurt/releases/download/v0.1.0/yogurt-aarch64-apple-darwin.tar.gz"
      sha256 "ec7c4de32486af8b30d465e1bad49cfc2371d3b8abeaf764046a1cfa00a9d11f"
    else
      url "https://github.com/jarvisrchen/yogurt/releases/download/v0.1.0/yogurt-x86_64-apple-darwin.tar.gz"
      sha256 "1ecac01c31d4bc8cd1bd46332f6b75c61315c0d81f9bdae276dbf1f7758a18a9"
    end
  end

  def install
    bin.install "yogurt"
  end

  test do
    assert_match "yogurt", shell_output("#{bin}/yogurt --version")
  end
end
