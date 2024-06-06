VERSION = "0.1.17"
ARM_SHA = "5ea678048d37bc0559a48a53a66c75351c2196603141141301a19ef24e95e1f1"
X86_SHA = "7aebb97600a16f73acc7fd6baf4f3b6c2f6978b00560c8d11a8361f3fdc838f6"

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
