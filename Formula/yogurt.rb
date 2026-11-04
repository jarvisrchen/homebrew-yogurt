class Yogurt < Formula
  desc "Local-first meeting copilot -- Granola's UX, your machine."
  homepage "https://github.com/jarvisrchen/yogurt"
  version "2.4.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/jarvisrchen/yogurt/releases/download/v2.4.0/yogurt-aarch64-apple-darwin.tar.gz"
      sha256 "aa0ee78c3d93ff76ac40d9990eaab0ea7b04ae3fed2a2eafcd86d708d5b3c4b2"
    else
      url "https://github.com/jarvisrchen/yogurt/releases/download/v2.4.0/yogurt-x86_64-apple-darwin.tar.gz"
      sha256 "b0b9e12a4464e0808d6190dd50bf12c2a0d2bd96f6e1ed5c63ac83584a0a99be"
    end
  end

  def install
    bin.install "yogurt"
  end

  test do
    assert_equal "yogurt #{version}", shell_output("#{bin}/yogurt --version").strip
  end
end
