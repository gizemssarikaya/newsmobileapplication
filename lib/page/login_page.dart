import 'package:dictionary_web/service/auth.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool hidePassword = true;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  AuthService authService = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      decoration: const BoxDecoration(
          gradient: LinearGradient(
              tileMode: TileMode.clamp,
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [Colors.white, Colors.grey])),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: 275,
            height: 45,
            child: TextField(
              controller: emailController,
              style: const TextStyle(
                fontSize: 17,
                color: Colors.black,
              ),
              decoration: const InputDecoration(
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
            child: TextField(
              controller: passwordController,
              style: const TextStyle(
                fontSize: 17,
                color: Colors.black,
              ),
              obscureText: hidePassword,
              decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.key_sharp),
                  suffixIcon: IconButton(
                    icon: hidePassword == true
                        ? const Icon(Icons.visibility_off)
                        : const Icon(Icons.visibility),
                    onPressed: () {
                      setState(() {
                        hidePassword = !hidePassword;
                      });
                    },
                  ),
                  hintText: "Password",
                  labelText: "Password",
                  border: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(4)))),
            ),
          ),
          const Padding(padding: EdgeInsets.all(10)),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.black54),
                ),
                onPressed: () {},
                child: const Text(
                  "Sign in",
                  style: TextStyle(color: Colors.white, fontSize: 15),
                ),
              ),
              Padding(padding: EdgeInsets.all(5)),
              ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.black54),
                  ),
                  onPressed: () {
                    authService
                        .signIn(emailController.text, passwordController.text)
                        .then((value) => print("giriş yapıldı"));
                  },
                  child: const Text(
                    "Sign up",
                    style: TextStyle(color: Colors.white, fontSize: 15),
                  ))
            ],
          )
        ],
      ),
    ));
  }
}
