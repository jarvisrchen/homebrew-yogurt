class Yogurt < Formula
  desc "Local-first meeting copilot -- Granola's UX, your machine."
  homepage "https://github.com/jarvisrchen/yogurt"
  version "2.6.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/jarvisrchen/yogurt/releases/download/v2.6.0/yogurt-aarch64-apple-darwin.tar.gz"
      sha256 "f89862a4006d6cb5e30c582261d77bc795ef355580a1f9a99d98de02f2cb9f74"
    else
      url "https://github.com/jarvisrchen/yogurt/releases/download/v2.6.0/yogurt-x86_64-apple-darwin.tar.gz"
      sha256 "6be6cafc7872debd6139543c9c415d313807cb7ba9dc7936d5050e8d6c117d4f"
    end
  end

  def install
    bin.install "yogurt"
  end

  test do
    assert_equal "yogurt #{version}", shell_output("#{bin}/yogurt --version").strip
  end
end
