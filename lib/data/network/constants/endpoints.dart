class Endpoints {
  Endpoints._();

  // base url
  static const String baseUrl = "http://192.168.0.101:5000";

  // receiveTimeout
  static const int receiveTimeout = 15000;

  // connectTimeout
  static const int connectionTimeout = 30000;

  // booking endpoints
  static const String getPosts = baseUrl + "/posts";

  // sign in endpoints
  static const String login = baseUrl + "/api/identity/token";

  // get post endpoints
  static const String getPostById = baseUrl + "/api/v1/Post/GetById";

  //--------------------COURSE----------------------------------------
  // get course by id endpoints
  static const String getCourseById = baseUrl + "/api/v1/Course/GetById";

  // get course by id endpoints
  static const String getCourses = baseUrl + "/api/v1/Course/GetCourses";
}
