import 'package:authentication/authentication.dart';
import 'package:example/src/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'providers/auth.provider.dart';

class AuthWrapper extends ConsumerWidget {
  const AuthWrapper({super.key});

  @override
  Widget build(BuildContext context, ref) {
    return ref.watch(authProvider).when(
          data: (user) {
            return user != null
                ? Home(onLogout: () =>  ref.read(authProvider.notifier).logout())
                : const AuthPage();
          },
          error: (e, s) => const SizedBox(),
          loading: () => const SizedBox(),
        );
  }
}

class AuthPage extends ConsumerWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final authNotifier = ref.read(authProvider.notifier);
    return Authentication(
      authRule: AuthRule(
        onSignIn: (credential) {
          authNotifier.login(credential);
        },
      ),
    );
  }
}
