# typed: false
# frozen_string_literal: true

class Keylatch < Formula
  desc "Zero-trust credential vault CLI for AI-assisted workflows"
  homepage "https://github.com/keylatch/keylatch"
  version "0.9.8"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/keylatch/keylatch/releases/download/v0.9.8/keylatch_0.9.8_darwin_amd64.tar.gz"
      sha256 "258f8717e1281fd1c53ed0583ff1fcbc2ac0e7a14f821f2be13b726183e0c8e1"
    end
    if Hardware::CPU.arm?
      url "https://github.com/keylatch/keylatch/releases/download/v0.9.8/keylatch_0.9.8_darwin_arm64.tar.gz"
      sha256 "671b87463f1459352f56435f55d027189501b9228f073c697ec3a5751f742d29"
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/keylatch/keylatch/releases/download/v0.9.8/keylatch_0.9.8_linux_amd64.tar.gz"
      sha256 "523fe3af8e7b97ae68a898021bddcd2d26150e19eb65ff10af1b5b0e25833aea"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/keylatch/keylatch/releases/download/v0.9.8/keylatch_0.9.8_linux_arm64.tar.gz"
      sha256 "eba20ca79a52c093cee52b63950eb5c9550d7b452f3f8a5d0efb76fd7cc98f7f"
    end
  end

  def install
    bin.install "keylatch"
    generate_completions_from_executable(bin/"keylatch", "completion")
  end

  test do
    system "#{bin}/keylatch", "--version"
  end
end
