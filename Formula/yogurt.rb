class Yogurt < Formula
  desc "Local-first meeting copilot -- Granola's UX, your machine."
  homepage "https://github.com/jarvisrchen/yogurt"
  version "0.8.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/jarvisrchen/yogurt/releases/download/v0.8.0/yogurt-aarch64-apple-darwin.tar.gz"
      sha256 "cf5b826c3af5680b30b8a478f9fe74ba55ea0714aad2e53aa30f41aad9de785a"
    else
      url "https://github.com/jarvisrchen/yogurt/releases/download/v0.8.0/yogurt-x86_64-apple-darwin.tar.gz"
      sha256 "0b28454af8bc74fd62d5457027556e9d046a399874503b938baa1553d2d8f1df"
    end
  end

  def install
    bin.install "yogurt"
  end

  test do
    assert_equal "yogurt #{version}", shell_output("#{bin}/yogurt --version").strip
  end
end
