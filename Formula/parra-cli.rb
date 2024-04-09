class ParraCli < Formula
  desc "A utility for getting started with your next Parra.io project."
  homepage "https://parra.io"
  url "https://github.com/Parra-Inc/parra-cli"
  license "MIT"
  name 'parra-cli'
  depends_on macos: '>= :sonoma' # Based on min Xcode 15.3

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/Parra-Inc/parra-cli/releases/download/v0.1.7/parra-cli-0.1.7.x86_64_apple_darwin.tar.gz"
      sha256 "8ca20762c198d373a0fd992e448f820cdfe701b2"
    elsif Hardware::CPU.arm?
      url "https://github.com/Parra-Inc/parra-cli/releases/download/v0.1.7/parra-cli-0.1.7.aarch64_apple_darwin.tar.gz"
      sha256 "a29363d369a06536cc4fd0bccc33d24856e6b279"
    end
  end

  depends_on "xcodes"
  depends_on "aria2"
  depends_on "xcodegen"

  def install
    # Remove unrecognized options if they cause configure to fail
    # https://rubydoc.brew.sh/Formula.html#std_configure_args-instance_method
    # system "./configure", "--disable-silent-rules", *std_configure_args
    # system "cmake", "-S", ".", "-B", "build", *std_cmake_args
  end
end
