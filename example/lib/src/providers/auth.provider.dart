import 'package:authentication/authentication.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final authProvider = AsyncNotifierProvider<AuthNotifier, User?>(
  AuthNotifier.new,
);

class AuthNotifier extends AsyncNotifier<User?> {
  @override
  Future<User?> build() async => null;
  login(Credential c) {
    state = AsyncData(User(
      name: c.userName,
      email: c.email,
      pass: c.password,
    ));
  }

  logout() => state = const AsyncData(null);
}

class User {
  String? name;
  String? email;
  String? pass;
  User({this.name, this.email, this.pass});
}
