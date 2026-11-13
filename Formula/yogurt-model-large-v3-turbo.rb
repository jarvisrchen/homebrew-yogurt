class YogurtModelLargeV3Turbo < Formula
  desc "Whisper large-v3-turbo model for yogurt local transcription"
  homepage "https://github.com/jarvisrchen/yogurt-releases"
  url "https://github.com/jarvisrchen/yogurt-releases/releases/download/models-v1/ggml-large-v3-turbo.bin"
  version "1"
  sha256 "1fc70f774d38eb169993ac391eea357ef47c88757ef72ee5943879b7e8e2bc69"
  license "MIT"

  # Mirrored from https://huggingface.co/ggerganov/whisper.cpp so this
  # installs on a network that cannot reach HuggingFace. github.com is
  # already proven reachable here - it served the yogurt binary.

  # Tap-qualified: an unqualified "yogurt" would resolve against
  # homebrew-core first if a formula by that name ever lands there.
  depends_on "jarvisrchen/yogurt/yogurt"

  # Every file and its SHA256, rendered from crates/yogurt-stt/src/models.rs.
  MODEL_FILES = {
    "ggml-large-v3-turbo.bin" =>
      "1fc70f774d38eb169993ac391eea357ef47c88757ef72ee5943879b7e8e2bc69",
  }.freeze

  def install
    models = share/"yogurt/models"
    models.install MODEL_FILES.keys.first
    MODEL_FILES.keys.drop(1).each { |f| resource(f).stage { models.install f } }

    # yogurt reads a "<sha256> <bytes>" sidecar to answer "is this model
    # present?" without re-hashing the file. Write it here: without it
    # yogurt falls back to hashing, and it cannot cache the result because
    # this prefix is not writable at runtime - so every Settings page load
    # would re-hash the whole model.
    MODEL_FILES.each { |f, sha| (models/"#{f}.sha256").write "#{sha} #{(models/f).size}\n" }
  end

  def caveats
    <<~EOS
      yogurt picks this up automatically - it reads models from
      #{HOMEBREW_PREFIX}/share/yogurt/models as well as ~/.yogurt/models.
      Select "large-v3-turbo" under Settings -> Transcription -> Local.
    EOS
  end

  test do
    MODEL_FILES.each do |f, sha|
      model = share/"yogurt/models"/f
      assert_path_exists model
      assert_equal sha, Digest::SHA256.file(model).hexdigest
      # The sidecar must agree with the file, or yogurt re-hashes every check.
      assert_equal "#{sha} #{model.size}", (share/"yogurt/models/#{f}.sha256").read.strip
    end
  end
end
