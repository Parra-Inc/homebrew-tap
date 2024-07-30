VERSION = ""
ARM_SHA = "19149e554875d23119f8b2dc7fce8678feb36f0884605cd896e1554350be96a7"
X86_SHA = "1123b8692c54828cb6f636bce5b62c9ccbb3ca0408f3ebb17e8597a08fb5331d"
DESCRIPTION = "A utility for getting started with your next Parra.io project."

class ParraCli < Formula
  desc DESCRIPTION
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

