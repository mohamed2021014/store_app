import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Profile')),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Center(
                child: Column(
                  children: [
                    CircleAvatar(
                      radius: 60,
                      backgroundImage: NetworkImage(
                        'https://example.com/your-profile-image.jpg',
                      ),
                    ),
                    SizedBox(height: 20),
                    Text(
                      'Your Name',
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'your.email@example.com',
                      style: TextStyle(fontSize: 18, color: Colors.grey),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 30),
              Divider(),
              ListTile(
                leading: Icon(Icons.phone),
                title: Text('Phone Number'),
                subtitle: Text('+1 234 567 890'),
              ),
              Divider(),
              ListTile(
                leading: Icon(Icons.location_on),
                title: Text('Location'),
                subtitle: Text('Your City, Your Country'),
              ),
              Divider(),
              ListTile(
                leading: Icon(Icons.work),
                title: Text('Occupation'),
                subtitle: Text('Your Job Title'),
              ),
              Divider(),
              ListTile(
                leading: Icon(Icons.school),
                title: Text('Education'),
                subtitle: Text('Your Degree and Major'),
              ),
              Divider(),
              ListTile(
                leading: Icon(Icons.link),
                title: Text('Website'),
                subtitle: Text('https://yourwebsite.com'),
              ),
              Divider(),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  // Handle edit profile button press
                },
                child: Text('Edit Profile'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
