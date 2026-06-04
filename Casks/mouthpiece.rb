cask "mouthpiece" do
  on_arm do
    version "1.4.5"
    sha256 "60861916a7a80a3fe1b0ed8fd1d56917bcaa8000092bc13942c03f585fcf3fb7"

    url "https://github.com/NotWizard/Mouthpiece/releases/download/v#{version}/Mouthpiece-#{version}-arm64.dmg"
  end

  on_intel do
    version "1.4.5"
    sha256 "911b3f8541ffdde9c7a562d3a4ff8cd4e5ebf00f03625ee72bbc49fbae6dc543"

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
