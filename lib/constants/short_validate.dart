// ignore_for_file: non_constant_identifier_names

import 'package:form_builder_validators/form_builder_validators.dart';

final VALIDATE_REQUIRED = FormBuilderValidators.compose([
  FormBuilderValidators.required(errorText: "Please input this field"),
]);

final VALIDATE_EMAIL = FormBuilderValidators.compose([
  FormBuilderValidators.required(errorText: "Please input this field"),
  FormBuilderValidators.email(errorText: "Please input correct email")
]);
