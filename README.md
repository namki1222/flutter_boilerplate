# 남기의 플러터 보일러플레이트 및 공부

# 이후 추가될 부분들 

bloc + riverpod을 이용한 구조로 변경

프로젝트 구성 시, 반복된 작업 및 반드시 필요한 필수 파일들이 포함된 보일러플레이트 패키지입니다.

## 💽 Installation

```
# 의존성 패키지 다운로드
flutter pub get
```

```
# 파일 Generate
flutter pub run build_runner watch --delete-conflicting-outputs
```

## ❗️ 주의해주세요!

- 현 보일러플레이트 패키지 내의 model 및 repository 는 기본 형태로만 정의되어있습니다. API 명세서에 맞게 재정의가 필요할 수 있습니다.

- `common/constant/data.dart` 내 `baseHostV1` 상수를 서버 호스트에 맞게 정의 후 사용해주세요.

- 다수의 컴포넌트는 상황에 따라 반드시 재정의 및 수정되어야합니다.
  <br/><br/>

## 🛠️ 환경

- **FVM 3.24.0**
- **AOS minSdkVersion 24**
- **AOS compileSdkVersion 34**
  <br/><br/>

## 📂 프로젝트 구성

- **`core`**: 플러터 앱의 전역적인 설정, 유틸함수, 공용 Provider, 상수 등이 포함된 디렉토리입니다. 특히, 라우팅의 경우 `authProvider` 에
  의존합니다.
- **`domain`**: `model`, `repository` 등이 포함된 서버와의 통신을 위한 클래스가 정의된 디렉토리입니다.
- **`service`**: 비즈니스 로직이 정의된 디렉토리입니다. `Provider` 를 통해 상태를 관리하며, `Repository` 를 통해 서버와의 통신을 담당합니다.
                  또한 viewmodel을 StateNotifier로 만들어, state인 ui model이 변경될때마다 ui가 자동으로 변경되게끔 만들었습니다.
- **`presentation`**: 화면을 구성하는 컴포넌트가 정의된 디렉토리입니다. `Screen` 은 각 화면을 구성하는 컴포넌트를 정의합니다.
- **`main.dart`**: 앱의 엔트리포인트입니다.
- **`app.dart`**: `RivderPod`, `ScreenUtils`, `Intl`, `GoRouter` 가 적용되는 최상단 파일입니다.
  <br/><br/>

## 💡 포함된 패키지 (Decument Deprecated, 실제 Pubspec.yaml 을 확인해주세요.)

#### 해당 패키지 목록은 필요에 따라, 혹은 Deprecated 등의 사유로 예고 없이 버전이 변경될 수 있습니다.

### 빌드 패키지

- `badges`: ^3.0.2 # 뱃지 컴포넌트를 위한 패키지

- `cached_network_image`: ^3.2.3 # 네트워크에서 가져온 이미지를 캐싱할 수 있는 패키지, 이미지 로드 동안 보여줄 스켈레톤 등의 임시 컴포넌트를 함께
  지정할 수 있다.
- `debounce_throttle`: ^2.0.0 # 전통적인 Debounce, Throttle 을 구현하기 위한 패키지
- `dio`: ^4.0.6 # HTTP Communicating 라이브러리, Web 환경에서의 Axios, Ajax 와 상응한다.
- `easy_debounce`: ^2.0.3 # Debounce and Throttle 을 보다 간편하게 구현할 수 있는 패키지 (경우에 따라 상단
  debounce_throttle 패키지를 통해 구현하거나, 해당 패키지를 통해 구현하면 된다.)
- `equatable`: ^2.0.5 # 객체 사이의 등가성을 간편하게 확인할 수 있는 패키지
- `form_builder_validators`: ^8.5.0 # flutter_form_builder 와 함께 사용되며, TextField 등의 값을 간편히 검증할 수 있는
  패키지 (값 범위, 정규식, 필수 여부 등)
- `flutter_riverpod`: ^2.2.0 # 상태 관리 패키지 (전통적인 BloC, Provider 등을 대체한다.)
- `flutter_form_builder`: ^7.8.0 # 기존 플러터에서 제공하는 FormBuilder 를 대체하는 패키지 (패키지 내의 TextField, Slider 등은
  onChange 를 통해 상태를 구현하지 않아도 자동으로 해당 패키지에 의해 관리된다.)
