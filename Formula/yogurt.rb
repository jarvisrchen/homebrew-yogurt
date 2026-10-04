class Yogurt < Formula
  desc "Local-first meeting copilot -- Granola's UX, your machine."
  homepage "https://github.com/jarvisrchen/yogurt"
  version "1.2.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/jarvisrchen/yogurt/releases/download/v1.2.0/yogurt-aarch64-apple-darwin.tar.gz"
      sha256 "4a2ef2ca80ea2abf12adbc44527d7ac5398f9ead1760df3bf38830a87f9c67b2"
    else
      url "https://github.com/jarvisrchen/yogurt/releases/download/v1.2.0/yogurt-x86_64-apple-darwin.tar.gz"
      sha256 "6254ae9f4bd1379b0aac7b7b085087ee119e33e300f4a7224a4a6cde0e8f2f48"
    end
  end

  def install
    bin.install "yogurt"
  end

  test do
    assert_equal "yogurt #{version}", shell_output("#{bin}/yogurt --version").strip
  end
end
