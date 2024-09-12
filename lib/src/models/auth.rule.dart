part of '../../authentication.dart';

class AuthRule {
  final AuthCallback? onSignUp;
  final VoidCallback? onForgetPassword;
  final bool? showLoginFirst;
  // final void Function(AuthCallback callback)? onSignIn;
  final void Function(Credential credential)? onSignIn;

  final Validator? emailValidator;
  final Validator? passwordValidator;

  final int? passwordLength;
  final bool? isBusy;
  final Future<void>? onSkip;

  const AuthRule({
    this.onSignUp,
    this.onForgetPassword,
    this.showLoginFirst = false,
    this.emailValidator,
    this.passwordValidator,
    this.passwordLength,
    this.isBusy = false,
    this.onSignIn,
    this.onSkip,
  });
}
