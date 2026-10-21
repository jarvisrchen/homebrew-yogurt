class Yogurt < Formula
  desc "Local-first meeting copilot -- Granola's UX, your machine."
  homepage "https://github.com/jarvisrchen/yogurt"
  version "1.5.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/jarvisrchen/yogurt/releases/download/v1.5.0/yogurt-aarch64-apple-darwin.tar.gz"
      sha256 "7c0af1ccd6f3790d5e4f2d611d80b862c42567a93b5ffbcd9caa7d431e5108ee"
    else
      url "https://github.com/jarvisrchen/yogurt/releases/download/v1.5.0/yogurt-x86_64-apple-darwin.tar.gz"
      sha256 "8f44677e66779b575250e382c4da8a6af6707040901006dd4f7c1f3fd584fbd0"
    end
  end

  def install
    bin.install "yogurt"
  end

  test do
    assert_equal "yogurt #{version}", shell_output("#{bin}/yogurt --version").strip
  end
end
