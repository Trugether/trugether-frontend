import 'package:flutter/material.dart';

class JioSaavnLoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background with grid-like effect
          Opacity(
            opacity: 0.2,
            child: GridView.count(
              crossAxisCount: 3,
              children: List.generate(
                6,
                (index) => Container(
                  margin: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Colors.grey[700],
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(
                    child: Image.asset(
                      'assets/images/grid/image${index + 1}.jpg',
                      fit: BoxFit.cover,
                      height: 150,
                    ),
                  ),
                ),
              ),
            ),
          ),
          // Foreground content
          Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Logo
                  CircleAvatar(
                    radius: 40,
                    backgroundColor: Colors.teal,
                    child: Icon(
                      Icons.music_note,
                      color: Colors.white,
                      size: 40,
                    ),
                  ),
                  SizedBox(height: 16),
                  // Title
                  Text(
                    "JioSaavn",
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 8),
                  // Subtitle
                  Text(
                    "Login and enjoy more than 80 million songs",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 16, color: Colors.white70),
                  ),
                  SizedBox(height: 32),
                  // Mobile Number Input
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(25),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black26,
                          blurRadius: 10,
                          offset: Offset(0, 4),
                        ),
                      ],
                    ),
                    child: TextField(
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        prefixText: "+91 ",
                        prefixStyle: TextStyle(color: Colors.black),
                        hintText: "Continue with mobile number",
                        hintStyle: TextStyle(color: Colors.grey),
                      ),
                      keyboardType: TextInputType.phone,
                    ),
                  ),
                  SizedBox(height: 16),
                  // Social Login Buttons
                  Text(
                    "Or",
                    style: TextStyle(
                      color: Colors.white70,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        backgroundColor: Colors.white,
                        child: Icon(Icons.g_mobiledata, color: Colors.red),
                      ),
                      SizedBox(width: 16),
                      CircleAvatar(
                        backgroundColor: Colors.white,
                        child: Icon(Icons.facebook, color: Colors.blue),
                      ),
                      SizedBox(width: 16),
                      CircleAvatar(
                        backgroundColor: Colors.white,
                        child: Icon(Icons.email, color: Colors.orange),
                      ),
                    ],
                  ),
                  SizedBox(height: 32),
                  // Footer Text
                  Text(
                    "By continuing, you agree to our Terms & Privacy Policy",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 12, color: Colors.white70),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      backgroundColor: Colors.black,
    );
  }
}
