cask "mouthpiece" do
  on_arm do
    version "1.4.6"
    sha256 "4a22f139f6631e1594633c25e4ee6db5a74f4aee192a46b3cf02105a51bcca4e"

    url "https://github.com/NotWizard/Mouthpiece/releases/download/v#{version}/Mouthpiece-#{version}-arm64.dmg"
  end

  on_intel do
    version "1.4.6"
    sha256 "e3638e8e09c548eb9b1754873838f9574d0f390af8377b2b8353ca6aa3ede102"

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
