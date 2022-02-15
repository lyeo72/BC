# 집밥선생
![main](https://user-images.githubusercontent.com/88926356/142715852-62bbe4e5-5649-4a12-8ad9-b2b720c799ea.gif)
* 집밥선생은 쇼핑몰 웹어플리케이션 프로젝트입니다.
* 회원을 구매자, 판매자, 관리자로 분리하였습니다.
* 해당 레파지토리는 프로젝트 진행 도중 깃허브 사용 미숙으로 기존의 레파지토리가 사용 불가능해져 새로 만들어진 곳입니다. 이전의 커밋 기록 및 작업 내용을 보시려면 아래의 레파지토리를 참고해주십시오.
  * https://github.com/ITWILL1TEAM/Banchan
* 세부 구현 기능
    * [회원관리](#member)
    * [판매관리](#product)
    * [주문관리](#order)
    * [판매자](#seller)
    * [관리자](#admin)
***
# 개발환경
  * JDK 8
  * MVC
  * TomCat 8.5
  * eclipse EE
  * HTML5, CSS3, JS
  * MySQL 5.7
  * BootStrap
***
# Team Members
* **유여진**
  * GitHub - https://github.com/lyeo72
  * Mail   - lyeo7272@gmail.com

***
# Member
![member](https://user-images.githubusercontent.com/88926356/142716828-18271480-5450-4d52-b8aa-85324195c90a.gif)
- [x] 회원가입은 개인 구매회원과 사업자 판매회원으로 가입 가능.
- [x] 사업자 판매회원은 자사의 제품 판매글 작성 및 상품 조회 등 상품 관리 가능.
- [x] 관리자는 회원조회 및 권한변경, 상품관리, 공지사항, 매출관리 등 가능.
# Product
![product2](https://user-images.githubusercontent.com/88926356/142717270-67d160be-dbc1-426a-8c63-3225161e7f62.gif)
- [x] 각 상품을 대분류/소분류(음식종류/상세분류)로 나눠서 상품분류 DB 설계.
- [x] 장바구니 추가 기능.
- [x] 상품 검색 기능.
- [x] 상품별 리뷰등록 및 상품별 별점분석 기능.
# Cart
![cart](https://user-images.githubusercontent.com/88926356/142717575-6c2ca539-c462-417e-9e84-2315d8f5ba98.gif)
- [x] 수량 조절 버튼과 수정 버튼을 통해 수량 조절 가능.
- [x] 개별 삭제와 선택 삭제를 통해 장바구니에서 삭제 가능
- [x] 주문 버튼 클릭 시 배송지가 입력되지 않은 회원일 경우 배송지 입력 페이지로 이동
- [x] 배송지가 입력된 회원일 경우 결제 페이지로 이동
# Order
![order](https://user-images.githubusercontent.com/88926356/142717772-7ad0c3af-e4da-4e9c-bf4c-2709aa97d669.gif)
- [x] 회원별 배송지관련(기본배송지/신규배송지) 관리 기능.
- [x] 결제 API활용 결제 기능.
- [x] 회원별 주문정보/상세정보 조회기능.
# Seller
![seller](https://user-images.githubusercontent.com/88926356/142717867-9a00e4b1-2895-406f-976a-88d490c9fb8c.gif)
- [x] 상품 등록 가능.
- [x] 상품 삭제 및 수정 가능.
# Admin
![admin](https://user-images.githubusercontent.com/88926356/142717991-348228d6-12ae-4b10-bac8-d9213110bb8b.gif)
- [x] 회원 조회 및 권한 변경과 탈퇴 가능.
- [x] 공지사항 조회 및 작성 가능.
- [x] 매출 차트 조회 가능
