import 'package:firebaseseries/screen/utils/app_colors.dart';
import 'package:flutter/material.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool _notificationsEnabled = false;
  bool _soundEnabled = false;
  bool _profilePublic = false;
  String _selectedTheme = 'Light';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Settings",
          style: TextStyle(
              color: color2, fontSize: 30, fontWeight: FontWeight.w600),
        ),
        leading: IconButton(
          icon: Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Container(
                height: 30,
                width: 30,
                decoration: BoxDecoration(
                    color: color2, borderRadius: BorderRadius.circular(12)),
                child: const Icon(
                  Icons.arrow_back,
                  color: color1,
                )),
          ),
          onPressed: () {},
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            const SizedBox(
              height: 5,
            ),
            const Text(
              "Notifications",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
            ),

            buildSwitchListTile(
              title: 'Enable Notifications',
              value: _notificationsEnabled,
              onChanged: (value) {
                setState(() {
                  _notificationsEnabled = value;
                });
              },
            ),
            const SizedBox(height: 16),
            const Text(
              "Sounds Settings",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
            ),
            buildSwitchListTile(
              title: 'Enable Background Sounds',
              value: _soundEnabled,
              onChanged: (value) {
                setState(() {
                  _soundEnabled = value;
                });
              },
            ),
            const SizedBox(height: 16),

            buildSectionHeader('Language'),
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: color2)),
              child: ListTile(
                title: const Text('Select'),
                tileColor: Colors.grey[200],
                trailing: const Icon(Icons.arrow_forward_ios),
              ),
            ),
            const SizedBox(height: 16),

            buildSectionHeader('Theme'),
            buildRadioListTile(
              title: 'Light Mode',
              value: 'Light',
              groupValue: _selectedTheme,
              onChanged: (value) {
                setState(() {
                  _selectedTheme = value!;
                });
              },
            ),
            buildRadioListTile(
              title: 'Dark Mode',
              value: 'Dark',
              groupValue: _selectedTheme,
              onChanged: (value) {
                setState(() {
                  _selectedTheme = value!;
                });
              },
            ),
            const SizedBox(height: 16),
            const Text(
              "Privacy Settings",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
            ),
            buildSwitchListTile(
              title: 'Make Profile Public',
              value: _profilePublic,
              onChanged: (value) {
                setState(() {
                  _profilePublic = value;
                });
              },
            ),
            const SizedBox(height: 16),
            // Help & Support
            buildSectionHeader('Help & Support'),
            buildButton(
              context,
              title: 'Contact Support',
              onPressed: () {
                // Handle contact support
              },
            ),
            const SizedBox(height: 8),
            buildButton(
              context,
              title: 'FAQs',
              onPressed: () {
                // Handle FAQs
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget buildSwitchListTile({
    required String title,
    required bool value,
    required void Function(bool) onChanged,
  }) {
    return SwitchListTile(
      title: Text(
        title,
        style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
      ),
      value: value,
      onChanged: onChanged,
    );
  }

  Widget buildRadioListTile({
    required String title,
    required String value,
    required String groupValue,
    required void Function(String?) onChanged,
  }) {
    return RadioListTile<String>(
      title: Text(title),
      value: value,
      groupValue: groupValue,
      onChanged: onChanged,
    );
  }

  Widget buildSectionHeader(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Text(
        title,
        style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget buildButton(BuildContext context,
      {required String title, required void Function() onPressed}) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        minimumSize: const Size(double.infinity, 48),
        backgroundColor: Colors.grey[200],
        elevation: 0,
      ),
      child: Text(
        title,
        style: const TextStyle(color: Colors.black),
      ),
    );
  }
}
