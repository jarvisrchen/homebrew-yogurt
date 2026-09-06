class Yogurt < Formula
  desc "Local-first meeting copilot -- Granola's UX, your machine."
  homepage "https://github.com/jarvisrchen/yogurt"
  version "1.0.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/jarvisrchen/yogurt/releases/download/v1.0.0/yogurt-aarch64-apple-darwin.tar.gz"
      sha256 "509c906b974e6c1deb312e5452f2518f4071c51c8259ea6acd787cac9f33ac7f"
    else
      url "https://github.com/jarvisrchen/yogurt/releases/download/v1.0.0/yogurt-x86_64-apple-darwin.tar.gz"
      sha256 "452119a1c168ff61620ab459f9d29d4cae21b2a572a23f2847b91641d923ca78"
    end
  end

  def install
    bin.install "yogurt"
  end

  test do
    assert_equal "yogurt #{version}", shell_output("#{bin}/yogurt --version").strip
  end
end
