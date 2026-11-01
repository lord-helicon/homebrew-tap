class Stackd < Formula
  desc "Menu bar app for boxd.sh cloud machines"
  homepage "https://github.com/lord-helicon/stackd"
  url "https://github.com/lord-helicon/stackd/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "eb82c85389c614ec1f4a8e2ec8900a4d30073f875c709222b77e0506b9ad7863"
  license "MIT"
  head "https://github.com/lord-helicon/stackd.git", branch: "main"

  # SwiftUI's macros (@State etc.) ship only with Xcode, not the Command Line Tools.
  depends_on xcode: ["26.0", :build]
  depends_on macos: :sonoma

  def install
    ENV["SWIFT_BUILD_FLAGS"] = "--disable-sandbox"
    system "./make-app.sh"
    prefix.install "Stackd.app"
  end

  def caveats
    <<~EOS
      stackd was built into:
        #{opt_prefix}/Stackd.app

      Open it with:
        open #{opt_prefix}/Stackd.app

      To keep it in /Applications (Launchpad, Spotlight, Launch at Login), copy it there:
        ditto #{opt_prefix}/Stackd.app /Applications/Stackd.app
      A copy is not updated by `brew upgrade`; run the command again afterwards.
      After an upgrade macOS asks for your Keychain password once (source builds are
      signed ad hoc).

      stackd needs a boxd API key. Create one with:
        boxd auth keys create stackd
    EOS
  end

  test do
    app = prefix/"Stackd.app"
    assert_path_exists app/"Contents/Info.plist"
    assert_predicate app/"Contents/MacOS/stackd", :executable?
    plist = app/"Contents/Info.plist"
    bundle_id = shell_output("/usr/libexec/PlistBuddy -c 'Print :CFBundleIdentifier' #{plist}").chomp
    assert_equal "li.rol.dev.stackd", bundle_id
  end
end
