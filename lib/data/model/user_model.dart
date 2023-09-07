class User {
  final int id;
  final String firstName;
  final String lastName;
  final DateTime dateOfBirth;
  final String email;
  final String password;
  final String phone;
  final String gender;
  final dynamic image;
  final String loginStatus;

  User({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.dateOfBirth,
    required this.email,
    required this.password,
    required this.phone,
    required this.gender,
    required this.image,
    required this.loginStatus,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        firstName: json["firstName"],
        lastName: json["lastName"],
        dateOfBirth: DateTime.parse(json["dateOfBirth"]),
        email: json["email"],
        password: json["password"],
        phone: json["phone"],
        gender: json["gender"],
        image: json["image"],
        loginStatus: json["loginStatus"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "firstName": firstName,
        "lastName": lastName,
        "dateOfBirth":
            "${dateOfBirth.year.toString().padLeft(4, '0')}-${dateOfBirth.month.toString().padLeft(2, '0')}-${dateOfBirth.day.toString().padLeft(2, '0')}",
        "email": email,
        "password": password,
        "phone": phone,
        "gender": gender,
        "image": image,
        "loginStatus": loginStatus,
      };
}
