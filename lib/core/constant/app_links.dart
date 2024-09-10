class AppLinks {
  AppLinks._();
  static const String serverLink =
      'http://muaazaltahan-001-site1.dtempurl.com/api';
  //-------------------------auth------------------------/
  static const String authLink = '$serverLink/auth';
  static const String signUpLink = '$authLink/register';
  static const String loginLink = '$authLink/login';
  static const String refreshTokenLink = '$authLink/refresh-access-token/';
  //-------------------------mosque------------------------/
  static const String mosqueLink = '$serverLink/mosque';
  // static const String createMosqueLink = '$mosqueLink/register';

}
