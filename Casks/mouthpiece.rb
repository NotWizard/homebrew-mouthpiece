cask "mouthpiece" do
  on_arm do
    version "1.4.1"
    sha256 "213c916e22e1c0db8a0f625f981baa3d4de4a9082989c4274fe719c8c7d60258"

    url "https://github.com/NotWizard/Mouthpiece/releases/download/v#{version}/Mouthpiece-#{version}-arm64.dmg"
  end

  on_intel do
    version "1.4.1"
    sha256 "069177205cc9cfd9568ad920483d5af4c14b77a99b9bec228ea846860822e858"

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

  zap trash: [
    "~/Library/Application Support/Mouthpiece",
    "~/Library/Caches/com.mouthpiece.app",
    "~/Library/Logs/Mouthpiece",
    "~/Library/Preferences/com.mouthpiece.app.plist",
  ]
end
