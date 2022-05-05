// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$UserStore on _UserStore, Store {
  Computed<bool>? _$isLoginLoadingComputed;

  @override
  bool get isLoginLoading =>
      (_$isLoginLoadingComputed ??= Computed<bool>(() => super.isLoginLoading,
              name: '_UserStore.isLoginLoading'))
          .value;
  Computed<bool>? _$isRegisterLoadingComputed;

  @override
  bool get isRegisterLoading => (_$isRegisterLoadingComputed ??= Computed<bool>(
          () => super.isRegisterLoading,
          name: '_UserStore.isRegisterLoading'))
      .value;
  Computed<bool>? _$isChangePasswordLoadingComputed;

  @override
  bool get isChangePasswordLoading => (_$isChangePasswordLoadingComputed ??=
          Computed<bool>(() => super.isChangePasswordLoading,
              name: '_UserStore.isChangePasswordLoading'))
      .value;

  final _$isLoggedInAtom = Atom(name: '_UserStore.isLoggedIn');

  @override
  bool get isLoggedIn {
    _$isLoggedInAtom.reportRead();
    return super.isLoggedIn;
  }

  @override
  set isLoggedIn(bool value) {
    _$isLoggedInAtom.reportWrite(value, super.isLoggedIn, () {
      super.isLoggedIn = value;
    });
  }

  final _$loginSuccessAtom = Atom(name: '_UserStore.loginSuccess');

  @override
  bool get loginSuccess {
    _$loginSuccessAtom.reportRead();
    return super.loginSuccess;
  }

  @override
  set loginSuccess(bool value) {
    _$loginSuccessAtom.reportWrite(value, super.loginSuccess, () {
      super.loginSuccess = value;
    });
  }

  final _$loginFutureAtom = Atom(name: '_UserStore.loginFuture');

  @override
  ObservableFuture<bool> get loginFuture {
    _$loginFutureAtom.reportRead();
    return super.loginFuture;
  }

  @override
  set loginFuture(ObservableFuture<bool> value) {
    _$loginFutureAtom.reportWrite(value, super.loginFuture, () {
      super.loginFuture = value;
    });
  }

  final _$registerSuccessAtom = Atom(name: '_UserStore.registerSuccess');

  @override
  bool get registerSuccess {
    _$registerSuccessAtom.reportRead();
    return super.registerSuccess;
  }

  @override
  set registerSuccess(bool value) {
    _$registerSuccessAtom.reportWrite(value, super.registerSuccess, () {
      super.registerSuccess = value;
    });
  }

  final _$registerFutureAtom = Atom(name: '_UserStore.registerFuture');

  @override
  ObservableFuture<bool> get registerFuture {
    _$registerFutureAtom.reportRead();
    return super.registerFuture;
  }

  @override
  set registerFuture(ObservableFuture<bool> value) {
    _$registerFutureAtom.reportWrite(value, super.registerFuture, () {
      super.registerFuture = value;
    });
  }

  final _$changePasswordSuccessAtom =
      Atom(name: '_UserStore.changePasswordSuccess');

  @override
  bool get changePasswordSuccess {
    _$changePasswordSuccessAtom.reportRead();
    return super.changePasswordSuccess;
  }

  @override
  set changePasswordSuccess(bool value) {
    _$changePasswordSuccessAtom.reportWrite(value, super.changePasswordSuccess,
        () {
      super.changePasswordSuccess = value;
    });
  }

  final _$changePasswordFutureAtom =
      Atom(name: '_UserStore.changePasswordFuture');

  @override
  ObservableFuture<bool> get changePasswordFuture {
    _$changePasswordFutureAtom.reportRead();
    return super.changePasswordFuture;
  }

  @override
  set changePasswordFuture(ObservableFuture<bool> value) {
    _$changePasswordFutureAtom.reportWrite(value, super.changePasswordFuture,
        () {
      super.changePasswordFuture = value;
    });
  }

  final _$changePasswordAsyncAction = AsyncAction('_UserStore.changePassword');

  @override
  Future<dynamic> changePassword(
      String currentPassword, String newPassword, String confirmNewPassword) {
    return _$changePasswordAsyncAction.run(() =>
        super.changePassword(currentPassword, newPassword, confirmNewPassword));
  }

  final _$loginAsyncAction = AsyncAction('_UserStore.login');

  @override
  Future<dynamic> login(String email, String password) {
    return _$loginAsyncAction.run(() => super.login(email, password));
  }

  final _$registerAsyncAction = AsyncAction('_UserStore.register');

  @override
  Future<dynamic> register(String firstName, String lastName, String email,
      String userName, String password, String confirmPassword) {
    return _$registerAsyncAction.run(() => super.register(
        firstName, lastName, email, userName, password, confirmPassword));
  }

  @override
  String toString() {
    return '''
isLoggedIn: ${isLoggedIn},
loginSuccess: ${loginSuccess},
loginFuture: ${loginFuture},
registerSuccess: ${registerSuccess},
registerFuture: ${registerFuture},
changePasswordSuccess: ${changePasswordSuccess},
changePasswordFuture: ${changePasswordFuture},
isLoginLoading: ${isLoginLoading},
isRegisterLoading: ${isRegisterLoading},
isChangePasswordLoading: ${isChangePasswordLoading}
    ''';
  }
}
