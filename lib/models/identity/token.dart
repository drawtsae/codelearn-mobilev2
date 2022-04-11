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

  factory Token.fromMap(Map<String, dynamic> json) => Token(
        id: json["id"],
        userName: json["userName"],
        email: json["email"],
        roles: json["roles"],
        jwToken: json["jwToken"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "userName": userName,
        "email": email,
        "roles": roles,
        "jwToken": jwToken
      };
}
