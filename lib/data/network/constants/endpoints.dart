class Endpoints {
  Endpoints._();

  // base url
  static const String baseUrl = "https://codelearn-api.duckdns.org";

  // receiveTimeout
  static const int receiveTimeout = 15000;

  // connectTimeout
  static const int connectionTimeout = 30000;

  // sign in endpoints
  static const String login = baseUrl + "/api/identity/token";
  // register endpoints
  static const String register = baseUrl + "/api/identity/register";

  // changePassword endpoints
  static const String changePassword =
      baseUrl + "/api/identity/change-password";
  //--------------------POST----------------------------------------
  // get post endpoints
  static const String getPostById = baseUrl + "/api/v1/Post/GetById";

  // get post endpoints
  static const String getPosts = baseUrl + "/api/v1/Post/Gets";

  //--------------------COURSE----------------------------------------
  // get course by id endpoints
  static const String getCourseById = baseUrl + "/api/v1/Course/GetById";

  // get course by id endpoints
  static const String getCourses = baseUrl + "/api/v1/Course/GetCourses";

  //--------------------USER----------------------------------------
  // get profile infomation
  static const String getProfileInformation =
      baseUrl + "/api/v1/User/GetProfileInformation";
  //--------------------TRAINING----------------------------------------
  // get trainings endpoints
  static const String getTrainings = baseUrl + "/api/v1/Training/GetTrainings";
}
