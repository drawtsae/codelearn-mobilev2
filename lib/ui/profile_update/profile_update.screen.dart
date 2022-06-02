import 'dart:io';
import 'dart:typed_data';
import 'package:boilerplate/ui/profile_update/profile_update.constants.dart';
import 'package:cool_alert/cool_alert.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter/material.dart';
import 'package:form_builder_image_picker/form_builder_image_picker.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:provider/provider.dart';

import '../../widgets/empty_app_bar_widget.dart';
import '../../stores/user/user_store.dart';
import '../../constants/style.dart';

class ProfileUpdateScreen extends StatefulWidget {
  const ProfileUpdateScreen({Key? key}) : super(key: key);

  @override
  State<ProfileUpdateScreen> createState() => _ProfileUpdateScreenState();
}

class _ProfileUpdateScreenState extends State<ProfileUpdateScreen> {
  late UserStore _userStore;
  final GlobalKey<FormBuilderState> _formKey = GlobalKey<FormBuilderState>();

  // handler
  void onSubmitProfile(GlobalKey<FormBuilderState> formKey) async {
    if (formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      String firstName = _formKey.currentState!.value["firstName"];
      String lastName = _formKey.currentState!.value["lastName"];
      String gender = _formKey.currentState!.value["gender"];
      String phoneNumber = _formKey.currentState!.value["phoneNumber"];

      await _userStore.updateProfile(firstName, lastName, gender, phoneNumber);
      Navigator.of(context).pop();
      CoolAlert.show(
        context: context,
        type: CoolAlertType.success,
        text: "Update profile successfully!",
      );
    }
  }

  // handler
  void onGetUserProfile() async {
    final user = await _userStore.getCurrentUserInfo();
    _formKey.currentState!.fields['firstName']?.didChange(user?.firstName);
    _formKey.currentState!.fields['lastName']?.didChange(user?.lastName);
    _formKey.currentState!.fields['email']?.didChange(user?.email);
    _formKey.currentState!.fields['gender']?.didChange(user?.gender);
    _formKey.currentState!.fields['phoneNumber']?.didChange(user?.phoneNumber);
    _formKey.currentState!.fields['profilePicture']
        ?.didChange([user?.profilePicture]);
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _userStore = Provider.of<UserStore>(context);
    onGetUserProfile();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: EmptyAppBar(),
        body: SingleChildScrollView(
            child: Padding(
          padding: PADDING_CONTENT_STYLES,
          child: Column(children: <Widget>[
            Text(
              'Update Profile',
              style: TITLE_STYLES,
            ),
            FormBuilder(
                key: _formKey,
                child: Column(
                  children: [
                    FormBuilderImagePicker(
                      name: 'profilePicture',
                      maxImages: 1,
                    ),
                    FormBuilderTextField(
                      name: 'firstName',
                      decoration: const InputDecoration(
                        labelText: 'First Name',
                      ),
                      validator: FormBuilderValidators.compose([
                        FormBuilderValidators.required(
                            errorText: "Please input this field"),
                      ]),
                    ),
                    FormBuilderTextField(
                      name: 'lastName',
                      decoration: const InputDecoration(
                        labelText: 'Last Name',
                      ),
                      validator: FormBuilderValidators.compose([
                        FormBuilderValidators.required(
                            errorText: "Please input this field"),
                      ]),
                    ),
                    FormBuilderTextField(
                      name: 'email',
                      readOnly: true,
                      decoration: const InputDecoration(
                        labelText: 'Email',
                      ),
                      validator: FormBuilderValidators.compose([
                        FormBuilderValidators.required(
                            errorText: "Please input this field"),
                        FormBuilderValidators.email(
                            errorText: "Please input correct email")
                      ]),
                    ),
                    FormBuilderTextField(
                      name: 'phoneNumber',
                      readOnly: true,
                      decoration: const InputDecoration(
                        labelText: 'Phone',
                      ),
                      validator: FormBuilderValidators.compose([
                        FormBuilderValidators.required(
                            errorText: "Please input this field"),
                      ]),
                    ),
                    FormBuilderDropdown(
                      name: 'gender',
                      decoration: InputDecoration(
                        labelText: 'Gender',
                      ),
                      hint: Text('-- Click to select'),
                      validator: FormBuilderValidators.compose([
                        FormBuilderValidators.required(
                            errorText: "Please input this field")
                      ]),
                      items: GENDERS
                          .map((gender) => DropdownMenuItem(
                                value: gender,
                                child: Text('$gender'),
                              ))
                          .toList(),
                    ),
                    const SizedBox(height: 15),
                    Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: Row(
                        children: <Widget>[
                          Expanded(
                            child: MaterialButton(
                                color: Theme.of(context).colorScheme.secondary,
                                child: const Text(
                                  "Submit",
                                  style: TextStyle(color: Colors.white),
                                ),
                                onPressed: () => onSubmitProfile(_formKey)),
                          ),
                        ],
                      ),
                    ),
                  ],
                ))
          ]),
        )));
  }
}
