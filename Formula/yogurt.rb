class Yogurt < Formula
  desc "Local-first meeting copilot -- Granola's UX, your machine."
  homepage "https://github.com/jarvisrchen/yogurt"
  version "3.3.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/jarvisrchen/yogurt/releases/download/v3.3.0/yogurt-aarch64-apple-darwin.tar.gz"
      sha256 "abc3c33cbb619b1058e9a6b53f8901b462b7595d20e1de5d5a847995849e8ec8"
    else
      url "https://github.com/jarvisrchen/yogurt/releases/download/v3.3.0/yogurt-x86_64-apple-darwin.tar.gz"
      sha256 "a0f485715057d46f931f23c27975fb3f900e00d4e82661862c36fb3171607127"
    end
  end

  def install
    bin.install "yogurt"
    # llama.cpp's, sherpa-onnx's, and onnxruntime's dylibs, which the binary finds at @executable_path/../libexec.
    # Not lib/: Homebrew's ggml formula owns lib/libggml*, and brew link would collide.
    libexec.install Dir["libexec/*"]
    # The native libraries' and Parakeet's license texts.
    doc.install Dir["licenses/*"]
  end

  test do
    assert_equal "yogurt #{version}", shell_output("#{bin}/yogurt --version").strip
  end
end
