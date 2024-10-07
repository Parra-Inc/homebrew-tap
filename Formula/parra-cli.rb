VERSION = "0.5.21"
ARM_SHA = "366265c61a82b621e3710f9a9805c30e6a2f4ad54aedcc6f261826ea42a74395"
X86_SHA = "43ecc622961d12fa4eb096dbe869f313a0955f899114e29901bedb9e1d40876a"
DESCRIPTION = "A utility for getting started with your next Parra.io project."

class ParraCli < Formula
  desc DESCRIPTION
  homepage "https://parra.io"
  license "MIT"
  url "https://github.com/Parra-Inc/parra-mobile-sdks.git", tag: VERSION

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Parra-Inc/parra-mobile-sdks/releases/download/#{VERSION}/parra-cli-#{VERSION}.aarch64_apple_darwin.tar.gz"
      sha256 ARM_SHA
    elsif Hardware::CPU.intel?
      url "https://github.com/Parra-Inc/parra-mobile-sdks/releases/download/#{VERSION}/parra-cli-#{VERSION}.x86_64_apple_darwin.tar.gz"
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

