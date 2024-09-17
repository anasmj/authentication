import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key, this.onLogout});
  final VoidCallback? onLogout;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        actions: [TextButton(onPressed: onLogout, child: const Text('Logout'))],
      ),
      body: Center(
        child: Text('Home', style: Theme.of(context).textTheme.titleLarge),
      ),
    );
  }
}
