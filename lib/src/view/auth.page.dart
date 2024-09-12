// library authentication;
part of '../../authentication.dart';

class Authentication extends StatelessWidget {
  final AuthRule? authRule;
  const Authentication({super.key, this.authRule});

  @override
  Widget build(BuildContext context) {
    final rule = authRule ?? const AuthRule();
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            if (rule.onSkip != null)
              Positioned(
                top: 10,
                right: 10,
                child: TextButton(
                  onPressed: () async {},
                  child: const Text(
                    'Skip',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () async => Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) {
                        return SignIn(rule: rule);
                      }),
                    ),
                    child: const Text('Login'),
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) {
                        return SignUp(rule: rule);
                      }),
                    ),
                    child: const Text('Registration'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
