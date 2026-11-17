class Yogurt < Formula
  desc "Local-first meeting copilot -- Granola's UX, your machine."
  homepage "https://github.com/jarvisrchen/yogurt-releases"
  version "4.2.0"
  license :cannot_represent

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/jarvisrchen/yogurt-releases/releases/download/v4.2.0/yogurt-aarch64-apple-darwin.tar.gz"
      sha256 "5f5ac69f9e903138f3aa9abf43d4d8c523e3789b62427e3096d0e2c40bb94591"
    else
      url "https://github.com/jarvisrchen/yogurt-releases/releases/download/v4.2.0/yogurt-x86_64-apple-darwin.tar.gz"
      sha256 "ba1c26c4b9dd5a806be6615719f19636ea27ba329dfc79bd320bf7465f594078"
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
