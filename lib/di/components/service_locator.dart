import 'package:boilerplate/data/common_repository.dart';
import 'package:boilerplate/data/network/apis/identity/identity_api.dart';
import 'package:boilerplate/data/network/apis/posts/post_api.dart';
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
import 'package:boilerplate/stores/post/post_store.dart';
import 'package:boilerplate/stores/theme/theme_store.dart';
import 'package:boilerplate/stores/user/user_store.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

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

  // repository:----------------------------------------------------------------
  getIt.registerSingleton(IdentityRepository(
      getIt<IdentityApi>(), getIt<SharedPreferenceHelper>()));
  getIt.registerSingleton(CommonRepository(getIt<SharedPreferenceHelper>()));
  getIt.registerSingleton(PostRepository());

  // stores:--------------------------------------------------------------------
  getIt.registerSingleton(LanguageStore(getIt<CommonRepository>()));
  getIt.registerSingleton(PostStore(getIt<PostRepository>()));
  getIt.registerSingleton(ThemeStore(getIt<CommonRepository>()));
  getIt.registerSingleton(UserStore(getIt<IdentityRepository>()));
}
