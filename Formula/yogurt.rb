class Yogurt < Formula
  desc "Local-first meeting copilot -- Granola's UX, your machine."
  homepage "https://github.com/jarvisrchen/yogurt"
  version "0.6.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/jarvisrchen/yogurt/releases/download/v0.6.0/yogurt-aarch64-apple-darwin.tar.gz"
      sha256 "40e097ff2cfb99858c773fa743309b496cbdd209e59ececc9ecb968beb344969"
    else
      url "https://github.com/jarvisrchen/yogurt/releases/download/v0.6.0/yogurt-x86_64-apple-darwin.tar.gz"
      sha256 "3df40d1ececa807a353a8c6556424d16cd21fe39083ccfec4de287b3a6ee0760"
    end
  end

  def install
    bin.install "yogurt"
  end

  test do
    assert_match "yogurt", shell_output("#{bin}/yogurt --version")
  end
end
