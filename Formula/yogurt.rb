class Yogurt < Formula
  desc "Local-first meeting copilot -- Granola's UX, your machine."
  homepage "https://github.com/jarvisrchen/yogurt-releases"
  version "4.0.0"
  license :cannot_represent

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/jarvisrchen/yogurt-releases/releases/download/v4.0.0/yogurt-aarch64-apple-darwin.tar.gz"
      sha256 "19db2fb8a76124d299516baa4a50cfc990ccc26a5aad43977ed63c1bcafcc871"
    else
      url "https://github.com/jarvisrchen/yogurt-releases/releases/download/v4.0.0/yogurt-x86_64-apple-darwin.tar.gz"
      sha256 "e6d96f5e87629838d811de66a8c043d576057ccf06cbaa443a38edcd6ab9ead7"
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
