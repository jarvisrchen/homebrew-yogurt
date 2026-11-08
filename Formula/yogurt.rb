class Yogurt < Formula
  desc "Local-first meeting copilot -- Granola's UX, your machine."
  homepage "https://github.com/jarvisrchen/yogurt"
  version "2.7.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/jarvisrchen/yogurt/releases/download/v2.7.0/yogurt-aarch64-apple-darwin.tar.gz"
      sha256 "7ae917d21b359c69ca48259495bb902d9351b90a2b923532653336224f626f2a"
    else
      url "https://github.com/jarvisrchen/yogurt/releases/download/v2.7.0/yogurt-x86_64-apple-darwin.tar.gz"
      sha256 "af4b3d8f2ddd2da2e8712e58617f43c6aaeeb3bef9169e45ff3b56ebafbbb0aa"
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
