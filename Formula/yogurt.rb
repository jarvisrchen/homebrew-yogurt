class Yogurt < Formula
  desc "Local-first meeting copilot -- Granola's UX, your machine."
  homepage "https://github.com/jarvisrchen/yogurt"
  version "3.2.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/jarvisrchen/yogurt/releases/download/v3.2.1/yogurt-aarch64-apple-darwin.tar.gz"
      sha256 "baefd154d488af319b1423ca93006df8749232df42e0b1a1e0707553029e225a"
    else
      url "https://github.com/jarvisrchen/yogurt/releases/download/v3.2.1/yogurt-x86_64-apple-darwin.tar.gz"
      sha256 "f6ef58adfde13dd435d220629da491d54c6de9f0871e19378c306490c9e561ab"
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
