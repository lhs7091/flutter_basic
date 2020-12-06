import 'package:flutter/material.dart';

class SignInScreen extends StatelessWidget {
  static const String routeName = '/sign-in-page';

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text(
          'Sign In',
          style: TextStyle(
            fontSize: 26,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 10),
        TextField(
          decoration: const InputDecoration(
            icon: Icon(Icons.email),
            hintText: 'Email',
          ),
          autocorrect: false,
          keyboardType: TextInputType.emailAddress,
        ),
        const SizedBox(height: 10),
        TextField(
          decoration: const InputDecoration(
            icon: Icon(Icons.lock_outline),
            hintText: 'Password',
          ),
          autocorrect: false,
          obscureText: true,
        ),
        const SizedBox(height: 50),
        FlatButton(
          color: Colors.indigo.shade700,
          onPressed: () {},
          child: Text('Sign In'),
        ),
      ],
    );
  }
}
