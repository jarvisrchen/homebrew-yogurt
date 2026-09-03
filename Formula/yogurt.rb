class Yogurt < Formula
  desc "Local-first meeting copilot -- Granola's UX, your machine."
  homepage "https://github.com/jarvisrchen/yogurt"
  version "0.9.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/jarvisrchen/yogurt/releases/download/v0.9.0/yogurt-aarch64-apple-darwin.tar.gz"
      sha256 "1eb44ee241bf868c1fdc7ee907ee100172cc5c0f5d0fe6146e3754ab4de6e025"
    else
      url "https://github.com/jarvisrchen/yogurt/releases/download/v0.9.0/yogurt-x86_64-apple-darwin.tar.gz"
      sha256 "3ad21366ba49381654b49615104912f6656f1edb5480d3998519f3c61b20e2dc"
    end
  end

  def install
    bin.install "yogurt"
  end

  test do
    assert_equal "yogurt #{version}", shell_output("#{bin}/yogurt --version").strip
  end
end
