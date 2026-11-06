class Yogurt < Formula
  desc "Local-first meeting copilot -- Granola's UX, your machine."
  homepage "https://github.com/jarvisrchen/yogurt"
  version "2.5.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/jarvisrchen/yogurt/releases/download/v2.5.0/yogurt-aarch64-apple-darwin.tar.gz"
      sha256 "1653d3d66ec48ff42b006a2a17edf892d7a2392fdd1f5c0b3022b4667490539e"
    else
      url "https://github.com/jarvisrchen/yogurt/releases/download/v2.5.0/yogurt-x86_64-apple-darwin.tar.gz"
      sha256 "b863fe36f9675ca9a3f97d404936f5aed7dfa417bd03b9334b5279b9291cf0c9"
    end
  end

  def install
    bin.install "yogurt"
  end

  test do
    assert_equal "yogurt #{version}", shell_output("#{bin}/yogurt --version").strip
  end
end
