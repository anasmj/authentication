import 'package:authentication/authentication.dart';
import 'package:authentication/src/extensions/extensions.dart';
import 'package:authentication/src/view/sign.up.dart';
import 'package:authentication/src/view/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers/auth.mixin.dart';

class SignIn extends StatefulWidget {
  final AuthRule? rule;

  const SignIn({super.key, this.rule});

  @override
  State<SignIn> createState() => _LoginState();
}

class _LoginState extends State<SignIn> with AuthMixin {
  final GlobalKey<FormState> _formKey = GlobalKey();

  final FocusNode _focusNodePassword = FocusNode();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  bool _obscurePassword = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.transparent),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            children: [
              const SizedBox(height: 150),
              Text(
                "Welcome back",
                style: context.text.headlineLarge,
              ),
              const SizedBox(height: 10),
              Text(
                "SignIn to your account",
                style: context.text.bodyMedium,
              ),
              const SizedBox(height: 60),
              TextFormField(
                controller: _emailController,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  labelText: "Email",
                  prefixIcon: const Icon(Icons.email),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                onEditingComplete: () => _focusNodePassword.requestFocus(),
                validator: widget.rule?.emailValidator ?? defaultEmailValidator,
              ),
              const SizedBox(height: 10),
              TextFormField(
                controller: _passwordController,
                focusNode: _focusNodePassword,
                obscureText: _obscurePassword,
                keyboardType: TextInputType.visiblePassword,
                decoration: InputDecoration(
                  labelText: "Password",
                  prefixIcon: const Icon(Icons.password_outlined),
                  suffixIcon: IconButton(
                    onPressed: () => setState(() {
                      _obscurePassword = !_obscurePassword;
                    }),
                    icon: _obscurePassword
                        ? const Icon(Icons.visibility_outlined)
                        : const Icon(Icons.visibility_off_outlined),
                  ),
                  border: defaultBorder,
                  enabledBorder: defaultBorder,
                ),
                validator: widget.rule?.passwordValidator ??
                    defaultPasswordValidator(),
              ),
              const SizedBox(height: 60),
              Column(
                children: [
                  Consumer(builder: (context, ref, child) {
                    return ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        minimumSize: const Size.fromHeight(50),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      onPressed: () async {
                        if (!_formKey.currentState!.validate()) return;
                        // widget.onSignIn?.call();

                        final credential = Credential(
                          email: _emailController.text,
                          password: _passwordController.text,
                        );
                        widget.rule?.onSignIn?.call(credential);
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          if (widget.rule?.isBusy ?? false) ...[
                            const CircularProgressIndicator(),
                            const SizedBox(height: 10)
                          ],
                          const Text("SignIn"),
                        ],
                      ),
                    );
                  }),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("Don't have an account?"),
                      Consumer(builder: (context, ref, _) {
                        return TextButton(
                          onPressed: () {
                            _formKey.currentState?.reset();
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => SignUp(rule: widget.rule),
                              ),
                            );
                            // ref
                            //     .read(authTypePProvider.notifier)
                            //     .toggleAuthType(AuthType.signUp);
                          },
                          child: const Text("Signup"),
                        );
                      }),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _focusNodePassword.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
}
