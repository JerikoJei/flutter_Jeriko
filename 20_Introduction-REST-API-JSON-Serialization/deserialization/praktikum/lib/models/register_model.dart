class RegisterModel {
  final int id;
  final String token;

  RegisterModel({
    required this.id,
    required this.token,
  });

  factory RegisterModel.fromJson(Map<String, dynamic> json) => RegisterModel(
        id: json["id"],
        token: json["token"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "token": token,
      };
}
