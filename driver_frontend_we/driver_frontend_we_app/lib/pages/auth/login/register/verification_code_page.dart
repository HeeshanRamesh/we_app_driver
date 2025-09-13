import 'package:flutter/material.dart';
import 'verification_help_page.dart';
import 'document_page.dart';

class VerificationCodePage extends StatefulWidget {
  const VerificationCodePage({super.key});

  @override
  State<VerificationCodePage> createState() => _VerificationCodePageState();
}

class _VerificationCodePageState extends State<VerificationCodePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              // Top section with back button and help icon
              Container(
                padding: const EdgeInsets.all(16.0),
                color: const Color.fromARGB(255, 107, 81, 210), // Purple background
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                          icon: const Icon(Icons.arrow_back, color: Colors.white),
                          onPressed: () {
                            Navigator.pop(context); // Navigate back to RegisterPage
                          },
                        ),
                        Row(
                          children: [
                            const Text(
                              'Help',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                              ),
                            ),
                            IconButton(
                              icon: const Icon(Icons.help_outline, color: Colors.white),
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => const VerificationHelpPage()),
                                );
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                    Image.asset(
                      'assets/we_Logo.png', // Replace with your "We" logo asset
                      height: 80,
                    ),
                  ],
                ),
              ),
              // Main content
              Container(
                color: const Color.fromARGB(255, 239, 239, 238), // Light beige background
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Enter Verification Code',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(height: 20),
                    const Text(
                      'We sent a 6-digit code to your phone number. Please enter it below.',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 20),
                    TextField(
                      keyboardType: TextInputType.number,
                      maxLength: 6,
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(
                        hintText: 'Enter 6-digit code',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        counterText: '', // Hide the character counter
                      ),
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      'Didn’t receive the code? Resend',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey,
                      ),
                    ),
                    const SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const DocumentPage()),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color.fromARGB(255, 107, 81, 210), // Purple button
                        minimumSize: const Size(double.infinity, 50),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: const Text(
                        'VERIFY',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}