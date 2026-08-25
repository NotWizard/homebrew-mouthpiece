cask "mouthpiece" do
  on_arm do
    version "2.1.1"
    sha256 "e4cd40e7825f7b72b6a018b4b97d3d9a074dbac3b22266734a5bf3b4551c599f"

    url "https://github.com/NotWizard/Mouthpiece/releases/download/v#{version}/Mouthpiece-#{version}-arm64.dmg"
  end

  on_intel do
    version "2.1.1"
    sha256 "f2c7fce7760a1b8e08fcba56b9d76380cb85e6f67c3f7199eaa479b0e35ab2dd"

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
