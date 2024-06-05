VERSION = "0.1.16"
ARM_SHA = "29a4980f0128869accca76df0ffc57588a99b5555f23bfa545a2c10afe32c52b"
X86_SHA = "4df5b77c9c2eba3cc0c713a1740a3dc459b4afa14a1aba2f67a5eb362ee80f91"

class ParraCli < Formula
  desc "A utility for getting started with your next Parra.io project."
  homepage "https://parra.io"
  license "MIT"
  url "https://github.com/Parra-Inc/parra-cli.git", tag: VERSION

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Parra-Inc/parra-cli/releases/download/v#{VERSION}/parra-cli-#{VERSION}.aarch64_apple_darwin.tar.gz"
      sha256 ARM_SHA
    elsif Hardware::CPU.intel?
      url "https://github.com/Parra-Inc/parra-cli/releases/download/v#{VERSION}/parra-cli-#{VERSION}.x86_64_apple_darwin.tar.gz"
      sha256 X86_SHA
    end
  end

  depends_on "xcodegen"

  def install
    # Not including the `target/` base dir. Brew auto opens the top level directory.
    if Hardware::CPU.intel?
      bin.install "x86_64-apple-darwin/release/parra"
    elsif Hardware::CPU.arm?
      bin.install "aarch64-apple-darwin/release/parra"
    end    
  end
end
