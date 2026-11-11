class Yogurt < Formula
  desc "Local-first meeting copilot -- Granola's UX, your machine."
  homepage "https://github.com/jarvisrchen/yogurt"
  version "3.2.2"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/jarvisrchen/yogurt/releases/download/v3.2.2/yogurt-aarch64-apple-darwin.tar.gz"
      sha256 "5dc89cfcc9eb0cef6b2576ef1b0b862a841ad188597b6cc2a36b1d528d972936"
    else
      url "https://github.com/jarvisrchen/yogurt/releases/download/v3.2.2/yogurt-x86_64-apple-darwin.tar.gz"
      sha256 "458d90cb47a0ca88cb24c135395578a20c6c4f7737f497a21b0cf4379973ffcb"
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
