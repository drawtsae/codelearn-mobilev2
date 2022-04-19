import 'package:another_flushbar/flushbar_helper.dart';
import 'package:boilerplate/data/sharedpref/constants/preferences.dart';
import 'package:boilerplate/stores/form/form_store.dart';
import 'package:boilerplate/stores/user/user_store.dart';
import 'package:boilerplate/utils/device/device_utils.dart';
import 'package:boilerplate/utils/routes/routes.dart';
import 'package:boilerplate/widgets/empty_app_bar_widget.dart';
import 'package:boilerplate/widgets/progress_indicator_widget.dart';
import 'package:boilerplate/widgets/rounded_button_widget.dart';
import 'package:boilerplate/widgets/textfield_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:fluttericon/font_awesome5_icons.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreen createState() => _RegisterScreen();
}

class _RegisterScreen extends State<RegisterScreen> {
  //text controllers:-----------------------------------------------------------
  TextEditingController _userFirstNameController = TextEditingController();
  TextEditingController _userLastNameController = TextEditingController();
  TextEditingController _userEmailController = TextEditingController();
  TextEditingController _userUserNameController = TextEditingController();
  TextEditingController _userPasswordController = TextEditingController();
  TextEditingController _userConfirmPasswordController =
      TextEditingController();

  //stores:---------------------------------------------------------------------
  late UserStore _userStore;
  //focus node:-----------------------------------------------------------------
  late FocusNode _passwordFocusNode;