- `flutter_screenutil`: ^5.6.1 # 프로젝트 엔트리포인트에서 지정한 기기의 Default Size 에 맞춰 크기가 다른 기기에서도 너비, 높이를
  dynamic 하게 자동으로 변경하여 주는 패키지
- `flutter_secure_storage`: ^8.0.0 # 플러터 저장소, SharedPreferences 보다 더 보안성이 높은 패키지로 보인다.
- `flutter_staggered_grid_view`: ^0.6.2 # 기존 전통적인 GridView 를 대체하는 패키지, 기존에는 GridView 내의 아이템의 크기를
  제어해주는 등의 추가 로직이 필요하였으나, 해당 패키지는 자동으로 크기를 맞춰 GridView 를 구성해준다.
- `fluttertoast`: ^8.2.1 # 플러터 토스트 패키지
- `go_router`: ^6.2.0 # 기존 플러터 라우팅을 대체하는 라우팅 패키지
- `retrofit`: '>=3.0.0 <4.0.0' # HTTP Communicating 추상화 라이브러리, 주로 Repository 구성 시 활용된다.
- `logger`: any #for logging purpose
- `json_annotation`: ^4.8.0 # 직렬화/역직렬화를 위한 어노테이션이 포함된 패키지, 주로 From model to json, From json to model
  간의 직렬화/역직렬화를 위해 사용된다.
- `intl`: ^0.17.0 # 다국어지원 패키지, DateFormatting 등의 기능을 지원한다.
- `skeletons`: ^0.0.3 # 스켈레톤 패키지, 기본으로 제공해주는 스켈레톤 컴포넌트들이 있으며, 사용자가 직접 스켈레톤의 형식을 간편히 컴포넌트의 형태로 지정하여
  사용할 수 있다.
- `uuid`: ^3.0.7 # UUID 패키지
- `carousel_slider`: ^4.2.1 # 캐러셀 패키지
- `wechat_assets_picker`: ^8.4.0 # Wechat 이미지/영상 Picker
- `shared_preferences`: ^2.0.18 # Web 에서의 Cookie 에 상응하는 메모리 데이터 저장 패키지
- `flutter_isolate`: ^2.0.4 # Main Thread 이외에 Background 로직 동작을 위해 필요한 패키지
- `permission_handler`: ^10.2.0 # 앱의 허가(활동, 카메라 등) 등을 대행하는 패키지
- `path_provider`: ^2.0.13 # Path 등을 보다 간편하게 관리할 수 있는 패키지, JS 계열의 path 에 상응
- uni_links: ^0.5.1 # 딥링크
- change_app_package_name: ^1.1.0 # 패키지명 변경을 위해 사용 (보일러플레이트->앱이름)
- percent_indicator: ^4.2.3 # 퍼센트 인디케이터
- infinite_scroll_pagination: ^4.0.0 # 무한 스크롤
- table_calendar: ^3.0.8 # 캘린더
- url_launcher: ^6.1.12 # 외부 URL 오픈 등
- photo_view: ^0.14.0 # 이미지 뷰어
- webview_flutter: ^4.2.4 # 웹뷰
- flutter_naver_login: ^1.8.0 # 네이버 로그인
- kakao_flutter_sdk: ^1.5.0 # 카카오 로그인
- sign_in_with_apple: ^5.0.0 # 애플 로그인

### 개발용 패키지

- `riverpod_generator`: ^1.2.0 # RiverPod 을 generate 하기 위한 패키지
- riverpod_lint: ^2.0.4
- custom_lint: ^0.5.3

- riverpod_generator: ^2.3.2 # RiverPod 을 generate 하기 위한 패키지
- retrofit_generator: ^7.0.8 # Retrofit 을 generate 하기 위한 패키지
- build_runner: '>=2.3.0 <4.0.0' # g.dart 파일 Generate 를 위한 패키지
- json_serializable: ^6.6.1 # 직렬화/역직렬화 코어 패키지
  <br/><br/>

## 프로젝트 구조 관련

<s>
      서버 모델(API DTO)
            ↓
Repository (서버 통신 or DB 조회)
            ↓
      Screen (화면 단위)
            ↓
ViewModel (상태 관리 + 비즈니스 로직)
            ↓
  UI Model (View에서 쓰는 데이터)

</s>

해당 구조에 따라 나누어 파일트리를 작성했으며 mvvm 패턴에 을 구성함
      