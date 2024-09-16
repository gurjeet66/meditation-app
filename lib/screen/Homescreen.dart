import 'package:firebaseseries/screen/Meditation1.dart';
import 'package:firebaseseries/screen/Meditation2.dart';
import 'package:firebaseseries/screen/Meditation3.dart';
import 'package:firebaseseries/screen/Meditation4.dart';
import 'package:firebaseseries/screen/meditationtask.dart';
import 'package:firebaseseries/screen/meditation5.dart';
import 'package:firebaseseries/screen/settings.dart';
import 'package:firebaseseries/screen/widgets/custombox.dart';
import 'package:firebaseseries/screen/widgets/sessionbox3.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:firebaseseries/screen/profile.dart';
import 'package:firebaseseries/screen/widgets/sessiobox.dart';
import 'package:firebaseseries/screen/Explorescreen.dart';
import 'package:firebaseseries/screen/sessions.dart';
import 'package:firebaseseries/screen/utils/app_colors.dart';

class MeditationHomeScreen extends StatefulWidget {
  @override
  State<MeditationHomeScreen> createState() => _MeditationHomeScreenState();
}

class _MeditationHomeScreenState extends State<MeditationHomeScreen> {
  int _selectedIndex = 0;

  final List<Widget> _screens = [
    HomeScreen(),
    SessionsScreen(),
    Explorescreen(),
    ProfilePage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  Widget _buildNavItem(Widget icon, String label, int index) {
    bool isSelected = _selectedIndex == index;
    Color containerColor = isSelected ? Colors.orange : Colors.transparent;
    Color contentColor = isSelected ? Colors.black : Colors.white;

    return GestureDetector(
      onTap: () {
        _onItemTapped(index);
      },
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        decoration: BoxDecoration(
          color: containerColor,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconTheme(
              data: IconThemeData(color: contentColor),
              child: SizedBox(
                width: 24,
                height: 24,
                child: Center(child: icon),
              ),
            ),
            SizedBox(height: 4),
            Text(
              label,
              style: TextStyle(
                color: contentColor,
                fontSize: 12,
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: color1,
      body: _screens[_selectedIndex],
      bottomNavigationBar: _selectedIndex == 3
          ? null
          : Container(
              color: Colors.black,
              padding: EdgeInsets.symmetric(vertical: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _buildNavItem(
                    Image.asset('assets/Vector 6.png', width: 24, height: 24),
                    'Home',
                    0,
                  ),
                  _buildNavItem(
                    Image.asset('assets/icon2.png', width: 24, height: 24),
                    'Sessions',
                    1,
                  ),
                  _buildNavItem(
                    Image.asset('assets/Frame.png', width: 24, height: 24),
                    'Explore',
                    2,
                  ),
                  _buildNavItem(
                    Image.asset('assets/Icon.png', width: 24, height: 24),
                    'Profile',
                    3,
                  ),
                ],
              ),
            ),
    );
  }
}

final List<String> title = [
  "Meditation for ",
  "Meditation for ",
  "Meditation for ",
  "Meditation for ",
];
final List<String> subtitle = ["Tennis", "Soccer", "Basketball", "Cricket"];

final List<String> lower = [
  "Players",
  "Players",
  "Players",
  "Players",
];

final List<String> mypic = [
  "assets/Vector 2.png",
  "assets/mdi_soccer 2.png",
  "assets/mdi_basketball.png",
  "assets/mdi_cricket.png",
];

final List<String> myImages = [
  "assets/designers_28349_A_realistic_image_of_a_tennis_player_in_mid-a_c961ce2a-f214-4ef2-9dde-569cb76d38aa_1 1.png",
  "assets/designers_28349_A_realistic_image_of_a_soccer_player_in_mid-a_3e08542e-776d-451a-a633-6d64d78df3c5_0.png",
  "assets/designers_28349_A_realistic_image_of_a_basketball_player_in_a_55035ec4-eb67-4348-9fa8-510c9a74d1db_3.png",
  "assets/designers_28349_A_realistic_image_of_a_cricket_player_in_acti_5f5bdbcf-76c2-4af8-aab5-aa16ddbd30a0_2.png",
];

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: color1,
      body: CustomScrollView(
        scrollDirection: Axis.vertical,
        slivers: [
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 40),
                  Container(
                    width: double.infinity,
                    height: 135,
                    padding: EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Color(0xffE67E22), // Light Orange
                          Color(0xff804613), // Dark Orange
                        ],
                        end: Alignment.bottomRight,
                      ),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Good Morning, Alex!",
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(height: 10),
                        Text(
                          "Hi, let's get started with your tailored mental training program.",
                          style: TextStyle(fontSize: 13, color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 16),
                  Container(
                    height: 48,
                    width: double.infinity,
                    child: Row(
                      children: [
                        Container(
                          width: 269,
                          height: 25,
                          child: Text(
                            "Your Progress",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                              color: color2,
                            ),
                          ),
                        ),
                        Container(
                          height: 32,
                          width: 83,
                          decoration: BoxDecoration(
                            color: Color(0xff000000),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Center(
                            child: Text(
                              "View all",
                              style:
                                  TextStyle(fontSize: 12, color: Colors.white),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 10),
                  Stack(
                    clipBehavior: Clip.none,
                    children: [
                      Positioned(
                        top: 5,
                        child: Container(
                          height: 100,
                          width: 157,
                          decoration: BoxDecoration(
                            color: color2,
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                      ),
                      Positioned(
                        top: 5,
                        left: 203.5,
                        child: Container(
                          height: 100,
                          width: 157,
                          decoration: BoxDecoration(
                            color: color3,
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          _buildMetricCard(
                            boxcolor: color3,
                            title: "Total Meditation Time",
                            value: "2 hours",
                            subValue: "+30 min",
                            backgroundColor: Colors.green,
                            textColor: Colors.white,
                          ),
                          _buildMetricCard(
                            boxcolor: color2,
                            title: "Meditation Streak",
                            value: "5 days",
                            subValue: "New Record!",
                            backgroundColor: Colors.transparent,
                            textColor: Colors.white,
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  Container(
                    padding: EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.2),
                          spreadRadius: 1,
                          blurRadius: 8,
                        ),
                      ],
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Sporty Minds - Mental Challenge Selection",
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                              SizedBox(height: 10),
                              ElevatedButton(
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              meditationtask()));
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor:
                                      Color(0xFFFFCB2D), // Yellow button
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                ),
                                child: Text(
                                  "Start Challenge",
                                  style: TextStyle(
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Image.asset(
                          'assets/designers_28349_Sportman_doing_meditation_--v_6.1_1cdb31db-cd56-422a-802b-05bf57ee55cd_3 1.png',
                          width: 130,
                          height: 130,
                          fit: BoxFit.cover,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 10),
                ],
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                if (index >= title.length ||
                    index >= mypic.length ||
                    index >= myImages.length) {
                  return SizedBox.shrink();
                }

                return Padding(
                  padding: const EdgeInsets.all(8),
                  child: SessionBoxScreen(
                    titletext: title[index],
                    labelImagePath: mypic[index],
                    vectorImagePath: myImages[index],
                    subtitletext: subtitle[index],
                    lowertext: lower[index],
                    onpressed: () {
                      navigateToScreen(context, index);
                    },
                  ),
                );
              },
              childCount: mypic.length, // Number of items
            ),
          ),
          SliverToBoxAdapter(
            child: SizedBox(height: 20),
          ),
          SliverToBoxAdapter(
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: RichText(
                    text: TextSpan(children: [
                  TextSpan(
                      text: "Quick Session for all",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          color: color6)),
                  TextSpan(
                      text: "Sports",
                      style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w800,
                          color: color6))
                ])),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: SessionBoxScreen3(
                    titletext: "High Performance",
                    subtitletext: "Meditation",
                    lowertext: "Meditation: 15-20 minutes",
                    onTap: () {},
                    Image1: "assets/Depth 4, Frame 1.png"),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Text(
                  "Recommended Sessions",
                  style: TextStyle(
                      fontSize: 20, fontWeight: FontWeight.w600, color: color2),
                ),
              ),
              SizedBox(
                height: 5,
              ),
              CarouselSlider(
                options: CarouselOptions(height: 250.0, autoPlay: true),
                items: [
                  custombox(
                      ImagePath: "assets/Image.png",
                      titletext: "Recommended for relaxation",
                      labeltext: "Calm Before the Match: 15 min"),
                  custombox(
                      ImagePath: "assets/Image (1).png",
                      titletext: "Recommended for mental preparation",
                      labeltext: "Pre-Match Focus"),
                  custombox(
                      ImagePath: "assets/Image (2).png",
                      titletext: "Mindful Breathing: 5 min",
                      labeltext: "Visualizing Victory: 20 min")
                ],
              )
            ]),
          ),
        ],
      ),
    );
  }

  void navigateToScreen(BuildContext context, int index) {
    switch (index) {
      case 0:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Meditation1()),
        );
        break;
      case 1:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Meditation2()),
        );
        break;
      case 2:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Meditation3()),
        );
        break;
      // Add more cases for each screen you want to navigate to
      default:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Meditation4()),
        );
    }
  }

  Widget _buildMetricCard({
    required Color boxcolor,
    required String title,
    required String value,
    required String subValue,
    required Color backgroundColor,
    required Color textColor,
  }) {
    return Container(
      height: 100,
      width: 157,
      decoration: BoxDecoration(
        color: boxcolor,
        borderRadius: BorderRadius.circular(16),
      ),
      padding: EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 12,
              color: textColor,
            ),
          ),
          SizedBox(height: 8),
          Text(
            value,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: textColor,
            ),
          ),
          SizedBox(height: 4),
          Text(
            subValue,
            style: TextStyle(
              fontSize: 12,
              color: textColor,
            ),
          ),
        ],
      ),
    );
  }
}
