class Yogurt < Formula
  desc "Local-first meeting copilot -- Granola's UX, your machine."
  homepage "https://github.com/jarvisrchen/yogurt"
  version "1.3.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/jarvisrchen/yogurt/releases/download/v1.3.0/yogurt-aarch64-apple-darwin.tar.gz"
      sha256 "f889b3ee7966d9c42aa6160a98cc1f2c8b3c84232c9e781a03c343a6128838e3"
    else
      url "https://github.com/jarvisrchen/yogurt/releases/download/v1.3.0/yogurt-x86_64-apple-darwin.tar.gz"
      sha256 "5d84cf2f32d9c32f9461c075f3321a82fc8c0c31c2ff955657c25429cbfb59c6"
    end
  end

  def install
    bin.install "yogurt"
  end

  test do
    assert_equal "yogurt #{version}", shell_output("#{bin}/yogurt --version").strip
  end
end
