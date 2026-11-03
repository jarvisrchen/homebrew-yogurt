class Yogurt < Formula
  desc "Local-first meeting copilot -- Granola's UX, your machine."
  homepage "https://github.com/jarvisrchen/yogurt"
  version "2.3.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/jarvisrchen/yogurt/releases/download/v2.3.0/yogurt-aarch64-apple-darwin.tar.gz"
      sha256 "b7b9ed07c5d1bd20573577d190874ff3d3a32f29980f102046b8205509b636f2"
    else
      url "https://github.com/jarvisrchen/yogurt/releases/download/v2.3.0/yogurt-x86_64-apple-darwin.tar.gz"
      sha256 "fe2ae822f97a0b13cf82e27cf11ee2bfcece218394be19f0f2fdf7488ef9113b"
    end
  end

  def install
    bin.install "yogurt"
  end

  test do
    assert_equal "yogurt #{version}", shell_output("#{bin}/yogurt --version").strip
  end
end
