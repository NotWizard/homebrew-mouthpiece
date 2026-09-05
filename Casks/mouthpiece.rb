cask "mouthpiece" do
  on_arm do
    version "2.1.4"
    sha256 "a31bf8d221374a095bb9ffda84428dc70e117536a9467107f48679fda3051551"

    url "https://github.com/NotWizard/Mouthpiece/releases/download/v#{version}/Mouthpiece-#{version}-arm64.dmg"
  end

  on_intel do
    version "2.1.4"
    sha256 "458056b0021a81e180eb21208b3a0d12be03187051c4c8b8f299d47f50ee4dbe"

    url "https://github.com/NotWizard/Mouthpiece/releases/download/v#{version}/Mouthpiece-#{version}-x64.dmg"
  end

  name "Mouthpiece"
  desc "Native speech-to-text dictation app"
  homepage "https://github.com/NotWizard/Mouthpiece"

  auto_updates true
  depends_on macos: :sequoia

  livecheck do
    url :url
    strategy :github_latest
  end

  app "Mouthpiece.app"

  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-dr", "com.apple.quarantine", "#{appdir}/Mouthpiece.app"],
                   sudo: false
  end

  # `brew upgrade --cask` replaces the .app on disk but cannot swap the
  # already-loaded process — without this stanza users still see the old
  # version until they manually quit and relaunch. `quit:` sends a macOS quit
  # signal to the running app before the upgrade replaces its bundle, so the
  # next launch picks up the new version cleanly.
  uninstall quit: "com.mouthpiece.app"

  zap trash: [
    "~/.cache/mouthpiece",
    "~/Library/Application Support/Mouthpiece",
    "~/Library/Preferences/com.mouthpiece.app.plist",
  ]
end
