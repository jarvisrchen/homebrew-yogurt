class Yogurt < Formula
  desc "Local-first meeting copilot -- Granola's UX, your machine."
  homepage "https://github.com/jarvisrchen/yogurt"
  version "0.7.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/jarvisrchen/yogurt/releases/download/v0.7.0/yogurt-aarch64-apple-darwin.tar.gz"
      sha256 "879289fcbc56bdbf45bed2fb9a5ad5792a0a0a98d0c442d3530b113541bf6df0"
    else
      url "https://github.com/jarvisrchen/yogurt/releases/download/v0.7.0/yogurt-x86_64-apple-darwin.tar.gz"
      sha256 "399f2ecaa5a44b0721cd7ef65a82754125cde99a8dcbfe30467b2e834a323688"
    end
  end

  def install
    bin.install "yogurt"
  end

  test do
    assert_match "yogurt", shell_output("#{bin}/yogurt --version")
  end
end
