import 'package:boilerplate/data/category_repository.dart';
import 'package:boilerplate/data/comment_repository.dart';
import 'package:boilerplate/data/common_repository.dart';
import 'package:boilerplate/data/course_repository.dart';
import 'package:boilerplate/data/network/apis/category_api.dart';
import 'package:boilerplate/data/network/apis/comment_api.dart';
import 'package:boilerplate/data/network/apis/course_api.dart';
import 'package:boilerplate/data/network/apis/identity_api.dart';
import 'package:boilerplate/data/network/apis/post_api.dart';
import 'package:boilerplate/data/network/apis/user_api.dart';
import 'package:boilerplate/data/network/dio_client.dart';
import 'package:boilerplate/data/network/rest_client.dart';
import 'package:boilerplate/data/identity_repository.dart';
import 'package:boilerplate/data/post_repository.dart';
import 'package:boilerplate/data/sharedpref/shared_preference_helper.dart';
import 'package:boilerplate/di/module/local_module.dart';

import 'package:boilerplate/di/module/network_module.dart';
import 'package:boilerplate/stores/error/error_store.dart';
import 'package:boilerplate/stores/form/form_store.dart';
import 'package:boilerplate/stores/language/language_store.dart';

import 'package:boilerplate/stores/theme/theme_store.dart';
import 'package:boilerplate/stores/user/user_store.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../data/network/apis/training_api.dart';

final getIt = GetIt.instance;

Future<void> setupLocator() async {
  // factories:-----------------------------------------------------------------
  getIt.registerFactory(() => ErrorStore());
  getIt.registerFactory(() => FormStore());

  // async singletons:----------------------------------------------------------

  getIt.registerSingletonAsync<SharedPreferences>(
      () => LocalModule.provideSharedPreferences());

  // singletons:----------------------------------------------------------------

  getIt.registerSingleton(
      SharedPreferenceHelper(await getIt.getAsync<SharedPreferences>()));
  getIt.registerSingleton<Dio>(
      NetworkModule.provideDio(getIt<SharedPreferenceHelper>()));
  getIt.registerSingleton(DioClient(getIt<Dio>()));
  getIt.registerSingleton(RestClient());

  // api's:---------------------------------------------------------------------
  getIt.registerSingleton(PostApi(getIt<DioClient>(), getIt<RestClient>()));
  getIt.registerSingleton(IdentityApi(getIt<DioClient>()));
  getIt.registerSingleton(CourseApi(getIt<DioClient>()));
  getIt.registerSingleton(UserApi(getIt<DioClient>()));
  getIt.registerSingleton(TrainingAPI(getIt<DioClient>()));
  getIt.registerSingleton(CommentApi(getIt<DioClient>()));
  getIt.registerSingleton(CategoryAPI(getIt<DioClient>()));

  // repository:----------------------------------------------------------------
  getIt.registerSingleton(IdentityRepository(
      getIt<IdentityApi>(), getIt<SharedPreferenceHelper>(), getIt<UserApi>()));
  getIt.registerSingleton(CommonRepository(getIt<SharedPreferenceHelper>()));
  getIt.registerSingleton(PostRepository(getIt<PostApi>()));
  getIt.registerSingleton(CourseRepository(getIt<CourseApi>()));
  getIt.registerSingleton(CommentRepository(getIt<CommentApi>()));
  getIt.registerSingleton(CategoryRepository(getIt<CategoryAPI>()));

  // stores:--------------------------------------------------------------------
  getIt.registerSingleton(LanguageStore(getIt<CommonRepository>()));

  getIt.registerSingleton(ThemeStore(getIt<CommonRepository>()));
  getIt.registerSingleton(
      UserStore(getIt<IdentityRepository>(), getIt<SharedPreferenceHelper>()));
}
