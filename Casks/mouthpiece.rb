cask "mouthpiece" do
  on_arm do
    version "2.0.10"
    sha256 "b2d4b194abd0e4cf85ad4367ca3f13ba6b3fa56260ddd464720f2a173944021b"

    url "https://github.com/NotWizard/Mouthpiece/releases/download/v#{version}/Mouthpiece-#{version}-arm64.dmg"
  end

  on_intel do
    version "2.0.10"
    sha256 "f081b6251093253ff341c4e4232afbfd47884960a141031999a56141b047454d"

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

  zap trash: [
    "~/.cache/mouthpiece",
    "~/Library/Application Support/Mouthpiece",
    "~/Library/Preferences/com.mouthpiece.app.plist",
  ]
end
