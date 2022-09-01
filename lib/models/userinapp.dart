class UserinApp {
  String? uid;
  String? email;
  String? password;

  UserinApp.fromMap(Map map) {
    email = map["email"];
    uid = map["uid"];
    password = map["password"];
  }

  Map<String, dynamic> tomap() {
    Map<String, dynamic> map = {
      "uid": uid,
      "email": email,
      "password": password,
    };
    return map;
  }
}
