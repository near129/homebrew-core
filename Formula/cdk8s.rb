require "language/node"

class Cdk8s < Formula
  desc "Define k8s native apps and abstractions using object-oriented programming"
  homepage "https://cdk8s.io/"
  url "https://registry.npmjs.org/cdk8s-cli/-/cdk8s-cli-2.1.126.tgz"
  sha256 "df7fe65b216e8414029cd97735f6758dde36f23cc15ddc2b4e313f6b06e1cf82"
  license "Apache-2.0"

  bottle do
    sha256 cellar: :any_skip_relocation, all: "9b969f2427c4580d6fec8cb409b6889138a4ec1e7aca21e55f708df35dab6ae0"
  end

  depends_on "node"

  def install
    system "npm", "install", *Language::Node.std_npm_install_args(libexec)
    bin.install_symlink Dir["#{libexec}/bin/*"]
  end

  test do
    assert_match "Cannot initialize a project in a non-empty directory",
      shell_output("#{bin}/cdk8s init python-app 2>&1", 1)
  end
end
