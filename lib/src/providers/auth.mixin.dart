import 'package:authentication/authentication.dart';
import 'package:authentication/src/utils.dart/regex.dart';

typedef Validator = String? Function(String?)?;

// typedef AuthCallback = Credential Function(Credential credential);

// Example
// void onSingInWithCred(void Function(Credential credential) callback) {
//   final user = Credential(userName: 'test', email: 'test', password: 'test');
//   callback(user);
// }

typedef AuthCallback = Future<void> Function(Credential credential);

mixin AuthMixin {
  Validator get defaultEmailValidator => (String? value) {
        if (value == null || value.isEmpty) {
          return "Please enter email.";
        } else if (!(emailRegx.hasMatch(value))) {
          return "Invalid email";
        }
        return null;
      };

  Validator defaultPasswordValidator({int? length}) {
    return (String? value) {
      if (value == null || value.isEmpty) {
        return "Please enter password.";
      }
      if (length != null && value.length < length) {
        return "Password must be at least $length character.";
      }
      return null;
    };
  }

  Validator matchingPassword(String prevPassword) => (String? value) {
        if (value == null || value.isEmpty) {
          return "Please enter password.";
        } else if (value != prevPassword) {
          return "Password doesn't match.";
        }
        return null;
      };
}
