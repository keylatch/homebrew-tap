# typed: false
# frozen_string_literal: true

class Keylatch < Formula
  desc "Zero-trust credential vault CLI for AI-assisted workflows"
  homepage "https://github.com/keylatch/keylatch"
  version "0.9.9"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/keylatch/keylatch/releases/download/v0.9.9/keylatch_0.9.9_darwin_amd64.tar.gz"
      sha256 "e823f4ce897ea3de5884b9531f3167f99c654912b81965fbf848e861af929458"
    end
    if Hardware::CPU.arm?
      url "https://github.com/keylatch/keylatch/releases/download/v0.9.9/keylatch_0.9.9_darwin_arm64.tar.gz"
      sha256 "b0fc0f8a0477164f553da59d0fffac9e129c071f776c2fb24129f2aa8d48983d"
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/keylatch/keylatch/releases/download/v0.9.9/keylatch_0.9.9_linux_amd64.tar.gz"
      sha256 "afbe2c48e43d6c079635f91c51fe2cb925b3c8eea747fe1c9df7b2d89b5567ed"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/keylatch/keylatch/releases/download/v0.9.9/keylatch_0.9.9_linux_arm64.tar.gz"
      sha256 "27be91c502949cd065ec32009a690602b8dfbd357101a943bf3e2a9863f13784"
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
