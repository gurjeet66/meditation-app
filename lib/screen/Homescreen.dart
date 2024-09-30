import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebaseseries/auth/providers.dart';
import 'package:firebaseseries/model/meditationSession.dart';
import 'package:firebaseseries/model/usermodel.dart';
import 'package:firebaseseries/screen/Quickmeditation.dart';
import 'package:firebaseseries/screen/Recoommendedmeditation/recommendedmed1.dart';
import 'package:firebaseseries/screen/Recoommendedmeditation/recommendedmed2.dart';
import 'package:firebaseseries/screen/Recoommendedmeditation/recommendedmed3.dart';
import 'package:firebaseseries/screen/Sportsmeditation/basketballmeditation.dart';
import 'package:firebaseseries/screen/Sportsmeditation/cricketmeditation.dart';
import 'package:firebaseseries/screen/Sportsmeditation/soccermeditation.dart';
import 'package:firebaseseries/screen/Sportsmeditation/tennismeditation.dart';
import 'package:firebaseseries/screen/meditationtask.dart';
import 'package:firebaseseries/screen/progress1.dart';
import 'package:firebaseseries/screen/settings.dart';
import 'package:firebaseseries/screen/widgets/custombox.dart';
import 'package:firebaseseries/screen/widgets/sessionbox3.dart';
import 'package:firebaseseries/services/Apidata.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:firebaseseries/screen/profile.dart';
import 'package:firebaseseries/screen/widgets/sessiobox.dart';
import 'package:firebaseseries/screen/Explorescreen.dart';
import 'package:firebaseseries/screen/sessions.dart';
import 'package:firebaseseries/screen/utils/app_colors.dart';
import 'package:provider/provider.dart';

