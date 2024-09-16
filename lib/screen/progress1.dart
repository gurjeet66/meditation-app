import 'package:firebaseseries/screen/utils/app_colors.dart';
import 'package:firebaseseries/screen/widgets/button1.dart';
import 'package:firebaseseries/screen/widgets/button3.dart';
import 'package:flutter/material.dart';

class ProgressScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          foregroundColor: Colors.black,
          title: Text(
            'Progress',
            style: TextStyle(fontWeight: FontWeight.w600, fontSize: 32),
          ),
          leading: IconButton(
            icon: Container(
                width: 30,
                height: 30,
                decoration: BoxDecoration(
                    color: color2, borderRadius: BorderRadius.circular(10)),
                child: Icon(
                  Icons.arrow_back,
                  color: color1,
                )),
            onPressed: () {
              Navigator.pop(context);
              // Handle back button
            },
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Your Meditation Stats',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                ),
                SizedBox(height: 16),
                _buildStatContainer(
                  myheight: 62,
                  mywidth: 193,
                  title: 'Total Time Spent:',
                  value: '25 hours',
                  titlePadding: EdgeInsets.only(right: 30, top: 5),
                  valuePadding: EdgeInsets.only(right: 60),
                ),
                SizedBox(height: 12),
                _buildStatContainer(
                  myheight: 62,
                  mywidth: 249,
                  title: 'Sessions Completed:',
                  value: '60',
                  titlePadding: EdgeInsets.only(right: 60, top: 5),
                  valuePadding: EdgeInsets.only(right: 185),
                ),
                SizedBox(height: 12),
                _buildStatContainer(
                  myheight: 62,
                  mywidth: 307,
                  title: 'Current Streak:',
                  value: '15 days',
                  titlePadding: EdgeInsets.only(right: 160, top: 5),
                  valuePadding: EdgeInsets.only(right: 180),
                ),
                SizedBox(height: 24),
                Divider(),
                ListTile(
                  title: Text('Weekly Progress'),
                  trailing: Icon(Icons.keyboard_arrow_right),
                  onTap: () {
                    // Handle tap
                  },
                ),
                Divider(),
                ListTile(
                  title: Text('Monthly Insights'),
                  trailing: Icon(Icons.keyboard_arrow_right),
                  onTap: () {
                    // Handle tap
                  },
                ),
                Divider(),
                SizedBox(height: 24),
                Text(
                  'Comparison Charts',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 8),
                Text(
                  'Track your improvement over the last 30 days',
                  style: TextStyle(
                      color: Color(0xff1C1B1F),
                      fontSize: 16,
                      fontWeight: FontWeight.w400),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  'Track your improvement over the last 90 days',
                  style: TextStyle(
                      color: Color(0xff1C1B1F),
                      fontSize: 16,
                      fontWeight: FontWeight.w400),
                ),
                SizedBox(height: 24),
                Text(
                  'Set Your Goals',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 8),
                _buildGoalInputField(),
                SizedBox(height: 12),
                CustomButton(
                    height: 50,
                    width: 358,
                    child: Text(
                      "Save Goal",
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Colors.white),
                    ),
                    onPressed: () {})
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Helper to build the statistics container
  Widget _buildStatContainer({
    required String title,
    required String value,
    required double mywidth,
    required double myheight,
    EdgeInsetsGeometry padding =
        const EdgeInsets.symmetric(), // Default padding
    EdgeInsetsGeometry titlePadding =
        const EdgeInsets.only(), // Custom padding for title
    EdgeInsetsGeometry valuePadding = const EdgeInsets.only(),
  }) {
    return Container(
      width: mywidth,
      height: myheight,
      decoration: BoxDecoration(
        color: Color(0xff2C3E50),
        borderRadius: BorderRadiusDirectional.only(
            topEnd: Radius.circular(30), bottomEnd: Radius.circular(30)),
      ),
      padding: padding,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: titlePadding,
            child: Text(
              title,
              style: TextStyle(
                  fontSize: 16, fontWeight: FontWeight.w400, color: color1),
            ),
          ),
          Padding(
            padding: valuePadding,
            child: Text(
              value,
              style: TextStyle(
                  fontSize: 24, fontWeight: FontWeight.w600, color: color1),
            ),
          ),
        ],
      ),
    );
  }

  // Helper to build the goal input field
  Widget _buildGoalInputField() {
    return TextField(
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        labelText: 'Set Long-term Goal (hours)',
      ),
      keyboardType: TextInputType.number,
    );
  }
}
