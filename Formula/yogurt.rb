class Yogurt < Formula
  desc "Local-first meeting copilot -- Granola's UX, your machine."
  homepage "https://github.com/jarvisrchen/yogurt"
  version "1.0.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/jarvisrchen/yogurt/releases/download/v1.0.1/yogurt-aarch64-apple-darwin.tar.gz"
      sha256 "89fd1c269dfbefe4442bb24ca57ea7056370b237095cfe92f817c5c2ea2143a1"
    else
      url "https://github.com/jarvisrchen/yogurt/releases/download/v1.0.1/yogurt-x86_64-apple-darwin.tar.gz"
      sha256 "5aab5c0503a7aa8f644eda8e8023bf39f10e50b0d222c79d49022c9d551d68ae"
    end
  end

  def install
    bin.install "yogurt"
  end

  test do
    assert_equal "yogurt #{version}", shell_output("#{bin}/yogurt --version").strip
  end
end
