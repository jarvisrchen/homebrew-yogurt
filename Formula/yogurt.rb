class Yogurt < Formula
  desc "Local-first meeting copilot -- Granola's UX, your machine."
  homepage "https://github.com/jarvisrchen/yogurt"
  version "0.5.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/jarvisrchen/yogurt/releases/download/v0.5.0/yogurt-aarch64-apple-darwin.tar.gz"
      sha256 "031f12bca56c1dbacc84fd3ccf5ef7a8c727462f6b42ec121bd0fa8ba8144e9d"
    else
      url "https://github.com/jarvisrchen/yogurt/releases/download/v0.5.0/yogurt-x86_64-apple-darwin.tar.gz"
      sha256 "7cdd3e0443f685b0306f34a375b11eab1b0c1152c4e7ed7b2013307ccb4e9d43"
    end
  end

  def install
    bin.install "yogurt"
  end

  test do
    assert_match "yogurt", shell_output("#{bin}/yogurt --version")
  end
end
