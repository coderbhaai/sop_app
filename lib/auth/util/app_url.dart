class AppUrl {
  static const String liveBaseURL = "";
  static const String localBaseURL = "http://10.0.2.2:8000/api";

  static const String baseURL = localBaseURL;
  static const String login = baseURL + "/login";
  static const String logout = baseURL + "/logout";
  static const String register = baseURL + "/registration";
  static const String forgotPassword = baseURL + "/forgot-password";
}