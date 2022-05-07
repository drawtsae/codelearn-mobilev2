import 'package:simple_json_mapper/simple_json_mapper.dart';

@JsonObject()
class Token {
  String? id;
  String? userName;
  String? email;
  List<String>? roles;
  String? jwToken;

  Token({
    this.id,
    this.userName,
    this.email,
    this.jwToken,
    this.roles,
  });
}
