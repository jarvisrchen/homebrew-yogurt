class YogurtModelMediumEn < Formula
  desc "whisper.cpp medium.en model for yogurt local transcription"
  homepage "https://github.com/jarvisrchen/yogurt"
  url "https://github.com/jarvisrchen/yogurt/releases/download/models-v1/ggml-medium.en.bin"
  version "1"
  sha256 "cc37e93478338ec7700281a7ac30a10128929eb8f427dda2e865faa8f6da4356"
  license "MIT"

  # Mirrored from https://huggingface.co/ggerganov/whisper.cpp so this
  # installs on a network that cannot reach HuggingFace. github.com is
  # already proven reachable here - it served the yogurt binary.

  # Tap-qualified: an unqualified "yogurt" would resolve against
  # homebrew-core first if a formula by that name ever lands there.
  depends_on "jarvisrchen/yogurt/yogurt"

  def install
    sha = "cc37e93478338ec7700281a7ac30a10128929eb8f427dda2e865faa8f6da4356"
    models = share/"yogurt/models"
    models.install "ggml-medium.en.bin"
    model = models/"ggml-medium.en.bin"

    # yogurt reads a "<sha256> <bytes>" sidecar to answer "is this model
    # present?" without re-hashing the file. Write it here: without it
    # yogurt falls back to hashing, and it cannot cache the result because
    # this prefix is not writable at runtime - so every Settings page load
    # would re-hash the whole model.
    (models/"ggml-medium.en.bin.sha256").write "#{sha} #{model.size}\n"
  end

  def caveats
    <<~EOS
      yogurt picks this up automatically - it reads models from
      #{HOMEBREW_PREFIX}/share/yogurt/models as well as ~/.yogurt/models.
      Select "medium.en" under Settings -> Transcription -> Local.
    EOS
  end

  test do
    sha = "cc37e93478338ec7700281a7ac30a10128929eb8f427dda2e865faa8f6da4356"
    model = share/"yogurt/models/ggml-medium.en.bin"
    assert_predicate model, :exist?
    assert_equal sha, Digest::SHA256.file(model).hexdigest
    # The sidecar must agree with the file, or yogurt re-hashes every check.
    assert_equal "#{sha} #{model.size}", (share/"yogurt/models/ggml-medium.en.bin.sha256").read.strip
  end
end
