class Procs < Formula
  desc "Modern replacement for ps written by Rust"
  homepage "https://github.com/dalance/procs"
  url "https://github.com/dalance/procs/archive/v0.10.8.tar.gz"
  sha256 "74255cca2b8599892bca30a5b88a6ff8fa30a79900859ea037d2f7ab3b5ac793"
  license "MIT"

  bottle do
    cellar :any_skip_relocation
    sha256 "472df651f61fc7abc6781ed01c47e9dc647f1e7cd0b7a9769ecbd9b30d308793" => :big_sur
    sha256 "eb2021cb27ab96a16a04b6cfb93aee29e2a0cd406116ca16ea2d20d97b2372b3" => :catalina
    sha256 "241fc3a76c3de4ca58b057584241d71e5d9a763a67b704773daa7d4719998619" => :mojave
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    output = shell_output("#{bin}/procs")
    count = output.lines.count
    assert count > 2
    assert output.start_with?(" PID:")
  end
end
