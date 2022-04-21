import 'package:boilerplate/constants/app_theme.dart';
import 'package:boilerplate/constants/strings.dart';
import 'package:boilerplate/data/common_repository.dart';
import 'package:boilerplate/data/identity_repository.dart';

import 'package:boilerplate/di/components/service_locator.dart';
import 'package:boilerplate/ui/login/login.dart';
import 'package:boilerplate/ui/mail_confirm/mail_confirm.dart';
import 'package:boilerplate/ui/main/main_screen.dart';
import 'package:boilerplate/ui/post_detail/post_detail.dart';
import 'package:boilerplate/ui/register/register.dart';
import 'package:boilerplate/ui/splash/splash.dart';
import 'package:boilerplate/ui/webview/webview.dart';

import 'package:boilerplate/utils/routes/routes.dart';
import 'package:boilerplate/stores/language/language_store.dart';

import 'package:boilerplate/stores/theme/theme_store.dart';
import 'package:boilerplate/stores/user/user_store.dart';

import 'package:boilerplate/utils/locale/app_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  // Create your store as a final variable in a base Widget. This works better
  // with Hot Reload than creating it directly in the `build` function.
  final ThemeStore _themeStore = ThemeStore(getIt<CommonRepository>());
  final LanguageStore _languageStore = LanguageStore(getIt<CommonRepository>());
  final UserStore _userStore = UserStore(getIt<IdentityRepository>());

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<ThemeStore>(create: (_) => _themeStore),
        Provider<LanguageStore>(create: (_) => _languageStore),
        Provider<UserStore>(create: (_) => _userStore),
      ],
      child: Observer(
        name: 'global-observer',
        builder: (context) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: Strings.appName,
            theme: _themeStore.darkMode ? themeDataDark : themeData,
            routes: Routes.routes,
            locale: Locale(_languageStore.locale),
            supportedLocales: _languageStore.supportedLanguages
                .map((language) => Locale(language.locale!, language.code))
                .toList(),
            localizationsDelegates: [
              // A class which loads the translations from JSON files
              AppLocalizations.delegate,
              // Built-in localization of basic text for Material widgets
              GlobalMaterialLocalizations.delegate,
              // Built-in localization for text direction LTR/RTL
              GlobalWidgetsLocalizations.delegate,
              // Built-in localization of basic text for Cupertino widgets
              GlobalCupertinoLocalizations.delegate,
            ],
            home: SplashScreen(),
          );
        },
      ),
    );
  }
}
