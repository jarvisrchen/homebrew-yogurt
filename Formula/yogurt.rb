class Yogurt < Formula
  desc "Local-first meeting copilot -- Granola's UX, your machine."
  homepage "https://github.com/jarvisrchen/yogurt"
  version "3.5.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/jarvisrchen/yogurt/releases/download/v3.5.0/yogurt-aarch64-apple-darwin.tar.gz"
      sha256 "36f019a196dc67c0cdc3719602462102e30778946cd265f41764f29cd043f3a9"
    else
      url "https://github.com/jarvisrchen/yogurt/releases/download/v3.5.0/yogurt-x86_64-apple-darwin.tar.gz"
      sha256 "8a34700e7205e83db326f5ee50b852f962cc4c9fa91cf623722ef184cee14f5c"
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
