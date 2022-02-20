# 🥕DaangnMarket🥕

### 구현할 화면

<img width="766" alt="기획서" src="https://user-images.githubusercontent.com/74968390/154832397-b61d0ae5-61bc-42e6-91b5-394ba83222ff.png">

### 구현할 기능들

1. 홈 화면 : + 버튼 고정
2. 동네생활 게시판  : 글쓰기 버튼 고정
3. 동네생활 키워드 : 키워드마다 해당 제목 (동네질문 / 동네맛집 등)
4. 내 근처 : 검색창에 텍스트 입력 가능
5. 채팅 : 클릭시 빈 뷰컨트롤러
6. 나의 당근 : UI만 그대로 구현

### 구현 방안

1. 홈화면 : UITableView(물건 목록) + 가장 상단 View에 UIButton 고정(+ 버튼)
2. 동네생활 게시판 : UITableView(게시글) + UICollectionView(키워드)  + 가장 상단 View에 UIButton 고정(연필 버튼)
3. 동네생활 키워드 : UITableView(+ section 사용)
4. 내 근처 : UIStackView + UIScrollView
    → cell의 개수가 6개고, cell이 다르게 구현되어 있어 재사용 거의 불가능
    + Search Bar (검색창)
    
5. 채팅 : UITableView (채팅 목록)
6. 나의 당근 : UITableView(+ section 사용)
