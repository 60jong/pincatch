# CLAUDE.md — catchpin

- `apps/mobile` — Expo 앱. 규칙은 `apps/mobile/CLAUDE.md`
- `apps/server` — Spring Boot API. 규칙은 `apps/server/CLAUDE.md`
- `design` — 디자인 기준. `design/DESIGN.md`가 최우선

## 커밋과 PR

커밋 기록은 다음 작업자(사람이든 에이전트든)가 읽는 유일한 작업 기억이다. 세션 내용을 모르는 사람이 읽는다고 생각하고 쓴다.

- 형식은 `.gitmessage`를 따른다. 한국어로 쓴다. 제목은 명사형으로 끝나는 한 줄, 본문은 **왜** 바꿨는지(결정과 버린 대안), 끝에 트레일러(키는 영어 그대로).
- `Verified:`에는 실제로 돌려서 통과한 명령만 적는다. 돌리지 않았거나 확인하지 못한 것은 `Unverified:`에 적는다. 둘 다 없이 "동작함"이라고 쓰지 않는다.
- 이유가 다른 변경은 커밋을 나눈다.
- 커밋과 PR에 `Co-Authored-By`나 "Generated with Claude Code" 같은 에이전트 표기를 넣지 않는다.
- PR 본문은 `.github/pull_request_template.md`의 모든 항목을 채운다. 한국어로, 코드를 읽지 않는 사람이 확인할 수 있게 쓴다.
- main에 푸시하면 자동 배포되므로, 푸시는 요청받았을 때만 한다.
