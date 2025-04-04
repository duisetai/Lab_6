import 'package:flutter/material.dart';

class UserInfoPage extends StatelessWidget {
  final String name;
  final String email;
  final String phone;

  UserInfoPage({required this.name, required this.email, required this.phone});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("User Info")),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Name: $name", style: TextStyle(fontSize: 18)),
            Text("Email: $email", style: TextStyle(fontSize: 18)),
            Text("Phone: $phone", style: TextStyle(fontSize: 18)),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Back'),
            ),
          ],
        ),
      ),
    );
  }
}