class MeditationHomeScreen extends StatefulWidget {
  const MeditationHomeScreen({
    super.key,
  });

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
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
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
            const SizedBox(height: 4),
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
      bottomNavigationBar: Container(
        color: Colors.black,
        padding: const EdgeInsets.symmetric(vertical: 8),
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

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    super.key,
  });

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String greeting = "Good morning, Guest!";
  String? userName;
  int totalMeditationTime = 0;
  int totalMeditationDays = 0;
  int currentStreakDays = 0;
  final DatabaseReference _dbRef = FirebaseDatabase.instance.ref();
  List<MeditationSession> _sessions = [];

  Future<void> _fetchTotalTimeAndDays() async {
    DatabaseReference _dbRef = FirebaseDatabase.instance
        .ref()
        .child("users")
        .child("userId")
        .child("meditation_session");

    _dbRef.once().then((DatabaseEvent snapshot) {
      Map<dynamic, dynamic> data =
          snapshot.snapshot.value as Map<dynamic, dynamic>;

      setState(() {
        _sessions = data.entries.map((entry) {
          return MeditationSession.fromMap(entry.value);
        }).toList();

        // Calculate total time and days
        totalMeditationTime =
            _sessions.fold(0, (sum, session) => sum + session.timeSpent);
        totalMeditationDays = _sessions.length;

        // Calculate current streak
        if (_sessions.isNotEmpty) {
          _sessions.sort((a, b) => a.date.compareTo(b.date)); // Sort by date
          DateTime lastDate = _sessions.last.date; // Most recent session
          currentStreakDays = 1; // Start with 1 for the last day

          for (int i = _sessions.length - 2; i >= 0; i--) {
            DateTime currentDate = _sessions[i].date;
            if (lastDate.difference(currentDate).inDays == 1) {
              currentStreakDays++;
              lastDate = currentDate;
            } else {
              break; // Streak is broken
            }
          }
        } else {
          currentStreakDays = 0; // No sessions means no streak
        }
      });
    });
  }

  @override
  void initState() {
    super.initState();
    // Assuming you have an instance of SignupProvider
    final signupProvider = Provider.of<SignupProvider>(context, listen: false);
    _fetchUserName(signupProvider);
    _fetchTotalTimeAndDays();
  }

  Future<void> _fetchUserName(SignupProvider signupProvider) async {
    await signupProvider.autoLogin(); // Call your autoLogin method

    if (signupProvider.isLoggedIn) {
      try {
        DocumentSnapshot userData = await FirebaseFirestore.instance
            .collection("users")
            .doc(signupProvider.user!.uid)
            .get();

        // Cast the data to Map<String, dynamic>
        final userMap = userData.data() as Map<String, dynamic>?;

        userName = userMap?['name'] ?? "Guest"; // Use null-aware access
        setState(() {
          greeting = "Good morning, $userName!";
        });
      } catch (e) {
        print("Error fetching user data: $e");
      }
    }
  }

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
                  const SizedBox(height: 40),
                  Container(
                    width: double.infinity,
                    height: 135,
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
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
                          greeting,
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
                  const SizedBox(height: 16),
                  SizedBox(
                    height: 48,
                    width: double.infinity,
                    child: Row(
                      children: [
                        SizedBox(
                          width: 269,
                          height: 25,
                          child: const Text(
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
                            color: const Color(0xff000000),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Center(
                            child: GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            ProgressScreen()));
                              },
                              child: Text(
                                "View all",
                                style: TextStyle(
                                    fontSize: 12, color: Colors.white),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 10),
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
                        top: 4,
                        left: 205,
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
                            value: "$totalMeditationTime",
                            subValue: "New Record",
                            backgroundColor: Colors.green,
                            textColor: Colors.white,
                          ),
                          _buildMetricCard(
                            boxcolor: color2,
                            title: "Meditation Streak",
                            value: "$totalMeditationDays",
                            subValue: "New Record!",
                            backgroundColor: Colors.transparent,
                            textColor: Colors.white,
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Container(
                    padding: const EdgeInsets.all(16),
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
                              const Text(
                                "Sporty Minds - Mental Challenge Selection",
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                              const SizedBox(height: 10),
                              ElevatedButton(
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              MeditationTask()));
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor:
                                      const Color(0xFFFFCB2D), // Yellow button
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                ),
                                child: const Text(
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
                  const SizedBox(height: 10),
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
                  return const SizedBox.shrink();
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
          const SliverToBoxAdapter(
            child: SizedBox(height: 20),
          ),
          SliverToBoxAdapter(
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: RichText(
                    text: const TextSpan(children: [
                  TextSpan(
                      text: "Quick Session for all",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          color: color6)),
                  TextSpan(
                      text: " Sports",
                      style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w800,
                          color: color6))
                ])),
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: SessionBoxScreen3(
                    titletext: "High Performance",
                    subtitletext: "Meditation",
                    lowertext: "Meditation: 15-20 minutes",
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Quickmeditation()));
                    },
                    Image1: "assets/Depth 4, Frame 1.png"),
              ),
              const SizedBox(
                height: 20,
              ),
              const Padding(
                padding: EdgeInsets.only(left: 10),
                child: Text(
                  "Recommended Sessions",
                  style: TextStyle(
                      fontSize: 20, fontWeight: FontWeight.w600, color: color2),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              CarouselSlider(
                options: CarouselOptions(height: 300.0, autoPlay: true),
                items: [
                  custombox(
                    ImagePath: "assets/Image.png",
                    titletext: "Recommended for relaxation",
                    labeltext: "Calm Before the Match: 15 min",
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => recommendedmed1()));
                    },
                  ),
                  custombox(
                      ImagePath: "assets/Image (1).png",
                      titletext: "Recommended for mental preparation",
                      labeltext: "Pre-Match Focus",
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => recommendedmed2()));
                      }),
                  custombox(
                    ImagePath: "assets/Image (2).png",
                    titletext: "Mindful Breathing: 5 min",
                    labeltext: "Visualizing Victory: 20 min",
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => recommendedmed3()));
                    },
                  )
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
          MaterialPageRoute(builder: (context) => tennismeditation()),
        );
        break;
      case 1:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => soccermeditation()),
        );
        break;
      case 2:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => basketballmeditation()),
        );
        break;
      // Add more cases for each screen you want to navigate to
      default:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => cricketmeditation()),
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
      padding: const EdgeInsets.all(12),
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
          const SizedBox(height: 8),
          Text(
            value,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: textColor,
            ),
          ),
          const SizedBox(height: 4),
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
