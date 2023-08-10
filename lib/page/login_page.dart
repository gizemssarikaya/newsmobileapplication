import 'package:flutter/material.dart';
import 'package:passwordfield/passwordfield.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(
            width: 275,
            height: 45,
            child: TextField(
              style: TextStyle(
                fontSize: 17,
                color: Colors.black,
              ),
              decoration: InputDecoration(
                  prefixIcon: Icon(Icons.person),
                  hintText: "E-mail",
                  labelText: "E-mail",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(4)))),
            ),
          ),
          const Padding(padding: EdgeInsets.only(bottom: 20)),
          SizedBox(
            width: 275,
            height: 45,
            child: PasswordField(
              color: Colors.blue,
              passwordConstraint: r'.*[@$#.*].*',
              hintText: 'must have special characters',
              border: PasswordBorder(
                border: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.blue.shade100,
                  ),
                  borderRadius: BorderRadius.circular(12),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.blue.shade100,
                  ),
                  borderRadius: BorderRadius.circular(12),
                ),
                focusedErrorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(width: 2, color: Colors.red.shade200),
                ),
              ),
              errorMessage: 'must contain special character either . _ - \$',
            ),
          ),
          Padding(padding: EdgeInsets.all(10)),
          Row(
            children: [
              ElevatedButton(onPressed: () {}, child: const Text("Sign in")),
              ElevatedButton(onPressed: () {}, child: const Text("Sign up"))
            ],
          )
        ],
      ),
    ]));
  }
}
