class ParraCli < Formula
  desc "A utility for getting started with your next Parra.io project."
  homepage "https://parra.io"
  url "https://github.com/Parra-Inc/parra-cli"
  license "MIT"
  name 'parra-cli'
  depends_on macos: '>= :sonoma' # Based on min Xcode 15.3

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/Parra-Inc/parra-cli/releases/download/0.1.0/parra-cli-0.1.0.x86_64_apple_darwin.tar.gz"
      sha256 "3b7655528950d5f94073ad672df54ec8e4bbc968"
    elsif Hardware::CPU.arm?
      url "https://github.com/Parra-Inc/parra-cli/releases/download/0.1.0/parra-cli-0.1.0.aarch64_apple_darwin.tar.gz"
      sha256 "8dd62923cb2c7f16c4c4a6448e1c01fe7771b9fd"
    end
  end

  depends_on "xcodes"
  depends_on "aria2"
  depends_on "xcodegen"

  def install
    # Remove unrecognized options if they cause configure to fail
    # https://rubydoc.brew.sh/Formula.html#std_configure_args-instance_method
    system "./configure", "--disable-silent-rules", *std_configure_args
    # system "cmake", "-S", ".", "-B", "build", *std_cmake_args
  end
end
