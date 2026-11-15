class Yogurt < Formula
  desc "Local-first meeting copilot -- Granola's UX, your machine."
  homepage "https://github.com/jarvisrchen/yogurt-releases"
  version "4.1.0"
  license :cannot_represent

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/jarvisrchen/yogurt-releases/releases/download/v4.1.0/yogurt-aarch64-apple-darwin.tar.gz"
      sha256 "c90eb9bc2b71d97a07a45a60bd1acd3c31eddd7610f337af739ea5e765297d95"
    else
      url "https://github.com/jarvisrchen/yogurt-releases/releases/download/v4.1.0/yogurt-x86_64-apple-darwin.tar.gz"
      sha256 "17e9de3c4a1905f7dcc96219bb637a64b280436c8db111e11b80846e1a50f852"
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
    assert_match(/\Ayogurt #{Regexp.escape(version.to_s)}( \(\d{4}-\d{2}-\d{2}\))?\z/, shell_output("#{bin}/yogurt --version").strip)
  end
end
