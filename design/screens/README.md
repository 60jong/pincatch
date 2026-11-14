# 화면 파일

- `png/` — 화면 스크린샷 (390×844, 2배 해상도). `이름.png` = 라이트, `이름Dark.png` = 다크. 구현 결과와 비교하는 기준.
- `preview/` — 브라우저로 바로 열리는 정적 HTML (첫 상태 고정, 애니메이션은 CSS만 동작).
- `source/` — 디자인 캔버스 원본 마크업. `{{ }}` 바인딩과 하단 `class Component` 스크립트에 화면 상태·인터랙션 로직이 있다. 그대로 열리지 않으니 좌표·색·상태 로직 확인용으로 읽는다.

| 묶음 | 화면 |
|---|---|
| 온보딩 | Login, LoginEmail, Terms, PermLocation, PermNotify, Nickname, SignupPhone, SignupPhoneSms, SignupPhoneDone |
| 홈·플레이 | HomeGlass(기본 홈), HomeDouble(2배 대기함), JudgeWin, JudgeLose, Refill, HomeEmpty, HomeNoLocation, HomeOffline |
| 탭 | History, Wallet, MyPage, ProfileEdit, PhotoEdit, PhotoCharacter, Notifications |
| 광고·교환 | AdLoading, AdReward, AdLimit, ExchangeDetail, ExchangeDone, CouponBox |
| 설정 | Invite, NotifSettings, Account, Withdraw, VerifyCenter, VerifyCenterDone, PhoneVerify, PhoneVerifySms, PhoneVerifyDone, DisplayMode |
| 지도 지형 | MapCity, MapApt, MapRiver, MapMountain, MapSea, MapFarm |
| 기타 | Brand(로고), Landing(웹 랜딩, 라이트만) |
