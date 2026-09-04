class Yogurt < Formula
  desc "Local-first meeting copilot -- Granola's UX, your machine."
  homepage "https://github.com/jarvisrchen/yogurt"
  version "0.10.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/jarvisrchen/yogurt/releases/download/v0.10.0/yogurt-aarch64-apple-darwin.tar.gz"
      sha256 "fdacaec0f993ff550ad5cc930b7c21e19d031c5c6ca309f2de1b5be01bbc2b29"
    else
      url "https://github.com/jarvisrchen/yogurt/releases/download/v0.10.0/yogurt-x86_64-apple-darwin.tar.gz"
      sha256 "23b9105f54176331534d22c861acd423b7e98fe593eb7ced0fb65951a54c4f42"
    end
  end

  def install
    bin.install "yogurt"
  end

  test do
    assert_equal "yogurt #{version}", shell_output("#{bin}/yogurt --version").strip
  end
end
