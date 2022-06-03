class Endpoints {
  Endpoints._();

  // base url
  static const String baseUrl = "http://172.20.10.7:5000";

  static const String webViewUrl = "http://172.20.10.7:3000";

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
  //--------------------POST--------------------
  // get post endpoints
  static const String getPostById = baseUrl + "/api/v1/Post/GetById";

  // get post endpoints
  static const String getPosts = baseUrl + "/api/v1/Post/Gets";

  // vote post endpoints
  static const String votePosts = baseUrl + "/api/v1/Post/VotePost";

  // vote post endpoints
  static const String createPost = baseUrl + "/api/v1/Post/Create";

  // get user post endpoints
  static const String getUserPost = baseUrl + "/api/v1/Post/GetUserPost";
  //--------------------COURSE--------------------
  // get course by id endpoints
  static const String getCourseById = baseUrl + "/api/v1/Course/GetById";

  // get course by id endpoints
  static const String getCourses = baseUrl + "/api/v1/Course/GetCourses";

  // get course by id endpoints
  static const String getUserCourses =
      baseUrl + "/api/v1/Course/GetUserCourses";
  // EnrollCourse
  static const String enrollCourse = baseUrl + "/api/v1/Course/EnrollCourse";

  //--------------------USER--------------------
  // get profile infomation
  static const String getProfileInformation =
      baseUrl + "/api/v1/User/GetProfileInformation";
  static const String updateUserInfo = baseUrl + "/api/v1/User/UpdateUserInfo";
  //--------------------TRAINING--------------------
  // get trainings endpoints
  static const String getTrainings = baseUrl + "/api/v1/Training/GetTrainings";
  static const String createTraining =
      baseUrl + "/api/v1/Training/CreateTraining";

  // get getUserTrainings endpoints
  static const String getUserTrainings =
      baseUrl + "/api/v1/Training/GetUserTrainings";

  //--------------------Comment--------------------
  // create comment
  static const String createComment = baseUrl + "/api/v1/Comment/CreateComment";

  //--------------------Category--------------------
  //get categories
  static const String getCategories =
      baseUrl + "/api/v1/Category/GetCategories";
}
