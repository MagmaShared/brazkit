import 'dart:convert';

import 'package:brazkit/src/utils/prefskit.dart';

class ResponseUser {
  static const USER_PREFS = "user.prefs";

  final String uid;
  final String displayName;
  final String name;
  final String lastName;
  final String photoUrl;
  final String login;
  final String email;
  final String phoneNumber;

  @override
  String toString() {
    return displayName;
  }

  ResponseUser(
        this.uid,
        this.displayName,
        this.name,
        this.lastName,
        this.photoUrl,
        this.login,
        this.email,
        this.phoneNumber
      );

  ResponseUser.fromJson(Map<String, dynamic> map)
      : this.login = map['login'],
        this.email = map['email'],
        this.name = map['name'],
        this.uid = map['uid'],
        this.displayName = map['displayName'],
        this.lastName = map['lastName'],
        this.photoUrl = map['photoUrl'],
        this.phoneNumber = map['phoneNumber'];

  void save() {
    final map = {"name": name, "login": login, "email": email, "uid": uid, "displayName": displayName, "lastName": lastName, "photoUrl": photoUrl, "phoneNumber": phoneNumber};
    PrefsKit.set(USER_PREFS, json.encode(map).toString());
  }

  static Future<ResponseUser> get() async {
    String s = await PrefsKit.getString(USER_PREFS);
    if (s == null || s.isEmpty) {
      return null;
    }
    final user = ResponseUser.fromJson(json.decode(s));
    return user;
  }

  static clear() {
    PrefsKit.set(USER_PREFS, "");
  }
}
