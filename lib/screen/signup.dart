import 'package:firebaseseries/screen/widgets/button3.dart';
import 'package:flutter/material.dart';
import 'package:firebaseseries/screen/Homescreen.dart';
import 'package:firebaseseries/screen/utils/app_colors.dart';
import 'package:firebaseseries/screen/widgets/button1.dart';

class signup extends StatefulWidget {
  const signup({Key? key}) : super(key: key);

  @override
  State<signup> createState() => _signupState();
}

class _signupState extends State<signup> {
  bool _acceptterms = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: color2,
      appBar: AppBar(
        backgroundColor: color2,
        title: RichText(
          text: TextSpan(children: [
            TextSpan(
                text: "welcome in",
                style: TextStyle(
                    fontSize: 20, fontWeight: FontWeight.w500, color: color1)),
            TextSpan(
              text: " Betano",
              style: TextStyle(fontSize: 27),
            ),
          ]),
        ),
        leading: Padding(
          padding: const EdgeInsets.only(left: 40),
          child: Icon(
            Icons.arrow_back,
            color: color1,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 9),
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
              Text(
                "Create your account",
                style: TextStyle(
                    fontSize: 18, fontWeight: FontWeight.w500, color: color1),
              ),
              SizedBox(height: 20),
              Text(
                "Name",
                style: TextStyle(
                    fontSize: 16, fontWeight: FontWeight.w700, color: color1),
              ),
              SizedBox(height: 10),
              TextFormField(
                decoration: InputDecoration(
                  labelText: "Enter your name",
                  labelStyle: TextStyle(color: Colors.white70),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: color3),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Text(
                "Email",
                style: TextStyle(
                    fontSize: 16, fontWeight: FontWeight.w700, color: color1),
              ),
              SizedBox(height: 10),
              TextFormField(
                decoration: InputDecoration(
                  labelText: "Enter your Email ID",
                  labelStyle: TextStyle(color: Colors.white70),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: color3),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Text(
                "Password",
                style: TextStyle(
                    fontSize: 16, fontWeight: FontWeight.w700, color: color1),
              ),
              SizedBox(height: 10),
              TextFormField(
                obscureText: true,
                decoration: InputDecoration(
                  labelText: "Enter your password",
                  labelStyle: TextStyle(color: Colors.white70),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: color3),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Row(
                children: [
                  Checkbox(
                    value: _acceptterms,
                    onChanged: (value) {
                      setState(() {
                        _acceptterms = value!;
                      });
                    },
                    activeColor: color1,
                    checkColor: Colors.blue,
                  ),
                  Expanded(
                    child: RichText(
                      text: TextSpan(
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
              SizedBox(height: 20),
              CustomButton1(
                width: 353,
                height: 55,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [Icon(Icons.arrow_forward), Text("Sign up")],
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MeditationHomeScreen(),
                    ),
                  );
                },
              ),
              SizedBox(height: 20),
              Center(child: Text("Or", style: TextStyle(color: color1))),
              SizedBox(height: 20),
              CustomButton1(
                width: 353,
                height: 55,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset("assets/mdi_apple.png", height: 24, width: 24),
                    SizedBox(width: 10),
                    Text("Sign up with Apple"),
                  ],
                ),
                onPressed: () {},
              ),
              SizedBox(height: 20),
              Center(
                child: RichText(
                  text: TextSpan(
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
            ],
          ),
        ),
      ),
    );
  }
}
