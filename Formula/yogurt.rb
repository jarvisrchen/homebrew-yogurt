class Yogurt < Formula
  desc "Local-first meeting copilot -- Granola's UX, your machine."
  homepage "https://github.com/jarvisrchen/yogurt"
  version "2.2.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/jarvisrchen/yogurt/releases/download/v2.2.0/yogurt-aarch64-apple-darwin.tar.gz"
      sha256 "39081f44ab4e39950ee1f471596bc214fe465cc680af9296f65cfa8bec6d6546"
    else
      url "https://github.com/jarvisrchen/yogurt/releases/download/v2.2.0/yogurt-x86_64-apple-darwin.tar.gz"
      sha256 "cb00497a4cf0230edcbcb8d1a39b291efcbc2db57b1a2276cda4ec80be449d7e"
    end
  end

  def install
    bin.install "yogurt"
  end

  test do
    assert_equal "yogurt #{version}", shell_output("#{bin}/yogurt --version").strip
  end
end
