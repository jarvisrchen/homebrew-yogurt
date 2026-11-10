class Yogurt < Formula
  desc "Local-first meeting copilot -- Granola's UX, your machine."
  homepage "https://github.com/jarvisrchen/yogurt"
  version "3.1.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/jarvisrchen/yogurt/releases/download/v3.1.0/yogurt-aarch64-apple-darwin.tar.gz"
      sha256 "5fae3509c35475708dc52d8f6d9993dc52353f4375a6f3ce9ab60b0f4633cecf"
    else
      url "https://github.com/jarvisrchen/yogurt/releases/download/v3.1.0/yogurt-x86_64-apple-darwin.tar.gz"
      sha256 "c8c623213e38d9ff2aeb49f79e42743273bf070d8fc8f99d8df63788e36b834c"
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
