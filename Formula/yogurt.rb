class Yogurt < Formula
  desc "Local-first meeting copilot -- Granola's UX, your machine."
  homepage "https://github.com/jarvisrchen/yogurt"
  version "0.4.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/jarvisrchen/yogurt/releases/download/v0.4.0/yogurt-aarch64-apple-darwin.tar.gz"
      sha256 "2215bec50da51984526e19ed5ad0b4d1d508ed870d5061f7174b32d61a36f74e"
    else
      url "https://github.com/jarvisrchen/yogurt/releases/download/v0.4.0/yogurt-x86_64-apple-darwin.tar.gz"
      sha256 "56d9d6d3f5b768d462e9bd378ad038a6b190a541035abaa0fec9173038c91778"
    end
  end

  def install
    bin.install "yogurt"
  end

  test do
    assert_match "yogurt", shell_output("#{bin}/yogurt --version")
  end
end
