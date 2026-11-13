class YogurtModelParakeetV3 < Formula
  desc "NVIDIA Parakeet TDT 0.6B v3 model for yogurt local transcription"
  homepage "https://github.com/jarvisrchen/yogurt-releases"
  url "https://github.com/jarvisrchen/yogurt-releases/releases/download/models-v1/parakeet-tdt-0.6b-v3-int8-encoder.int8.onnx"
  version "1"
  sha256 "acfc2b4456377e15d04f0243af540b7fe7c992f8d898d751cf134c3a55fd2247"
  license "CC-BY-4.0"

  # Mirrored from https://huggingface.co/csukuangfj/sherpa-onnx-nemo-parakeet-tdt-0.6b-v3-int8 so this
  # installs on a network that cannot reach HuggingFace. github.com is
  # already proven reachable here - it served the yogurt binary.

  # Tap-qualified: an unqualified "yogurt" would resolve against
  # homebrew-core first if a formula by that name ever lands there.
  depends_on "jarvisrchen/yogurt/yogurt"

  resource "parakeet-tdt-0.6b-v3-int8-decoder.int8.onnx" do
    url "https://github.com/jarvisrchen/yogurt-releases/releases/download/models-v1/parakeet-tdt-0.6b-v3-int8-decoder.int8.onnx"
    sha256 "179e50c43d1a9de79c8a24149a2f9bac6eb5981823f2a2ed88d655b24248db4e"
  end

  resource "parakeet-tdt-0.6b-v3-int8-joiner.int8.onnx" do
    url "https://github.com/jarvisrchen/yogurt-releases/releases/download/models-v1/parakeet-tdt-0.6b-v3-int8-joiner.int8.onnx"
    sha256 "3164c13fc2821009440d20fcb5fdc78bff28b4db2f8d0f0b329101719c0948b3"
  end

  resource "parakeet-tdt-0.6b-v3-int8-tokens.txt" do
    url "https://github.com/jarvisrchen/yogurt-releases/releases/download/models-v1/parakeet-tdt-0.6b-v3-int8-tokens.txt"
    sha256 "d58544679ea4bc6ac563d1f545eb7d474bd6cfa467f0a6e2c1dc1c7d37e3c35d"
  end

  # Every file and its SHA256, rendered from crates/yogurt-stt/src/models.rs.
  MODEL_FILES = {
    "parakeet-tdt-0.6b-v3-int8-encoder.int8.onnx" =>
      "acfc2b4456377e15d04f0243af540b7fe7c992f8d898d751cf134c3a55fd2247",
    "parakeet-tdt-0.6b-v3-int8-decoder.int8.onnx" =>
      "179e50c43d1a9de79c8a24149a2f9bac6eb5981823f2a2ed88d655b24248db4e",
    "parakeet-tdt-0.6b-v3-int8-joiner.int8.onnx" =>
      "3164c13fc2821009440d20fcb5fdc78bff28b4db2f8d0f0b329101719c0948b3",
    "parakeet-tdt-0.6b-v3-int8-tokens.txt" =>
      "d58544679ea4bc6ac563d1f545eb7d474bd6cfa467f0a6e2c1dc1c7d37e3c35d",
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
      Select "parakeet-v3" under Settings -> Transcription -> Local.
      Parakeet TDT 0.6B v3 by NVIDIA, CC BY 4.0, converted to ONNX and
      quantized to int8 by the sherpa-onnx project.
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
