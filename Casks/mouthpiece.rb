cask "mouthpiece" do
  on_arm do
    version "2.2.0"
    sha256 "d08c004e6c27dc05a2d0d549538212849708d6ae6ad3b374befb3ebe9e9c14ed"

    url "https://github.com/NotWizard/Mouthpiece/releases/download/v#{version}/Mouthpiece-#{version}-arm64.dmg"
  end

  on_intel do
    version "2.2.0"
    sha256 "c8207343e35500b629bc15a7029eb1cd8919635fe0fa37d03f804858ec2fe027"

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
