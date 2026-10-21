class Yogurt < Formula
  desc "Local-first meeting copilot -- Granola's UX, your machine."
  homepage "https://github.com/jarvisrchen/yogurt"
  version "1.6.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/jarvisrchen/yogurt/releases/download/v1.6.0/yogurt-aarch64-apple-darwin.tar.gz"
      sha256 "50592b3290e7137ec9b44509c3b3d63f04a46ad93b6f5985165987769d7ef7d2"
    else
      url "https://github.com/jarvisrchen/yogurt/releases/download/v1.6.0/yogurt-x86_64-apple-darwin.tar.gz"
      sha256 "f6ff38b95d98974a1f4a3d5e3aa00245e536ccfd3174ac97a562afbfba56ff3a"
    end
  end

  def install
    bin.install "yogurt"
  end

  test do
    assert_equal "yogurt #{version}", shell_output("#{bin}/yogurt --version").strip
  end
end