  //stores:---------------------------------------------------------------------
  final _store = FormStore();
  @override
  void initState() {
    super.initState();
    _passwordFocusNode = FocusNode();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _userStore = Provider.of<UserStore>(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      primary: true,
      appBar: EmptyAppBar(),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return Material(
      child: Stack(
        children: [
          Center(child: _registerForm()),
          Observer(
            builder: (context) {
              return _userStore.registerSuccess
                  ? navigate(context)
                  : _showErrorMessage(_userStore.errorStore.errorMessage);
            },
          ),
          Observer(
            builder: (context) {
              return Visibility(
                visible: _userStore.isRegisterLoading,
                child: CustomProgressIndicatorWidget(),
              );
            },
          )
        ],
      ),
    );
  }

  Widget _registerForm() {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Center(
              child: Text(
                'TRTEAM',
                style: TextStyle(fontSize: 60, fontWeight: FontWeight.bold),
              ),
            ),
            Text(
              'Register',
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 12.0),
            _firstNameInput(),
            _lastNameInput(),
            _emailInput(),
            _userNameInput(),
            _passwordInput(),
            _confirmPasswordInput(),
            _buildSignUpButton(),
            Align(
              alignment: Alignment.center,
              heightFactor: 4,
              child: Text('Or, login with...'),
            ),
            _socialButtonWidget(context),
            SizedBox(height: 24.0),
            _checkHaveAnAccountWidget(context)
          ],
        ),
      ),
    );
  }

  Widget _firstNameInput() {
    return Observer(
      builder: (context) {
        return TextFieldWidget(
          hint: 'First Name',
          inputType: TextInputType.text,
          padding: EdgeInsets.only(top: 8.0),
          icon: Icons.person,
          iconColor: Colors.black,
          textController: _userFirstNameController,
          inputAction: TextInputAction.next,
          autoFocus: false,
          onChanged: (value) {
            _store.setFirstName(_userFirstNameController.text);
          },
          onFieldSubmitted: (value) {
            FocusScope.of(context).requestFocus(_passwordFocusNode);
          },
          errorText: _store.formErrorStore.firstName,
        );
      },
    );
  }

  Widget _lastNameInput() {
    return Observer(
      builder: (context) {
        return TextFieldWidget(
          hint: 'Last Name',
          inputType: TextInputType.text,
          padding: EdgeInsets.only(top: 8.0),
          icon: Icons.person,
          iconColor: Colors.black,
          textController: _userLastNameController,
          inputAction: TextInputAction.next,
          autoFocus: false,
          onChanged: (value) {
            _store.setLastName(_userLastNameController.text);
          },
          onFieldSubmitted: (value) {
            FocusScope.of(context).requestFocus(_passwordFocusNode);
          },
          errorText: _store.formErrorStore.lastName,
        );
      },
    );
  }

  Widget _emailInput() {
    return Observer(
      builder: (context) {
        return TextFieldWidget(
          hint: 'Email',
          inputType: TextInputType.emailAddress,
          padding: EdgeInsets.only(top: 8.0),
          icon: Icons.email,
          iconColor: Colors.black,
          textController: _userEmailController,
          inputAction: TextInputAction.next,
          autoFocus: false,
          onChanged: (value) {
            _store.setEmailId(_userEmailController.text);
          },
          onFieldSubmitted: (value) {
            FocusScope.of(context).requestFocus(_passwordFocusNode);
          },
          errorText: _store.formErrorStore.userEmail,
        );
      },
    );
  }

  Widget _userNameInput() {
    return Observer(
      builder: (context) {
        return TextFieldWidget(
          hint: 'Username',
          inputType: TextInputType.text,
          padding: EdgeInsets.only(top: 8.0),
          icon: Icons.account_box,
          iconColor: Colors.black,
          textController: _userUserNameController,
          inputAction: TextInputAction.next,
          autoFocus: false,
          onChanged: (value) {
            _store.setUserId(_userUserNameController.text);
          },
          onFieldSubmitted: (value) {
            FocusScope.of(context).requestFocus(_passwordFocusNode);
          },
          errorText: _store.formErrorStore.userName,
        );
      },
    );
  }

  Widget _passwordInput() {
    return Observer(
      builder: (context) {
        return TextFieldWidget(
          hint: 'Password',
          isObscure: true,
          padding: EdgeInsets.only(top: 8.0),
          icon: Icons.vpn_key,
          iconColor: Colors.black,
          textController: _userPasswordController,
          autoFocus: false,
          errorText: _store.formErrorStore.password,
          onChanged: (value) {
            _store.setPassword(_userPasswordController.text);
          },
        );
      },
    );
  }

  Widget _confirmPasswordInput() {
    return Observer(
      builder: (context) {
        return TextFieldWidget(
          hint: 'Confirm Password',
          isObscure: true,
          padding: EdgeInsets.only(top: 8.0),
          icon: Icons.lock,
          iconColor: Colors.black,
          textController: _userConfirmPasswordController,
          autoFocus: false,
          errorText: _store.formErrorStore.confirmPassword,
          onChanged: (value) {
            _store.setConfirmPassword(_userConfirmPasswordController.text);
          },
          onFieldSubmitted: (value) {
            FocusScope.of(context).requestFocus(_passwordFocusNode);
          },
        );
      },
    );
  }

  Widget _socialButtonWidget(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        TextButton(
          onPressed: () {},
          child: Icon(FontAwesome5.facebook),
          style: ButtonStyle(
            side: MaterialStateProperty.all(
              BorderSide(
                  color: Colors.orangeAccent,
                  width: 1.0,
                  style: BorderStyle.solid),
            ),
          ),
        ),
        TextButton(
          onPressed: () {},
          child: Icon(FontAwesome5.google),
          style: ButtonStyle(
            side: MaterialStateProperty.all(
              BorderSide(
                  color: Colors.orangeAccent,
                  width: 1.0,
                  style: BorderStyle.solid),
            ),
          ),
        ),
        TextButton(
          onPressed: () {},
          child: Icon(FontAwesome5.github),
          style: ButtonStyle(
            side: MaterialStateProperty.all(
              BorderSide(
                  color: Color.fromARGB(255, 255, 171, 64),
                  width: 1.0,
                  style: BorderStyle.solid),
            ),
          ),
        ),
      ],
    );
  }

  Widget _checkHaveAnAccountWidget(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          "Have an account? ",
          style: TextStyle(
            fontSize: 12,
          ),
        ),
        GestureDetector(
          onTap: () {
            Future.delayed(Duration(milliseconds: 0), () {
              Navigator.of(context).pushNamedAndRemoveUntil(
                  Routes.login, ModalRoute.withName(Routes.home));
            });
          },
          child: Text(
            'Login',
            style: TextStyle(
                color: Color.fromARGB(255, 255, 171, 64),
                fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }

  Widget _buildSignUpButton() {
    return RoundedButtonWidget(
      buttonText: "Register",
      buttonColor: Colors.orangeAccent,
      textColor: Colors.white,
      onPressed: () async {
        if (_store.canRegister) {
          DeviceUtils.hideKeyboard(context);
          _userStore.register(
            _userFirstNameController.text,
            _userLastNameController.text,
            _userEmailController.text,
            _userUserNameController.text,
            _userPasswordController.text,
            _userConfirmPasswordController.text,
          );
        } else {
          _showErrorMessage('Please fill in all fields');
        }
      },
    );
  }

  // General Methods:-----------------------------------------------------------
  _showErrorMessage(String message) {
    if (message.isNotEmpty) {
      Future.delayed(Duration(milliseconds: 0), () {
        if (message.isNotEmpty) {
          FlushbarHelper.createError(
            message: message,
            title: "Register",
            duration: Duration(seconds: 3),
          )..show(context);
        }
      });
    }

    return SizedBox.shrink();
  }

  Widget navigate(BuildContext context) {
    Future.delayed(Duration(milliseconds: 0), () {
      Navigator.of(context).pushNamedAndRemoveUntil(
          Routes.confirmmail, (Route<dynamic> route) => false);
    });

    return Container();
  }

  // dispose:-------------------------------------------------------------------
  @override
  void dispose() {
    // Clean up the controller when the Widget is removed from the Widget tree
    _userEmailController.dispose();
    _userFirstNameController.dispose();
    _passwordFocusNode.dispose();
    _userLastNameController.dispose();
    _userUserNameController.dispose();
    _userPasswordController.dispose();
    _userConfirmPasswordController.dispose();
    super.dispose();
  }
}
