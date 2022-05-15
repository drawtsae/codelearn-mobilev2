import 'package:boilerplate/data/network/exceptions/network_exceptions.dart';
import 'package:boilerplate/data/sharedpref/shared_preference_helper.dart';
import 'package:boilerplate/models/user/user_info.dart';
import 'package:boilerplate/stores/error/error_store.dart';
import 'package:mobx/mobx.dart';

import '../../data/identity_repository.dart';
import '../form/form_store.dart';

part 'user_store.g.dart';

class UserStore = _UserStore with _$UserStore;

abstract class _UserStore with Store {
  // repository instance
  final IdentityRepository _repository;
  final SharedPreferenceHelper _sharedPreferenceHelper;

  // store for handling form errors
  final FormErrorStore formErrorStore = FormErrorStore();

  // store for handling error messages
  final ErrorStore errorStore = ErrorStore();
  @observable
  // bool to check if current user is logged in
  bool isLoggedIn = false;

  // constructor:---------------------------------------------------------------
  _UserStore(IdentityRepository repository, this._sharedPreferenceHelper)
      : this._repository = repository {
    // setting up disposers
    _setupDisposers();

    // checking if user is logged in
    repository.isLoggedIn.then((value) {
      this.isLoggedIn = value;
    });
  }

  // disposers:-----------------------------------------------------------------
  late List<ReactionDisposer> _disposers;

  void _setupDisposers() {
    _disposers = [
      reaction((_) => loginSuccess, (_) => loginSuccess = false, delay: 200),
    ];
  }

  // empty responses:-----------------------------------------------------------
  static ObservableFuture<bool> emptyLoginResponse =
      ObservableFuture.value(false);

  static ObservableFuture<bool> emptyRegisterResponse =
      ObservableFuture.value(false);

  static ObservableFuture<bool> emptyChangePasswordResponse =
      ObservableFuture.value(false);

  // store variables:-----------------------------------------------------------
  @observable
  bool loginSuccess = false;

  @observable
  ObservableFuture<bool> loginFuture = emptyLoginResponse;

  @computed
  bool get isLoginLoading => loginFuture.status == FutureStatus.pending;

  @observable
  bool registerSuccess = false;

  @observable
  ObservableFuture<bool> registerFuture = emptyRegisterResponse;

  @computed
  bool get isRegisterLoading => registerFuture.status == FutureStatus.pending;

  @observable
  bool changePasswordSuccess = false;

  @observable
  ObservableFuture<bool> changePasswordFuture = emptyChangePasswordResponse;

  @computed
  bool get isChangePasswordLoading =>
      changePasswordFuture.status == FutureStatus.pending;

  // actions:-------------------------------------------------------------------
  @action
  Future changePassword(String currentPassword, String newPassword,
      String confirmNewPassword) async {
    final future = _repository.changePassword(
      currentPassword,
      newPassword,
      confirmNewPassword,
    );
    changePasswordFuture = ObservableFuture(future);
    await future.then((value) async {
      if (value) {
        this.changePasswordSuccess = true;
      } else {
        print('failed to change password');
      }
    }).catchError((e) {
      print(e);
      this.changePasswordSuccess = false;
      final errorMessage = NetworkException.fromDioError(e).toString();
      errorStore.setErrorMessage(errorMessage);
    });
  }

  @action
  Future login(String email, String password) async {
    final future = _repository.login(email, password);
    loginFuture = ObservableFuture(future);
    await future.then((value) async {
      if (value) {
        _repository.saveIsLoggedIn(true);
        this.isLoggedIn = true;
        this.loginSuccess = true;
      } else {
        print('failed to login');
      }
    }).catchError((e) {
      print(e);
      this.isLoggedIn = false;
      this.loginSuccess = false;
      final errorMessage = NetworkException.fromDioError(e).toString();
      errorStore.setErrorMessage(errorMessage);
    });
  }

  // actions:-------------------------------------------------------------------
  @action
  Future register(
    String firstName,
    String lastName,
    String email,
    String userName,
    String password,
    String confirmPassword,
  ) async {
    final future = _repository.register(
      firstName,
      lastName,
      email,
      userName,
      password,
      confirmPassword,
    );
    registerFuture = ObservableFuture(future);
    await future.then((value) async {
      if (value) {
        this.registerSuccess = true;
      } else {
        print('failed to register');
      }
    }).catchError((e) {
      print(e);
      this.registerSuccess = false;
      final errorMessage = NetworkException.fromDioError(e).toString();
      errorStore.setErrorMessage(errorMessage);
    });
  }

  logout() {
    this.isLoggedIn = false;
    _repository.logout();
  }

  Future<UserInfo?> getCurrentUserInfo() async {
    return await _sharedPreferenceHelper.currentUserInfo;
  }

  // general methods:-----------------------------------------------------------
  void dispose() {
    for (final d in _disposers) {
      d();
    }
  }
}
