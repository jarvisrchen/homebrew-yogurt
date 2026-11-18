class Yogurt < Formula
  desc "Local-first meeting copilot -- Granola's UX, your machine."
  homepage "https://github.com/jarvisrchen/yogurt-releases"
  version "4.2.1"
  license :cannot_represent

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/jarvisrchen/yogurt-releases/releases/download/v4.2.1/yogurt-aarch64-apple-darwin.tar.gz"
      sha256 "93ef8ac18614b1a5e52c89885632f72c9790ed5c628bc26b77d9e8b84d901d93"
    else
      url "https://github.com/jarvisrchen/yogurt-releases/releases/download/v4.2.1/yogurt-x86_64-apple-darwin.tar.gz"
      sha256 "8afc60211d4bf42e4604bea7156c6663e86e75c0c39ce3db6ef30d4354faaebf"
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
