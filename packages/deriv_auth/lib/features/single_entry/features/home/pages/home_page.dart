import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Deriv Auth UI'),
      ),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Deriv Auth UI',
              style: TextStyle(fontSize: 24),
            ),
            SizedBox(height: 16),
            Text(
              'Deriv Auth UI is a Flutter package that provides a set of ready-to-use widgets for building authentication flows in your app.',
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
