VERSION = "0.1.18"
ARM_SHA = "5ee5910edd5ce181527a7037391c397ebc9bdeaf13500dc23aadd7c4c6d5385e"
X86_SHA = "ca1de01aa6980135d7a941a6eef90e242adaeb735cb5cddafeb7cbd2d33acb08"

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
