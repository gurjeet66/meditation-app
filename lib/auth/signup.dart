import 'package:firebaseseries/auth/providers.dart';
import 'package:flutter/material.dart';

import 'package:firebaseseries/screen/widgets/button3.dart';
import 'package:provider/provider.dart';
import 'package:firebaseseries/screen/utils/app_colors.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  bool _acceptTerms = false;
  final _name = TextEditingController();
  final _email = TextEditingController();
  final _password = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _name.dispose();
    _email.dispose();
    _password.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: color2,
      appBar: AppBar(
        backgroundColor: color2,
        title: RichText(
          text: const TextSpan(children: [
            TextSpan(
                text: "Welcome to",
                style: TextStyle(
                    fontSize: 20, fontWeight: FontWeight.w500, color: color1)),
            TextSpan(
              text: " Betano",
              style: TextStyle(fontSize: 27),
            ),
          ]),
        ),
        leading: const Padding(
          padding: EdgeInsets.only(left: 40),
          child: Icon(
            Icons.arrow_back,
            color: color1,
          ),
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 9),
            child: Text("Skip",
                style: TextStyle(
                    fontSize: 16, fontWeight: FontWeight.w500, color: color1)),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Create your account",
                style: TextStyle(
                    fontSize: 18, fontWeight: FontWeight.w500, color: color1),
              ),
              const SizedBox(height: 20),
              const Text(
                "Name",
                style: TextStyle(
                    fontSize: 16, fontWeight: FontWeight.w700, color: color1),
              ),
              const SizedBox(height: 10),
              TextFormField(
                controller: _name,
                decoration: InputDecoration(
                  labelText: "Enter your name",
                  labelStyle: const TextStyle(color: Colors.white70),
                  border: OutlineInputBorder(
                    borderSide: const BorderSide(color: color3),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                "Email",
                style: TextStyle(
                    fontSize: 16, fontWeight: FontWeight.w700, color: color1),
              ),
              const SizedBox(height: 10),
              TextFormField(
                controller: _email,
                decoration: InputDecoration(
                  labelText: "Enter your Email ID",
                  labelStyle: const TextStyle(color: Colors.white70),
                  border: OutlineInputBorder(
                    borderSide: const BorderSide(color: color3),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                "Password",
                style: TextStyle(
                    fontSize: 16, fontWeight: FontWeight.w700, color: color1),
              ),
              const SizedBox(height: 10),
              TextFormField(
                controller: _password,
                obscureText: true,
                decoration: InputDecoration(
                  labelText: "Enter your password",
                  labelStyle: const TextStyle(color: Colors.white70),
                  border: OutlineInputBorder(
                    borderSide: const BorderSide(color: color3),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  Checkbox(
                    value: _acceptTerms,
                    onChanged: (value) {
                      setState(() {
                        _acceptTerms = value!;
                      });
                    },
                    activeColor: color1,
                    checkColor: Colors.blue,
                  ),
                  Expanded(
                    child: RichText(
                      text: const TextSpan(
                        children: [
                          TextSpan(
                            text: "By continuing you accept the ",
                            style: TextStyle(color: color1),
                          ),
                          TextSpan(
                            text: "Terms & conditions",
                            style: TextStyle(color: Colors.blue),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              CustomButton1(
                width: 353,
                height: 55,
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [Icon(Icons.arrow_forward), Text("Sign up")],
                ),
                onPressed: () {
                  _signup(context);
                },
              ),
              const SizedBox(height: 20),
              const Center(child: Text("Or", style: TextStyle(color: color1))),
              const SizedBox(height: 20),
              Center(
                child: GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, '/login');
                  },
                  child: RichText(
                    text: const TextSpan(
                      children: [
                        TextSpan(
                          text: "Already have an account? ",
                          style: TextStyle(color: color1),
                        ),
                        TextSpan(
                          text: "Sign in here",
                          style: TextStyle(color: Colors.blue),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _signup(BuildContext context) {
    if (!_acceptTerms) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Please accept terms and conditions")),
      );
      return;
    }

    // Access SignupProvider to handle the signup process
    Provider.of<SignupProvider>(context, listen: false).signUp(
      name: _name.text,
      email: _email.text,
      password: _password.text,
      context: context,
    );
  }
}
