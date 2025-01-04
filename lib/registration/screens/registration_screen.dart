import 'package:flutter/material.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({super.key});

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.black,
      body: Center(
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
              // SizedBox(height: 8),
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
                "Register and join the music community!",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 14, color: Colors.white70),
              ),
              SizedBox(height: 24),
              SizedBox(
                height: 45,
                child: TextField(
                  decoration: InputDecoration(
                    hintText: "Username",
                    hintStyle: TextStyle(color: Colors.grey),
                    contentPadding: EdgeInsets.symmetric(
                      vertical: 8,
                      horizontal: 20,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(50.0)),
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
              SizedBox(height: 14),
              SizedBox(
                height: 45,
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Confirm Password',
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
                    // Handle registration logic
                  },
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50.0),
                    ),
                    backgroundColor: Colors.green,
                    foregroundColor: Colors.white,
                    elevation: 5,
                  ),
                  child: Text(
                    'Register',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Already have an account? ",
                    style: TextStyle(color: Colors.white),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Text(
                      'Login',
                      style: TextStyle(
                        color: Colors.blue,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
