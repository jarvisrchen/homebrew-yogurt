class Yogurt < Formula
  desc "Local-first meeting copilot -- Granola's UX, your machine."
  homepage "https://github.com/jarvisrchen/yogurt"
  version "3.4.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/jarvisrchen/yogurt/releases/download/v3.4.0/yogurt-aarch64-apple-darwin.tar.gz"
      sha256 "9a16b4492670e9a82ca5fad54cccd48920d4f9c997cee2b24896fc273e7cdeb4"
    else
      url "https://github.com/jarvisrchen/yogurt/releases/download/v3.4.0/yogurt-x86_64-apple-darwin.tar.gz"
      sha256 "f8afb3d7428653ee7ed3385ec9658a14e93ddfd7e56e04e2e6bbb43efaa30f7a"
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
