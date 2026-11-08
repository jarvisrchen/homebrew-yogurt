class Yogurt < Formula
  desc "Local-first meeting copilot -- Granola's UX, your machine."
  homepage "https://github.com/jarvisrchen/yogurt"
  version "3.0.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/jarvisrchen/yogurt/releases/download/v3.0.0/yogurt-aarch64-apple-darwin.tar.gz"
      sha256 "6253d2942b2889f4977f2bb3a4100aef09ce6a9a1664f06ab4b26c54bf797cdc"
    else
      url "https://github.com/jarvisrchen/yogurt/releases/download/v3.0.0/yogurt-x86_64-apple-darwin.tar.gz"
      sha256 "a46dc858b6e6c6417171550a2a8dfd6c97dc149d4adcacd0c10657f33e2a4c1c"
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
