cask "gui-process-manager" do
  version "1.0.0"
  sha256 "REPLACE_WITH_ACTUAL_SHA256"

  url "https://github.com/dev-gyus/gui-process-manager/releases/download/v#{version}/GUI-Process-Manager-#{version}-arm64.dmg"
  name "GUI Process Manager"
  desc "GUI Process Manager for macOS - Manage your development servers with ease"
  homepage "https://github.com/dev-gyus/gui-process-manager"

  # macOS 최소 버전 요구사항
  depends_on macos: ">= :catalina"

  app "GUI Process Manager.app"

  # 공증 없는 앱에 대한 사용자 안내
  postflight do
    puts "\n⚠️  이 앱은 Apple 공증을 받지 않았습니다."
    puts "처음 실행 시 다음 단계를 따르세요:"
    puts "1. 앱을 실행하면 보안 경고가 표시됩니다"
    puts "2. 시스템 설정 > 보안 및 개인정보 보호로 이동"
    puts "3. '확인 없이 열기' 버튼을 클릭\n\n"
  end

  # 제거 시 환경설정 파일도 삭제
  zap trash: [
    "~/Library/Application Support/gui-process-manager",
    "~/Library/Preferences/com.gyus.gui-process-manager.plist",
    "~/Library/Saved Application State/com.gyus.gui-process-manager.savedState",
  ]
end
