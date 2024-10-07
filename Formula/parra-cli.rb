VERSION = "0.5.19"
ARM_SHA = "dbbacffd8feddd63e502ac155448fa70a4a9236d727f8e85fcaddc59f505f79d"
X86_SHA = "be6f0dcb26e914ab21bc28fafd9146d5981330222826370e1b12a480bfccef94"
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

