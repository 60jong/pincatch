#!/bin/bash
# PreToolUse(Edit|Write) 훅 — 손으로 고치면 안 되는 경로의 수정을 막는다 (종료 코드 2 = 차단).
# 손으로 돌려 보기: echo '{"tool_input":{"file_path":"design/screens/png/Login.png"}}' | .claude/hooks/guard-paths.sh

file=$(jq -r '.tool_input.file_path // empty')
case "$file" in
  */design/screens/png/*|*/design/screens/source/*|*/design/screens/preview/*|design/screens/png/*|design/screens/source/*|design/screens/preview/*)
    echo "design/screens 는 디자인 인수인계 원본(구현 비교 기준)이라 수정하지 않습니다. 구현을 원본에 맞추세요. 원본 자체를 바꿔야 하면 사용자에게 먼저 확인하세요." >&2
    exit 2 ;;
  */apps/mobile/ios/*|*/apps/mobile/android/*|apps/mobile/ios/*|apps/mobile/android/*)
    echo "ios/ 와 android/ 는 Expo가 자동 생성합니다. 직접 고치지 말고 app.json 과 config plugin 으로 설정하세요." >&2
    exit 2 ;;
esac
exit 0
