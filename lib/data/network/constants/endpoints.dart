class Endpoints {
  Endpoints._();

  // base url
  static const String baseUrl = "http://192.168.1.144:5000";

  // receiveTimeout
  static const int receiveTimeout = 15000;

  // connectTimeout
  static const int connectionTimeout = 30000;

  // booking endpoints
  static const String getPosts = baseUrl + "/posts";

  // sign in endpoints
  static const String login = baseUrl + "/api/identity/token";
}
