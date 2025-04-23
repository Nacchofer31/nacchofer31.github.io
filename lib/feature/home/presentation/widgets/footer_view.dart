import 'package:flutter/material.dart';

class FooterView extends StatelessWidget {
  const FooterView({super.key});

  @override
  Widget build(BuildContext context) => const Padding(
        padding: EdgeInsets.only(top: 10),
        child: Center(
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 24.0),
            child: Text(
              'Powered by ☕ using Flutter\n© 2025 Ignacio Ferrer',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey,
              ),
            ),
          ),
        ),
      );
}
