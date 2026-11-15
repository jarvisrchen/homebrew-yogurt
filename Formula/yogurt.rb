class Yogurt < Formula
  desc "Local-first meeting copilot -- Granola's UX, your machine."
  homepage "https://github.com/jarvisrchen/yogurt-releases"
  version "4.1.1"
  license :cannot_represent

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/jarvisrchen/yogurt-releases/releases/download/v4.1.1/yogurt-aarch64-apple-darwin.tar.gz"
      sha256 "2736646e6c9df637b11622ce502d920884d892809b5551d2d5a6380359a162be"
    else
      url "https://github.com/jarvisrchen/yogurt-releases/releases/download/v4.1.1/yogurt-x86_64-apple-darwin.tar.gz"
      sha256 "c079b27529a23459e066336fccf7afea9765519b4bc4d6daefc93e840f33f785"
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
