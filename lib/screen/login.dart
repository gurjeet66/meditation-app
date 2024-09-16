import 'package:firebaseseries/screen/signup.dart';
import 'package:firebaseseries/screen/utils/app_colors.dart';
import 'package:firebaseseries/screen/widgets/button1.dart';
import 'package:firebaseseries/screen/widgets/button3.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _slideAnimation;
  bool _acceptterms = false;

  @override
  void initState() {
    super.initState();

    // Initialize the animation controller
    _controller = AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: this,
    );

    // Define the animation
    _slideAnimation = Tween<Offset>(
      begin: const Offset(0, 1), // Start from off-screen bottom
      end: Offset.zero, // End at its original position
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    ));

    // Start the animation when the screen is shown
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: color2, // Original background color
      appBar: AppBar(
        backgroundColor: color2, // Original app bar background color
        title: Text(
          "Welcome in Betano",
          style: TextStyle(
              fontSize: 18, color: color1, fontWeight: FontWeight.w500),
        ),
        leading: Padding(
          padding: const EdgeInsets.only(left: 25),
          child: Icon(
            Icons.arrow_back,
            color: color1,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: Text(
              "Skip",
              style: TextStyle(
                  color: color1, fontWeight: FontWeight.w500, fontSize: 16),
            ),
          )
        ],
      ),
      body: SlideTransition(
        position: _slideAnimation,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 170),
                child: Text(
                  "Login to your account",
                  style: TextStyle(
                      color: color1, fontWeight: FontWeight.w500, fontSize: 18),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10, right: 300),
                child: Text(
                  "Name",
                  style: TextStyle(
                      color: color1, fontSize: 16, fontWeight: FontWeight.w700),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Container(
                  height: 56,
                  width: 353,
                  child: TextFormField(
                    decoration: InputDecoration(
                        label: Text(
                          "Enter your name",
                          style: TextStyle(color: Colors.white70),
                        ),
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: color3),
                          borderRadius: BorderRadius.circular(10),
                        )),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20, right: 270),
                child: Text(
                  "Password",
                  style: TextStyle(
                      color: color1, fontSize: 16, fontWeight: FontWeight.w700),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Container(
                  height: 56,
                  width: 353,
                  child: TextFormField(
                    decoration: InputDecoration(
                        label: Text(
                          "Enter your password",
                          style: TextStyle(color: Colors.white70),
                        ),
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: color3),
                          borderRadius: BorderRadius.circular(10),
                        )),
                  ),
                ),
              ),
              Row(
                children: [
                  Checkbox(
                    value: _acceptterms,
                    onChanged: (value) {
                      setState(() {
                        _acceptterms = value!;
                      });
                    },
                    activeColor: color10,
                    checkColor: Colors.blue,
                  ),
                  Expanded(
                      child: RichText(
                          text: TextSpan(children: [
                    TextSpan(
                      text: "By continuing you accept the ",
                      style: TextStyle(color: color1),
                    ),
                    TextSpan(
                        text: "Terms & conditions",
                        style: TextStyle(color: Colors.blue))
                  ]))),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: CustomButton1(
                    width: 353,
                    height: 55,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [Icon(Icons.arrow_forward), Text("Log in")],
                    ),
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => signup()));
                    }),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Text(
                  "Or",
                  style: TextStyle(
                      color: color1, fontSize: 16, fontWeight: FontWeight.w700),
                ),
              ),
              CustomButton1(
                  width: 353,
                  height: 55,
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset("assets/mdi_apple.png"),
                        Text("Login with apple")
                      ]),
                  onPressed: () {}),
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: CustomButton(
                    width: 353,
                    height: 55,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Center(
                            child: Center(child: Text("Continue as a guest "))),
                        Icon(
                          Icons.arrow_forward,
                          color: color5,
                        )
                      ],
                    ),
                    onPressed: () {}),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: RichText(
                    text: TextSpan(
                  children: [
                    TextSpan(
                      text: "Don't have an account ?",
                    ),
                    TextSpan(
                        text: "Sign up here",
                        style: TextStyle(color: Colors.blue))
                  ],
                )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
