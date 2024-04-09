class ParraCli < Formula
  desc "A utility for getting started with your next Parra.io project."
  homepage "https://parra.io"
  license "MIT"
  url "https://github.com/Parra-Inc/parra-cli.git", tag: "0.1.10"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/Parra-Inc/parra-cli/releases/download/v0.1.10/parra-cli-0.1.10.x86_64_apple_darwin.tar.gz"
      sha256 "b84218bcdca6576f751838e3fe6f10f96f51b696ac369a9a02ca3a84eb72948b"
    elsif Hardware::CPU.arm?
      url "https://github.com/Parra-Inc/parra-cli/releases/download/v0.1.10/parra-cli-0.1.10.aarch64_apple_darwin.tar.gz"
      sha256 "d587d83ad8fba6244cece3201f8e18c084002d76dada921a871403ba4d3ad1b1"
    end
  end

  depends_on "xcodes"
  depends_on "aria2"
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
