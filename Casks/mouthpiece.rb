cask "mouthpiece" do
  on_arm do
    version "1.4.0"
    sha256 "19619cad69158874cbc29e1aacdbdbd07bd1419682ca4f99b99227c5ffbab001"

    url "https://github.com/NotWizard/Mouthpiece/releases/download/v#{version}/Mouthpiece-#{version}-arm64.dmg"
  end

  on_intel do
    version "1.4.0"
    sha256 "4512c241eb3d4935bbda9d57578903375afe27c307cebd682717d22dcd8f6abc"

    url "https://github.com/NotWizard/Mouthpiece/releases/download/v#{version}/Mouthpiece-#{version}.dmg"
  end

  name "Mouthpiece"
  desc "Desktop dictation app using whisper.cpp"
  homepage "https://github.com/NotWizard/Mouthpiece"

  livecheck do
    url :url
    strategy :github_latest
  end

  app "Mouthpiece.app"

  # Mouthpiece is signed with a self-signed code-signing cert (no Apple Developer ID)
  # so Gatekeeper marks downloads as quarantined. Stripping the quarantine attribute
  # post-install lets users open the app on first launch without the right-click dance.
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
    "~/Library/Application Support/Mouthpiece",
    "~/Library/Caches/com.mouthpiece.app",
    "~/Library/Logs/Mouthpiece",
    "~/Library/Preferences/com.mouthpiece.app.plist",
  ]
end
