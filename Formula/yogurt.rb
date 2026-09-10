class Yogurt < Formula
  desc "Local-first meeting copilot -- Granola's UX, your machine."
  homepage "https://github.com/jarvisrchen/yogurt"
  version "1.1.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/jarvisrchen/yogurt/releases/download/v1.1.0/yogurt-aarch64-apple-darwin.tar.gz"
      sha256 "196ed5c5787a90c0f0c811639665f557650d6d0e5059e89fdad882ab75361af7"
    else
      url "https://github.com/jarvisrchen/yogurt/releases/download/v1.1.0/yogurt-x86_64-apple-darwin.tar.gz"
      sha256 "3aeb6d6a438000093a214b0a0efb622eb5cd8608243fcd785c2167a87b08b590"
    end
  end

  def install
    bin.install "yogurt"
  end

  test do
    assert_equal "yogurt #{version}", shell_output("#{bin}/yogurt --version").strip
  end
end
