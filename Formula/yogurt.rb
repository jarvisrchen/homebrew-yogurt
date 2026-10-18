class Yogurt < Formula
  desc "Local-first meeting copilot -- Granola's UX, your machine."
  homepage "https://github.com/jarvisrchen/yogurt"
  version "1.4.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/jarvisrchen/yogurt/releases/download/v1.4.0/yogurt-aarch64-apple-darwin.tar.gz"
      sha256 "0885fb9e8480032de2493384a6a74f5c4bf14be40f0bfd86f90f3b173694ee3e"
    else
      url "https://github.com/jarvisrchen/yogurt/releases/download/v1.4.0/yogurt-x86_64-apple-darwin.tar.gz"
      sha256 "a00c757d26e6276cae9a43790ca2c56386bdee04f04e9b11a134d5f04c6d5499"
    end
  end

  def install
    bin.install "yogurt"
  end

  test do
    assert_equal "yogurt #{version}", shell_output("#{bin}/yogurt --version").strip
  end
end
