import 'dart:developer';
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:firebaseseries/auth/login.dart';
import 'package:firebaseseries/model/meditationSession.dart';
import 'package:firebaseseries/model/usermodel.dart';
import 'package:firebaseseries/screen/meditationtrackerscreen.dart';
import 'package:firebaseseries/screen/utils/app_colors.dart';
import 'package:firebaseseries/screen/widgets/button3.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
   String? profileImageUrl;
  Usermodel me = Usermodel(password: '', name: '', email: '', profileImageUrl: '');
  int totalMeditationTime = 0;
  int totalMeditationDays = 0;
  int currentStreakDays = 0;
  final DatabaseReference _dbRef = FirebaseDatabase.instance.ref();
  List<MeditationSession> _sessions = [];
  String ? _favoriteSports ;
   void _showFavoriteSportDialog(BuildContext context) {
    TextEditingController _sportController = TextEditingController();

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Enter Your Favorite Sport'),
          content: TextField(
            controller: _sportController,
            decoration: InputDecoration(hintText: 'e.g., Football, Basketball'),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog without saving
              },
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                setState(() {
                  _favoriteSports = _sportController.text; // Save the input
                });
                Navigator.of(context).pop(); // Close the dialog after saving
              },
              child: Text('Save'),
            ),
          ],
        );
      },
    );
  }

  


  Future<void> _fetchTotalTimeAndDays() async {
  DatabaseReference _dbRef = FirebaseDatabase.instance
      .ref()
      .child("users")
      .child("userId")
      .child("meditation_session");
  
  _dbRef.once().then((DatabaseEvent snapshot) {
    Map<dynamic, dynamic> data = snapshot.snapshot.value as Map<dynamic, dynamic>;

    setState(() {
      _sessions = data.entries.map((entry) {
        return MeditationSession.fromMap(entry.value);
      }).toList();

      // Calculate total time and days
      totalMeditationTime = _sessions.fold(0, (sum, session) => sum + session.timeSpent);
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
    _loadProfileImage();
    getselfinfo(); 
      _fetchTotalTimeAndDays();
      
  }
  void _loadProfileImage() async {
    String userId = FirebaseAuth.instance.currentUser!.uid;
    DocumentSnapshot userDoc = await FirebaseFirestore.instance.collection('users').doc(userId).get();
    if (userDoc.exists) {
      setState(() {
        profileImageUrl = userDoc['profileImageUrl'];
      });
    }
  }
   void _showImageSourceBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                'Select Image Source',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),
              ListTile(
                leading: const Icon(Icons.camera_alt),
                title: const Text('Camera'),
                onTap: () {
                  _pickImage(ImageSource.camera);
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: const Icon(Icons.image),
                title: const Text('Gallery'),
                onTap: () {
                  _pickImage(ImageSource.gallery);
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        );
      },
    );
  }

  // Method to pick an image from the selected source
   Future<void> _pickImage(ImageSource source) async {
    final ImagePicker _picker = ImagePicker();
    final XFile? image = await _picker.pickImage(source: source);
    
    if (image != null) {
      File file = File(image.path);
      await _uploadImageToFirebase(file);
    }
  }
   Future<void> _uploadImageToFirebase(File file) async {
    String userId = FirebaseAuth.instance.currentUser!.uid;
    Reference storageRef = FirebaseStorage.instance.ref().child('profile_images/$userId.jpg');

    UploadTask uploadTask = storageRef.putFile(file);
    TaskSnapshot snapshot = await uploadTask;

    String downloadUrl = await snapshot.ref.getDownloadURL();
    
    // Update Firestore with the new profile image URL
    await FirebaseFirestore.instance.collection('users').doc(userId).update({
      'profileImageUrl': downloadUrl,
    });

    // Update state to display the new profile image
    setState(() {
      profileImageUrl = downloadUrl;
    });
  }



  Future<void> createuser() async {
    String userId = FirebaseAuth.instance.currentUser!.uid;

    // Sample user data
    Map<String, dynamic> userData = {
      'username': 'Default User',
      'email': 'user@example.com',
      'password': 'defaultPassword', // Never store passwords in plaintext
    };

    await FirebaseFirestore.instance.collection('users').doc(userId).set(userData);
    log("User created with ID: $userId");
  }

  Future<void> getselfinfo() async {
    try {
      String userId = FirebaseAuth.instance.currentUser!.uid;
      DocumentSnapshot userDoc = await FirebaseFirestore.instance
          .collection("users")
          .doc(userId)
          .get();
      
      log("Document exists: ${userDoc.exists}");
      if (userDoc.exists) {
        me = Usermodel.fromJson(userDoc.data() as Map<String, dynamic>);
        setState(() {}); // Update UI
      } else {
        await createuser(); // Call the method to create a user
        await getselfinfo(); // Fetch the info again after creating the user
      }
    } catch (e) {
      log("Error fetching user info: $e");
      // Handle error (e.g., show an alert)
    }
  }
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: me.name.isEmpty // Show loading indicator until user data is fetched
          ? const Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
              child: Column(
                children: [
                  Row(
                    children: [
                      _buildProfile(),
                      const SizedBox(width: 20),
                      _buildUserInfo(),
                    ],
                  ),
                  _buildMeditationStats(),
                  _buildAchievements(),
                  const SizedBox(height: 20),
                  CustomButton1(
                    height: 54,
                    width: 324,
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.arrow_back, color: color1),
                        SizedBox(width: 10),
                        Text("Log out", style: TextStyle(fontSize: 16, color: color1)),
                      ],
                    ),
                    onPressed: () {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (context) => const Login()));
                    },
                  ),
                  const SizedBox(height: 20),
                ],
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
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xffFFFFFF),
              Color(0xff2C3E50),
            ],
          ),
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(100),
            bottomRight: Radius.circular(100),
          ),
        ),
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.only(right: 70),
              child: Text(
                "Profile",
                style: TextStyle(fontSize: 32, fontWeight: FontWeight.w600, color: Color(0xff1C1B1F)),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: GestureDetector(
                onTap: ()=> _showImageSourceBottomSheet(context),
                child: Container(
                  width: 90,
                  height: 90,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: profileImageUrl != null
                        ? DecorationImage(
                            image: NetworkImage(profileImageUrl!),
                            fit: BoxFit.cover,
                          )
                        : const DecorationImage(
                            image: AssetImage("assets/User image.png"),
                            fit: BoxFit.cover,
                          ),
              
            ),
                ),
            ),
              ),
            Text(
              " ${me.name}",
              style: const TextStyle(fontSize: 22, fontWeight: FontWeight.w700, color: Color(0xff2C3E50)),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildUserInfo() {
  return Column(
    children: [
       Padding(
        padding: EdgeInsets.only(top: 20, left: 130),
        child: GestureDetector(
          onTap: () {
           _showFavoriteSportDialog(context);
          },
          child: Text(
            "Edit",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w300,
              color: color2,
            ),
          ),
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(top: 30),
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'User Name:',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey,
                  fontWeight: FontWeight.w400,
                ),
              ),
              // Display the fetched username
              Text(
                me.name, // Make sure 'user' is accessible here
                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                'Favorite Sports:',
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),
              if(_favoriteSports!=null)
              Text(
                "$_favoriteSports",
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                'Email:',
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),
              // Display the fetched email
              Text(me.email), // Make sure 'user' is accessible here
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
          const Text('Meditation Stats', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          _buildStatItem(
              label: "Total Sessions :",
              value: "${_sessions.length}",
              mywidth: 207,
              myheight: 40,
              titlePadding: const EdgeInsets.only(left: 20),
              valuePadding: const EdgeInsets.only(right: 65)),
          _buildStatItem(
              label: 'Total Duration :',
              value: '${totalMeditationTime} sec',
              mywidth: 279,
              myheight: 40,
              titlePadding: const EdgeInsets.only(left: 20),
              valuePadding: const EdgeInsets.only(right: 100)),
          _buildStatItem(
              label: 'Meditation Streak :',
              value: '$currentStreakDays',
              mywidth: 366,
              myheight: 40,
              titlePadding: const EdgeInsets.only(left: 20),
              valuePadding: const EdgeInsets.only(right: 197)),
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
      margin: const EdgeInsets.only(bottom: 8),
      decoration: const BoxDecoration(
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
            child: Text(label, style: const TextStyle(color: Colors.white)),
          ),
          Padding(
            padding: valuePadding,
            child: Text(
              value,
              style: const TextStyle(
                  color: Colors.white, fontWeight: FontWeight.bold),
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
          const Padding(
            padding: EdgeInsets.only(left: 1),
            child: Text('Achievements & Milestones', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          ),
          const SizedBox(height: 8),
          _buildAchievementItem('Meditation Expert', 'Completed ${_sessions.length} sessions'),
          _buildAchievementItem('Streak Master', 'Maintained a $currentStreakDays streak'),
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
          Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
          Text(description, style: const TextStyle(color: Colors.grey)),
        ],
      ),
    );
  }
}