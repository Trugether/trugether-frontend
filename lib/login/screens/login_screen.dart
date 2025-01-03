import 'package:flutter/material.dart';
import 'package:trugether_frontend/registration/screens/registration_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

//login screen
class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          Opacity(
            opacity: 0.1,
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
          Center(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Image.asset(
                    'assets/images/logo/logo.png',
                    height: 180,
                    width: 180,
                  ),
                  //  SizedBox(height: 4),
                  // Title
                  Text(
                    "Trugether",
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.center,
                  ),

                  SizedBox(height: 6),
                  // Subtitle
                  Text(
                    "Login and enjoy the music together!!",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 14, color: Colors.white70),
                  ),
                  SizedBox(height: 24),
                  SizedBox(
                    height: 45,
                    child: TextField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(50.0)),
                        ),
                        hintText: "Username",
                        hintStyle: TextStyle(color: Colors.grey),
                        contentPadding: EdgeInsets.symmetric(
                          vertical: 8,
                          horizontal: 20,
                        ),
                      ),
                      keyboardType: TextInputType.text,
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  SizedBox(height: 14),
                  SizedBox(
                    height: 45,
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Password',
                        hintStyle: TextStyle(color: Colors.grey),
                        contentPadding: EdgeInsets.symmetric(
                          vertical: 8,
                          horizontal: 20,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(50.0)),
                        ),
                      ),
                      obscureText: true,
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  SizedBox(height: 16),
                  SizedBox(
                    height: 45,
                    child: ElevatedButton(
                      onPressed: () {
                        // Handle login logic
                      },
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                            50.0,
                          ), // Match TextField's border radius
                        ),
                        // Adjust padding for size
                        backgroundColor:
                            Colors.green, // Button background color
                        foregroundColor: Colors.white, // Text color
                        elevation: 5, // Add shadow for a raised effect
                      ),
                      child: Text(
                        'Login',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ), // Customize text style
                      ),
                    ),
                  ),
                  SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Don't have an account? ",
                        style: TextStyle(color: Colors.white),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => RegistrationScreen(),
                            ),
                          );
                        },
                        child: Text(
                          'Register',
                          style: TextStyle(
                            color: Colors.blue,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 15,
                  ), // Add some space between text and divider
                  Opacity(
                    opacity: 0.3,
                    child: Row(
                      children: [
                        Expanded(
                          child: Divider(
                            color: Colors.white, // Divider color
                            thickness: 1, // Divider thickness
                            indent: 20, // Left indent
                          ),
                        ),
                        Text(
                          '    OR    ',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Expanded(
                          child: Divider(
                            color: Colors.white, // Divider color
                            thickness: 1, // Divider thickness
                            endIndent: 20, // Right indent
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 15),
                  SizedBox(
                    height: 45,
                    child: ElevatedButton.icon(
                      onPressed: () {
                        // Handle Google login logic
                      },
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                            50.0,
                          ), // Match TextField's border radius
                        ),
                        backgroundColor:
                            Colors.white, // Button background color
                        foregroundColor: Colors.black, // Text color
                        elevation: 5, // Add shadow for a raised effect
                      ),
                      icon: Image.asset(
                        'assets/images/grid/google.png', // Your Google icon asset
                        height: 20, // Icon size
                        width: 20, // Icon size
                      ),
                      label: Text(
                        'Continue with Google',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.black, // Text color
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
