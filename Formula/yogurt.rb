class Yogurt < Formula
  desc "Local-first meeting copilot -- Granola's UX, your machine."
  homepage "https://github.com/jarvisrchen/yogurt"
  version "3.2.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/jarvisrchen/yogurt/releases/download/v3.2.0/yogurt-aarch64-apple-darwin.tar.gz"
      sha256 "b53cd417089bbe49ca42ffd05f93be214a88d83bc21697074d2f867a897b3247"
    else
      url "https://github.com/jarvisrchen/yogurt/releases/download/v3.2.0/yogurt-x86_64-apple-darwin.tar.gz"
      sha256 "682d7121a0d934c06cdc464e14418774686990db65a7938f121cd4ee88b02f83"
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
