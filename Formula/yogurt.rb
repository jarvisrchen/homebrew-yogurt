class Yogurt < Formula
  desc "Local-first meeting copilot -- Granola's UX, your machine."
  homepage "https://github.com/jarvisrchen/yogurt"
  version "2.1.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/jarvisrchen/yogurt/releases/download/v2.1.0/yogurt-aarch64-apple-darwin.tar.gz"
      sha256 "90b0ba777678cc49916fae2dd52e79e2093e979830aeb6f83e98a183154bef45"
    else
      url "https://github.com/jarvisrchen/yogurt/releases/download/v2.1.0/yogurt-x86_64-apple-darwin.tar.gz"
      sha256 "cf8d81a8fd20cfd9be766453b1397ff6866d286e805b266bbef71db945ffcd13"
    end
  end

  def install
    bin.install "yogurt"
  end

  test do
    assert_equal "yogurt #{version}", shell_output("#{bin}/yogurt --version").strip
  end
end
