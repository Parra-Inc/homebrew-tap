VERSION = "0.2.29"
ARM_SHA = "9cf65ab3b000671797f1c4668a05acefb7bf52b9c48b9977eeda1224ab28c729"
X86_SHA = "25bd0201aa1f1e5aa3aa431e94cf0caacd6c0689e94c2ce103099bf9c3fb20b8"
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

