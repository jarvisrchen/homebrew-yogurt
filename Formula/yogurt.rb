class Yogurt < Formula
  desc "Local-first meeting copilot -- Granola's UX, your machine."
  homepage "https://github.com/jarvisrchen/yogurt"
  version "0.11.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/jarvisrchen/yogurt/releases/download/v0.11.0/yogurt-aarch64-apple-darwin.tar.gz"
      sha256 "c6d8436e3d31e79bf06a97dc865c5b9620c513cd191b37ba6627541347c1b897"
    else
      url "https://github.com/jarvisrchen/yogurt/releases/download/v0.11.0/yogurt-x86_64-apple-darwin.tar.gz"
      sha256 "841532417eec7068507de6ca304db2020e20bb4dd149998ccaf88e3b8f492fae"
    end
  end

  def install
    bin.install "yogurt"
  end

  test do
    assert_equal "yogurt #{version}", shell_output("#{bin}/yogurt --version").strip
  end
end
