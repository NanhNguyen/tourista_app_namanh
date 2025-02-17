import 'package:flutter/material.dart';
import 'package:tourista_app/firebase/firebase_authentication.dart';
import 'package:tourista_app/screens/dashboard_screen.dart';
import 'package:tourista_app/screens/sign_up_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailEditController = TextEditingController();
  TextEditingController passWordEditController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back_ios_new_rounded)),
      ),
      body: Padding(
        padding:
            const EdgeInsets.only(top: 20, left: 10, right: 10, bottom: 40),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const Center(
                child: Text(
                  'Sign in now',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 26,
                      color: Color(0xff1B1E28)),
                ),
              ),
              const Center(
                child: Text(
                  "Please sign in to continue our app",
                  style: TextStyle(fontSize: 12, color: Color(0xff7D848D)),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              TextField(
                controller: emailEditController,
                decoration: const InputDecoration(
                    hintText: 'Email',
                    border: InputBorder.none,
                    filled: true,
                    fillColor: Color(0xffF7F7F9)),
              ),
              const SizedBox(height: 25),
              TextField(
                obscureText: true,
                controller: passWordEditController,
                decoration: const InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Password',
                    filled: true,
                    fillColor: Color(0xffF7F7F9)),
              ),
              const SizedBox(
                height: 80,
              ),
              GestureDetector(
                onTap: () async {
                  // bool success = await FirebaseAuthenticationService.signIn(
                  //     emailEditController.text,
                  //     passWordEditController.text,
                  //     context);
                  // if (success) {
                  //   Navigator.pushReplacement(
                  //       context,
                  //       MaterialPageRoute(
                  //         builder: (context) => const DashboardScreen(),
                  //       ));
                  // }
                  await FirebaseAuthenticationService.signIn(
                      emailEditController.text,
                      passWordEditController.text,
                      context);
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const DashboardScreen(),
                      ));
                },
                child: Container(
                  height: 68,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: const Color(0xffFF6421),
                  ),
                  child: const Center(
                    child: Text(
                      'Sign In',
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Don't have an account? ",
                    style: TextStyle(color: Color(0xff707B81), fontSize: 14),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (BuildContext context) => const SignUpScreen(),
                      ));
                    },
                    child: const Text(
                      "Sign up",
                      style: TextStyle(color: Color(0xffFF6421), fontSize: 14),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 100,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 45,
                    width: 45,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(100),
                      child: Image.network(
                        "https://upload.wikimedia.org/wikipedia/commons/thumb/b/b9/2023_Facebook_icon.svg/1024px-2023_Facebook_icon.svg.png",
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  SizedBox(
                    height: 45,
                    width: 45,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(100),
                      child: Image.network(
                        "https://cdn-icons-png.freepik.com/256/15707/15707869.png?semt=ais_hybrid",
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  SizedBox(
                    height: 45,
                    width: 45,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(100),
                      child: Image.network(
                        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRBokEkMMIYLDbhA_J_gFGJKQvprU9q6KlNDw&s",
                        fit: BoxFit.fill,
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
