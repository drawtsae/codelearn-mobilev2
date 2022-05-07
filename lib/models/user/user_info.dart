import 'package:simple_json_mapper/simple_json_mapper.dart';

@JsonObject()
class UserInfo {
  String? id;
  String? firstName;
  String? lastName;
  String? email;
  String? phoneNumber;
  String? bio;
  String? profilePicture;
  String? memberType;
  String? memberTier;
  String? gender;
  num? exp;
  String? courseProcess;
  String? additionalFields;
  UserLevel? userLevel;
  List<String>? roles;

  UserInfo(
      {this.id,
      this.firstName,
      this.lastName,
      this.email,
      this.phoneNumber,
      this.bio,
      this.profilePicture,
      this.memberType,
      this.memberTier,
      this.gender,
      this.exp,
      this.courseProcess,
      this.additionalFields,
      this.userLevel,
      this.roles});
}

class UserLevel {
  String? current;
  String? next;
  num? percent;
  String? rank;

  UserLevel({this.current, this.next, this.percent, this.rank});
}
