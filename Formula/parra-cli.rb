class ParraCli < Formula
  desc "A utility for getting started with your next Parra.io project."
  homepage "https://parra.io"
  license "MIT"
  name 'parra-cli'

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/Parra-Inc/parra-cli/releases/download/v0.1.9/parra-cli-0.1.9.x86_64_apple_darwin.tar.gz"
      sha256 "0332f3590f7c06fad65412e403c8df1733fb99435fe692e514bd3d84f08eafa0"
    elsif Hardware::CPU.arm?
      url "https://github.com/Parra-Inc/parra-cli/releases/download/v0.1.9/parra-cli-0.1.9.aarch64_apple_darwin.tar.gz"
      sha256 "b610179113d2802c58f529f9956bf255f044149a961f07928da78f810d2b218e"
    end
  end

  # depends_on macos: '>= :sonoma' # Based on min Xcode 15.3
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
