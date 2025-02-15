import 'package:flutter/material.dart';
import 'package:tourista_app/firebase/firebase_authentication.dart';
import 'package:tourista_app/screens/dashboard_screen.dart';
import 'package:tourista_app/screens/login_screen.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController confirmPasswordEditController = TextEditingController();
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
        padding: const EdgeInsets.only(
          top: 20,
          left: 10,
          right: 10,
        ),
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
                    filled: true,
                    fillColor: Color(0xffF7F7F9),
                    hintText: 'Password'),
              ),
              const SizedBox(
                height: 13,
              ),
              TextField(
                obscureText: true,
                controller: confirmPasswordEditController,
                decoration: const InputDecoration(
                    border: InputBorder.none,
                    filled: true,
                    fillColor: Color(0xffF7F7F9),
                    hintText: 'Confirm Password'),
              ),
              const SizedBox(
                height: 13,
              ),
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Password must be 8 characters",
                  style: TextStyle(color: Color(0xff7D848D), fontSize: 12),
                ),
              ),
              const SizedBox(
                height: 80,
              ),
              GestureDetector(
                onTap: () async {
                  bool createAcc =
                      await FirebaseAuthenticationService.createAccount(
                          emailEditController.text,
                          passWordEditController.text,
                          confirmPasswordEditController.text,
                          context);

                  await FirebaseAuthenticationService.createAccount(
                      emailEditController.text,
                      passWordEditController.text,
                      confirmPasswordEditController.text,
                      context);
                  if (createAcc) {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const DashboardScreen(),
                        ));
                  }
                },
                child: Container(
                  height: 68,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: const Color(0xffFF6421),
                  ),
                  child: const Center(
                    child: Text(
                      'Sign Up',
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
                    "Already have an account? ",
                    style: TextStyle(color: Color(0xff707B81), fontSize: 14),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: const Text(
                      "Sign in",
                      style: TextStyle(color: Color(0xffFF6421), fontSize: 14),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 50,
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
                        "https://cdn.pixabay.com/photo/2021/06/15/12/51/facebook-6338507_1280.png",
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
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              )
            ],
          ),
        ),
      ),
    );
  }
}
