/// AppRouter 정의
/// [path] - path 는 절대적 경로를 정의한다.
/// [name] - name 는 router 의 name 을 정의한다.
/// [name] - enum 에 정의한 값과 동일하게 설정한다(GoRouter relative path 로 활용되기 때문).
enum AppRouter {
  /// Splash Router
  splash(path: '/splash', name: 'splash', subPath: 'splash'),

  /// WebView Router
  webviewTerm(path: '/webview/term', name: 'webviewTerm', subPath: 'term'),

  /// 주소 검색 Router
  searchAddr(path: '/searchAddr', name: 'searchAddr', subPath: 'searchAddr'),

  /// Auth Router
  auth(path: '/auth', name: 'auth', subPath: 'auth'),
  join(path: '/auth/join', name: 'join', subPath: 'join'),
  joinComplete(path: '/auth/join/complete', name: 'joinComplete', subPath: 'complete'),
  findId(path: '/auth/findId', name: 'findId', subPath: 'findId'),
  findPassword(path: '/auth/findPassword', name: 'findPassword', subPath: 'findPassword'),
  findPasswordUpdate(path: '/auth/findPassword/update', name: 'findPasswordUpdate', subPath: 'findPasswordUpdate'),

  // Home Router
  home(path: '/home', name: 'home', subPath: 'home'),
  homeDetail(path: '/home/detail', name: 'detail', subPath: 'detail'),
  homeComplete(path: '/home/detail/homeComplete', name: 'homeComplete', subPath: 'homeComplete'),
  badCompany(path: '/home/badCompany', name: 'badCompany', subPath: 'badCompany'),
  badCompanySearch(path: '/home/badCompany/badCompanySearch', name: 'badCompanySearch', subPath: 'badCompanySearch'),
  order(path: '/order', name: 'order', subPath: 'order'),
  orderSpecific(path: '/order/specific', name: 'orderSpecific', subPath: 'specific'),
  orderComplete(path: '/order/complete', name: 'orderComplete', subPath: 'orderComplete'),
  orderRegisterPeriod(path: '/order/registerPeriod', name: 'orderRegisterPeriod', subPath: 'registerPeriod'),
  orderRegisterTime(path: '/order/registerTime', name: 'orderRegisterTime', subPath: 'registerTime'),
  orderRegisterAddress(path: '/order/registerAddress', name: 'orderRegisterAddress', subPath: 'registerAddress'),
  history(path: '/history', name: 'history', subPath: 'history'),
  point(path: '/point', name: 'point', subPath: 'point'),
  pointCharge(path: '/point/charge', name: 'pointCharge', subPath: 'pointCharge'),
  pointRefund(path: '/point/refund', name: 'pointRefund', subPath: 'pointRefund'),
  pointComplete(path: '/point/complete', name: 'pointComplete', subPath: 'pointComplete'),
  my(path: '/my', name: 'my', subPath: 'my'),
  terms(path: '/my/terms', name: 'terms', subPath: 'terms'),
  ban(path: '/my/ban', name: 'ban', subPath: 'ban'),
  addBan(path: '/my/ban/addBan', name: 'addBan', subPath: 'addBan'),
  notice(path: '/my/notice', name: 'notice', subPath: 'notice'),
  noticeDetail(path: '/my/notice/noticeDetail', name: 'noticeDetail', subPath: 'noticeDetail'),
  inquiry(path: '/my/inquiry', name: 'inquiry', subPath: 'inquiry'),
  setting(path: '/my/setting', name: 'setting', subPath: 'setting'),
  withdrawal(path: '/my/setting/withdrawal', name: 'withdrawal', subPath: 'withdrawal'),
  myAddress(path: '/my/myAddress', name: 'myAddress', subPath: 'myAddress'),
  myPwdChangeAuth(path: '/my/setting/myPwdChangeAuth', name: 'myPwdChangeAuth', subPath: 'myPwdChangeAuth'),
  myPwdChange(path: '/my/setting/myPwdChangeAuth/myPwdChange', name: 'myPwdChange', subPath: 'myPwdChange'),
  myIdChange(path: '/my/setting/myIdChangeAuth/myIdChange', name: 'myIdChange', subPath: 'myIdChange'),
  systemPush(path: '/my/setting/push/system', name: 'systemPush', subPath: 'system'),
  orderPush(path: '/my/setting/push/order', name: 'orderPush', subPath: 'order'),
  temp(path: 'temp', name: 'temp', subPath: 'temp');

  const AppRouter({required this.path, required this.name, required this.subPath});

  final String path;
  final String name;
  final String subPath;
}
