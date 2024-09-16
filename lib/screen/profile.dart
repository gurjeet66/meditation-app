import 'package:firebaseseries/screen/login.dart';
import 'package:firebaseseries/screen/utils/app_colors.dart';
import 'package:firebaseseries/screen/widgets/button3.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          // Wrap the content with SingleChildScrollView
          child: Column(
            children: [
              Row(children: [
                _buildProfile(),
                SizedBox(
                  width: 20,
                ),
                _buildUserInfo(),
              ]),
              _buildMeditationStats(),
              _buildAchievements(),
              SizedBox(height: 20), // Add some spacing before the button
              CustomButton1(
                height: 54,
                width: 324,
                child: Row(
                  mainAxisAlignment:
                      MainAxisAlignment.center, // Center the text and icon
                  children: [
                    Icon(
                      Icons.arrow_back,
                      color: color1,
                    ),
                    SizedBox(width: 10),
                    Text(
                      "Log out",
                      style: TextStyle(fontSize: 16, color: color1),
                    ),
                  ],
                ),
                onPressed: () {
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => Login()));
                },
              ),
              SizedBox(height: 20), // Add spacing to prevent overflow
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildProfile() {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: Container(
        height: 300,
        width: 190,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 70),
              child: Text(
                "Profile",
                style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.w600,
                    color: Color(0xff1C1B1F)),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Container(
                  width: 90,
                  height: 90,
                  child: Image.asset("assets/User image.png")),
            ),
            Text(
              "John Doe",
              style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w700,
                  color: Color(0xff2C3E50)),
            )
          ],
        ),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xffFFFFFF),
              Color(0xff2C3E50), // Light blue
            ],
          ),
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(100),
            bottomRight: Radius.circular(100),
          ),
        ),
      ),
    );
  }

  Widget _buildUserInfo() {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 20, left: 130),
          child: Text(
            "Edit",
            style: TextStyle(
                fontSize: 16, fontWeight: FontWeight.w300, color: color2),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 30),
          child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'User Name:',
                  style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey,
                      fontWeight: FontWeight.w400),
                ),
                Text(
                  'John Doe',
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 8),
                Text(
                  'Preferred Sports:',
                  style: TextStyle(fontSize: 16, color: Colors.grey),
                ),
                Text(
                  '• Tennis\n• Soccer\n• Running',
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                      fontWeight: FontWeight.w500),
                ),
                SizedBox(height: 8),
                Text(
                  'Email:',
                  style: TextStyle(fontSize: 16, color: Colors.grey),
                ),
                Text('Johndoe@gmail.com'),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildMeditationStats() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Meditation Stats',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 8),
          _buildStatItem(
              label: "Total Sessions :",
              value: "45",
              mywidth: 207,
              myheight: 40,
              titlePadding: EdgeInsets.only(left: 20),
              valuePadding: EdgeInsets.only(right: 65)),
          _buildStatItem(
              label: 'Total Duration :',
              value: '12 hours',
              mywidth: 279,
              myheight: 40,
              titlePadding: const EdgeInsets.only(left: 20),
              valuePadding: EdgeInsets.only(right: 100)),
          _buildStatItem(
              label: 'Meditation Streak :',
              value: '10 days',
              mywidth: 366,
              myheight: 40,
              titlePadding: EdgeInsets.only(left: 20),
              valuePadding: EdgeInsets.only(right: 155)),
        ],
      ),
    );
  }

  Widget _buildStatItem({
    required String label,
    required String value,
    required double mywidth,
    required double myheight,
    EdgeInsetsGeometry titlePadding = const EdgeInsets.only(),
    EdgeInsetsGeometry valuePadding = const EdgeInsets.only(),
  }) {
    return Container(
      width: mywidth,
      height: myheight,
      margin: EdgeInsets.only(bottom: 8),
      decoration: BoxDecoration(
        color: Color(0xff2C3E50),
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(20),
          bottomRight: Radius.circular(20),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: titlePadding,
            child: Text(label, style: TextStyle(color: Colors.white)),
          ),
          Padding(
            padding: valuePadding,
            child: Text(
              value,
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAchievements() {
    return Padding(
      padding: const EdgeInsets.only(right: 100),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 1),
            child: Text(
              'Achievements & Milestones',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(height: 8),
          _buildAchievementItem('Meditation Expert', 'Completed 100 sessions'),
          _buildAchievementItem('Streak Master', 'Maintained a 30-day streak'),
        ],
      ),
    );
  }

  Widget _buildAchievementItem(String title, String description) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: TextStyle(fontWeight: FontWeight.bold)),
          Text(description, style: TextStyle(color: Colors.grey)),
        ],
      ),
    );
  }
}
