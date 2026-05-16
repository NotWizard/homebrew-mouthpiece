cask "mouthpiece" do
  on_arm do
    version "1.3.0"
    sha256 "eba4937f21af3de271186c51fa4c3568d6a54d0d8a215dc8a08ceeda4c404b10"

    url "https://github.com/NotWizard/Mouthpiece/releases/download/v#{version}/Mouthpiece-#{version}-arm64.dmg"
  end

  on_intel do
    version "1.3.0"
    sha256 "857b1fce2576e89e57cfa7ddc043b71c16b6d517d47f81dc687f2c9704f5b340"

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
