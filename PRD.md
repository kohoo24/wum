💞💞💞

**Product Requirements Document (PRD)**

💞💞💞

---

🎉🎉🎉

**1. 프로젝트 개요**

**프로젝트 이름**: 너랑 같이 가고 싶은 곳

**프로젝트 설명**:
커플들이 가고 싶은 맛집이나 카페를 체크하고 서로의 수락을 통해 공통 지도로 확정된 위치를 관리할 수 있는 커플 전용 위치 체크 앱입니다. 기존의 일반적인 지도 앱과 달리, 커플 간 상호작용을 중심으로 설계되어 더 나은 커뮤니케이션과 관계 강화를 목표로 합니다. 또한 간단하면서도 귀여운 UI를 통해 사용자 경험을 강화하며, Flutter를 활용한 크로스 플랫폼 개발로 다양한 디바이스에서 동일한 경험을 제공합니다.

🎉🎉🎉

---

🔍🔍🔍

**2. 유저 플로우**

1. **회원가입 및 로그인**:

   - 이메일 또는 소셜 계정을 이용하여 회원가입/로그인.
   - 커플 간 연동 코드 입력을 통한 계정 연결.

2. **위치 리스트업 및 체크**:

   - 현재 위치 기준 가까운 맛집/카페 리스트 확인.
   - 원하는 위치를 선택하여 체크 후 상대방에게 알림 전송.

3. **상대방의 반응**:

   - 상대방이 체크한 위치를 확인.
   - 마음에 들면 승인(지도에 추가), 마음에 들지 않으면 거절(사유 입력). 거절 시 간단한 사유를 입력하는 텍스트 필드가 표시되며, 이 입력은 필수입니다. 입력된 사유는 요청을 보낸 사용자에게 알림으로 전달됩니다.

4. **공통 지도 관리**:

   - 승인된 위치가 공통 지도로 표시.
   - 각 장소에 귀여운 마커(핀, 하트 모양, 커피잔, 접시 등 이모티콘)를 추가하여 커플 앱만의 감성을 살림. 예를 들어, 맛집은 접시 이모티콘, 카페는 커피잔, 술집은 와인잔으로 표현할 수 있습니다.

🔍🔍🔍

---

🚀🚀🚀

**3. 핵심 기능**

1. **지도 기반 UI/UX**:

   - 가고 싶은 장소를 지도에 체크하고 마커로 표시.
   - 사용자가 승인한 위치는 공통 지도에 반영.

2. **카테고리화**:

   - 맛집(밥집), 카페, 술집(바) 등으로 장소 카테고리화.

3. **상대방과의 상호작용**:

   - 사용자가 체크한 장소에 대해 상대방이 승인/거절 가능.
   - 거절 시 사유를 입력하여 피드백 제공.

4. **리스트 기능**:

   - 현재 위치 기준 가까운 순서대로 장소를 리스트업.
   - 카테고리별 필터 기능.

5. **알림 기능**:

   - 체크 요청 및 승인/거절 결과를 푸시 알림으로 전달.
   - GPS 위치를 근거로 반경 100미터 내에 커플이 선택한 맛집이 있을 경우 푸시 알림으로 표시. 알림은 최대 1시간 간격으로 발송되며, 알림 빈도는 사용자가 설정에서 조정 가능하도록 지원합니다.

6. **공통 지도**:

   - 승인된 위치가 커플 간 공통 지도로 관리.
   - 각 장소에 마커 및 이모티콘 표시.

🚀🚀🚀

---

🔧🔧🔧

**4. 기술 스택**

1. **프론트엔드**:

   - Flutter: 크로스 플랫폼 앱 개발.
   - Google Maps API: 지도 및 장소 검색 기능.

2. **백엔드**:

   - Firebase: 사용자 인증, 데이터베이스, 푸시 알림.
   - Node.js (추가 필요시): 커스텀 API 서버 개발.

3. **데이터베이스**:

   - Firestore: 장소 데이터 및 사용자 활동 데이터 저장.

4. **추가 라이브러리 및 도구**:

   - Geolocator: 사용자 위치 추적.
   - Provider/Riverpod: 상태 관리.
   - Flutter_local_notifications: 알림 처리.

🔧🔧🔧

---

🌟🌟🌟

**5. MVP 기능**

1. **회원가입 및 커플 연동**:

   - 사용자 계정 생성 및 커플 계정 연동 기능.

2. **지도 및 위치 체크**:

   - 사용자가 장소를 선택하고 체크하여 상대방에게 요청.
   - 상대방 승인 시 공통 지도에 추가.

3. **카테고리별 필터**:

   - 장소를 맛집, 카페, 술집으로 구분하여 관리.

4. **푸시 알림**:

   - 체크 요청, 승인/거절 결과 알림.

5. **공통 지도 표시**:

   - 승인된 장소를 지도에 표시 및 마커 추가.

🌟🌟🌟

---

🌈🌈🌈

**6. 추가 개선사항 (MVP 이후 개발)**

1. **커플 대화 기능**:

   - 체크한 장소에 대한 의견을 나눌 수 있는 간단한 채팅 기능.

2. **즐겨찾기 및 히스토리**:

   - 자주 가는 장소를 즐겨찾기로 관리.
   - 방문 완료한 장소 기록 기능.

3. **다양한 테마 및 UI 커스터마이징**:

   - 사용자 선택에 따라 지도 테마 및 마커 커스터마이징.

4. **리뷰 및 별점 기능**:

   - 체크한 장소에 대한 간단한 리뷰 작성.

5. **위치 추천 기능**:

   - AI 기반으로 사용자 취향에 맞는 장소 추천.

6. **위치 기반 이벤트**:

   - 특정 장소에서 쿠폰/이벤트 정보 제공.

**우선순위 및 피드백 반영 계획**:

- **1순위**: 커플 대화 기능 및 즐겨찾기/히스토리 기능 개발. 이는 사용자의 기본적인 소통 및 데이터 관리 요구를 충족시킵니다.
- **2순위**: 리뷰 및 별점 기능과 위치 추천 기능. 사용자 참여도를 높이고 개인화된 경험을 제공합니다.
- **3순위**: 테마/UI 커스터마이징과 위치 기반 이벤트. 사용자에게 더 나은 시각적 경험과 부가적인 혜택을 제공합니다.

사용자의 피드백은 정기적인 설문과 앱 내 리뷰를 통해 수집되며, 이를 바탕으로 기능 개선 및 우선순위 조정을 진행합니다.

🌈🌈🌈

---

🌟🌟🌟

**7. 기대 효과**

- 커플 간 소통 및 관계 강화.
- 가고 싶은 장소를 체계적으로 관리.
- 귀여운 UI와 직관적 사용성으로 사용자 만족도 향상.

🌟🌟🌟
