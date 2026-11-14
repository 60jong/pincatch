#!/bin/bash
# Stop 훅 — 작업을 끝내기 전에, 커밋 안 된 변경이 있는 영역의 검증 명령을 돌린다.
# 실패하면 종료 코드 2로 막고 출력을 Claude에게 돌려준다. 성공하면 아무것도 출력하지 않는다.
# 검사 내용은 여기 두지 않는다 — 각 앱의 검증 명령(npm run verify, ./gradlew test)을 부르기만 한다.
# 손으로 돌려 보기: echo '{}' | .claude/hooks/verify-on-stop.sh

input=$(cat)
# 이 훅 때문에 이미 한 번 더 일한 뒤라면 통과시킨다 (못 고치는 실패에서 끝없이 도는 것 방지)
[ "$(jq -r '.stop_hook_active // false' <<<"$input" 2>/dev/null)" = "true" ] && exit 0

cd "$(dirname "$0")/../.." || exit 0
cache_dir="$(git rev-parse --git-dir)/claude-verify"
mkdir -p "$cache_dir"

# verify <이름> <폴더> <명령...> — 폴더에 변경이 있고, 마지막으로 통과한 상태와 다를 때만 돌린다
verify() {
  local name=$1 dir=$2; shift 2
  [ -z "$(git status --porcelain -- "$dir")" ] && return 0
  local state
  state=$({ git diff HEAD -- "$dir"; git ls-files -o --exclude-standard -z -- "$dir" | xargs -0 shasum 2>/dev/null; } | shasum | cut -d' ' -f1)
  [ "$(cat "$cache_dir/$name" 2>/dev/null)" = "$state" ] && return 0

  local output
  if output=$(cd "$dir" && "$@" 2>&1); then
    echo "$state" > "$cache_dir/$name"
    return 0
  fi
  {
    echo "[$name] 검증 실패 — 고친 뒤에 끝내세요. 재현: (cd $dir && $*)"
    echo "$output" | tail -n 60
  } >&2
  return 1
}

failed=0
verify mobile apps/mobile npm run --silent verify || failed=1

# 로컬 PostgreSQL이 꺼져 있으면 DB가 필요한 컨텍스트 로딩 테스트만 뺀다
server_args=(test -q)
nc -z localhost 5432 2>/dev/null || server_args+=(-PskipDbTests)
verify server apps/server ./gradlew "${server_args[@]}" || failed=1

[ "$failed" = 1 ] && exit 2
exit 0
