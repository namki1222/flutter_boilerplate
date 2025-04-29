/// 이메일 검증
extension Validator on String {
  bool validateEmail() {
    return RegExp(
            r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
        .hasMatch(this);
  }

  bool validTel() {
    return RegExp(r'^(01[016789]{1})-?[0-9]{3,4}-?[0-9]{4}$').hasMatch(this);
  }
}
