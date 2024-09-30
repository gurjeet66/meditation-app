import 'package:firebaseseries/auth/providers.dart';
import 'package:firebaseseries/screen/Homescreen.dart';
import 'package:firebaseseries/auth/signup.dart';
import 'package:firebaseseries/screen/utils/app_colors.dart';
import 'package:firebaseseries/screen/widgets/button1.dart';
import 'package:firebaseseries/screen/widgets/button3.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _slideAnimation;
  bool _acceptterms = false;

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: this,
    );

    _slideAnimation = Tween<Offset>(
      begin: const Offset(0, 1),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    ));

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<SignupProvider>(context, listen: false);

    return Scaffold(
      backgroundColor: color2,
      appBar: AppBar(
        backgroundColor: color2,
        title: const Text(
          "Welcome in Betano",
          style: TextStyle(
              fontSize: 18, color: color1, fontWeight: FontWeight.w500),
        ),
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10), color: Colors.black),
            child: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(
                  Icons.arrow_back,
                  color: Colors.white,
                )),
          ),
        ),
        actions: [
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => MeditationHomeScreen()),
              );
            },
            child: Padding(
              padding: const EdgeInsets.only(right: 10),
              child: Text(
                "Skip",
                style: TextStyle(
                    color: color1, fontWeight: FontWeight.w500, fontSize: 16),
              ),
            ),
          ),
        ],
      ),
      body: SlideTransition(
        position: _slideAnimation,
        child: SingleChildScrollView(
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.only(right: 170),
                child: Text(
                  "Login to your account",
                  style: TextStyle(
                      color: color1, fontWeight: FontWeight.w500, fontSize: 18),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 10, right: 300),
                child: Text(
                  "Email",
                  style: TextStyle(
                      color: color1, fontSize: 16, fontWeight: FontWeight.w700),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: SizedBox(
                  height: 56,
                  width: 353,
                  child: TextFormField(
                    controller: _emailController,
                    decoration: InputDecoration(
                        label: const Text(
                          "Enter your email",
                          style: TextStyle(color: Colors.white70),
                        ),
                        border: OutlineInputBorder(
                          borderSide: const BorderSide(color: color3),
                          borderRadius: BorderRadius.circular(10),
                        )),
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 20, right: 270),
                child: Text(
                  "Password",
                  style: TextStyle(
                      color: color1, fontSize: 16, fontWeight: FontWeight.w700),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: SizedBox(
                  height: 56,
                  width: 353,
                  child: TextFormField(
                    controller: _passwordController,
                    obscureText: true,
                    decoration: InputDecoration(
                        label: const Text(
                          "Enter your password",
                          style: TextStyle(color: Colors.white70),
                        ),
                        border: OutlineInputBorder(
                          borderSide: const BorderSide(color: color3),
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
                          text: const TextSpan(children: [
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
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [Icon(Icons.arrow_forward), Text("Log in")],
                    ),
                    onPressed: () async {
                      // Call the provider to handle login
                      bool success = await authProvider.loginUser(
                          email: _emailController.text,
                          password: _passwordController.text,
                          context: context);

                      if (success) {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => MeditationHomeScreen()),
                        );
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Login failed. Please try again.'),
                          ),
                        );
                      }
                    }),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 20),
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
                      const Text("Login with apple")
                    ]),
                onPressed: () async {
                  bool success = await authProvider.signInWithApple(context);
                  if (success) {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => MeditationHomeScreen()),
                    );
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Apple login failed. Please try again.'),
                      ),
                    );
                  }
                },
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: CustomButton(
                    width: 353,
                    height: 55,
                    child: const Row(
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
                    onPressed: () async {
                      // Call the provider to handle login
                      bool success =
                          await authProvider.signInAnonymously(context);

                      if (success) {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => MeditationHomeScreen()),
                        );
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Login failed. Please try again.'),
                          ),
                        );
                      }
                    }),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Signup()),
                    );
                  },
                  child: RichText(
                      text: const TextSpan(
                    children: [
                      TextSpan(
                        text: "Don't have an account ?",
                      ),
                      TextSpan(
                          text: "Sign up here",
                          style: TextStyle(color: Colors.blue)),
                    ],
                  )),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
