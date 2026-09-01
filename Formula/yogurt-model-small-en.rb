class YogurtModelSmallEn < Formula
  desc "whisper.cpp small.en model for yogurt local transcription"
  homepage "https://github.com/jarvisrchen/yogurt"
  url "https://github.com/jarvisrchen/yogurt/releases/download/models-v1/ggml-small.en.bin"
  version "1"
  sha256 "c6138d6d58ecc8322097e0f987c32f1be8bb0a18532a3f88f734d1bbf9c41e5d"
  license "MIT"

  # Mirrored from https://huggingface.co/ggerganov/whisper.cpp so this
  # installs on a network that cannot reach HuggingFace. github.com is
  # already proven reachable here - it served the yogurt binary.

  # Tap-qualified: an unqualified "yogurt" would resolve against
  # homebrew-core first if a formula by that name ever lands there.
  depends_on "jarvisrchen/yogurt/yogurt"

  def install
    sha = "c6138d6d58ecc8322097e0f987c32f1be8bb0a18532a3f88f734d1bbf9c41e5d"
    models = share/"yogurt/models"
    models.install "ggml-small.en.bin"
    model = models/"ggml-small.en.bin"

    # yogurt reads a "<sha256> <bytes>" sidecar to answer "is this model
    # present?" without re-hashing the file. Write it here: without it
    # yogurt falls back to hashing, and it cannot cache the result because
    # this prefix is not writable at runtime - so every Settings page load
    # would re-hash the whole model.
    (models/"ggml-small.en.bin.sha256").write "#{sha} #{model.size}\n"
  end

  def caveats
    <<~EOS
      yogurt picks this up automatically - it reads models from
      #{HOMEBREW_PREFIX}/share/yogurt/models as well as ~/.yogurt/models.
      Select "small.en" under Settings -> Transcription -> Local.
    EOS
  end

  test do
    sha = "c6138d6d58ecc8322097e0f987c32f1be8bb0a18532a3f88f734d1bbf9c41e5d"
    model = share/"yogurt/models/ggml-small.en.bin"
    assert_predicate model, :exist?
    assert_equal sha, Digest::SHA256.file(model).hexdigest
    # The sidecar must agree with the file, or yogurt re-hashes every check.
    assert_equal "#{sha} #{model.size}", (share/"yogurt/models/ggml-small.en.bin.sha256").read.strip
  end
end
