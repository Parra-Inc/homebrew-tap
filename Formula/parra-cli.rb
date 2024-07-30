VERSION = "0.1.44"
ARM_SHA = "e72cc307963ffca7b8a0f30ff9e2119ec20d190ccd8a6ead80d0bab1e36cc48b"
X86_SHA = "b590ea9fd86e9fe08a60de39042155ba349380bdb732a866c99631f51cee44c3"
DESCRIPTION = "A utility for getting started with your next Parra.io project."

class ParraCli < Formula
  desc DESCRIPTION
  homepage "https://parra.io"
  license "MIT"
  url "https://github.com/Parra-Inc/parra-mobile-sdks.git", tag: VERSION
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Parra-Inc/parra-mobile-sdks/releases/download/v#{VERSION}/parra-cli-#{VERSION}.aarch64_apple_darwin.tar.gz"
      sha256 ARM_SHA
    elsif Hardware::CPU.intel?
      url "https://github.com/Parra-Inc/parra-mobile-sdks/releases/download/v#{VERSION}/parra-cli-#{VERSION}.x86_64_apple_darwin.tar.gz"
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

