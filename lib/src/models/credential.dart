part of '../../authentication.dart';

class Credential {
  String? userName;
  String? email;
  String? password;
  bool? isEmailVerified;
  bool? isPasswordReset;
  Credential({
    this.userName,
    this.email,
    this.password,
    this.isEmailVerified,
    this.isPasswordReset,
  });

  Credential copyWith({
    String? userName,
    String? email,
    String? password,
    bool? isEmailVerified,
    bool? isPasswordReset,
  }) {
    return Credential(
      userName: userName ?? this.userName,
      email: email ?? this.email,
      password: password ?? this.password,
      isEmailVerified: isEmailVerified ?? this.isEmailVerified,
      isPasswordReset: isPasswordReset ?? this.isPasswordReset,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'userName': userName,
      'email': email,
      'password': password,
      'isEmailVerified': isEmailVerified,
      'isPasswordReset': isPasswordReset,
    };
  }

  factory Credential.fromMap(Map<String, dynamic> map) {
    return Credential(
      userName: map['userName'] != null ? map['userName'] as String : null,
      email: map['email'] != null ? map['email'] as String : null,
      password: map['password'] != null ? map['password'] as String : null,
      isEmailVerified: map['isEmailVerified'] != null
          ? map['isEmailVerified'] as bool
          : null,
      isPasswordReset: map['isPasswordReset'] != null
          ? map['isPasswordReset'] as bool
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Credential.fromJson(String source) =>
      Credential.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Credential(userName: $userName, email: $email, password: $password, isEmailVerified: $isEmailVerified, isPasswordReset: $isPasswordReset)';
  }

  @override
  bool operator ==(covariant Credential other) {
    if (identical(this, other)) return true;

    return other.userName == userName &&
        other.email == email &&
        other.password == password &&
        other.isEmailVerified == isEmailVerified &&
        other.isPasswordReset == isPasswordReset;
  }

  @override
  int get hashCode {
    return userName.hashCode ^
        email.hashCode ^
        password.hashCode ^
        isEmailVerified.hashCode ^
        isPasswordReset.hashCode;
  }
}
