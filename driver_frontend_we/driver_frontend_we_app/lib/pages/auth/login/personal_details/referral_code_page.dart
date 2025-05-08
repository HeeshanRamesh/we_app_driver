import 'package:flutter/material.dart';

class ReferralCodePage extends StatefulWidget {
  const ReferralCodePage({super.key});

  @override
  State<ReferralCodePage> createState() => _ReferralCodePageState();
}

class _ReferralCodePageState extends State<ReferralCodePage> {
  @override
  Widget build(BuildContext context) {
    // Get screen size for responsiveness
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    // Adjust padding and font sizes based on screen width
    final padding = screenWidth * 0.04; // 4% of screen width
    final titleFontSize = screenWidth * 0.06; // 6% of screen width
    final subtitleFontSize = screenWidth * 0.045; // 4.5% of screen width
    final bodyFontSize = screenWidth * 0.04; // 4% of screen width
    final logoHeight = screenHeight * 0.08; // 8% of screen height
    final buttonHeight = screenHeight * 0.06; // 6% of screen height

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            // Top section with back button and help icon
            Container(
              padding: EdgeInsets.all(padding),
              color: const Color.fromARGB(255, 107, 81, 210), // We app theme purple
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        icon: const Icon(Icons.arrow_back, color: Colors.white),
                        onPressed: () {
                          Navigator.pop(context); // Navigate back
                        },
                      ),
                      Row(
                        children: [
                          Text(
                            'Help',
                            style: TextStyle(
                              color: Colors.white, // White for contrast against purple background
                              fontSize: subtitleFontSize,
                            ),
                          ),
                          IconButton(
                            icon: const Icon(Icons.help_outline, color: Colors.white),
                            onPressed: () {},
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: padding),
                  Center(
                    child: Image.asset(
                      'assets/we_Logo.png', // We logo for top section
                      height: logoHeight,
                    ),
                  ),
                  SizedBox(height: padding),
                  Text(
                    'Referral Code',
                    style: TextStyle(
                      fontSize: titleFontSize,
                      fontWeight: FontWeight.bold,
                      color: Colors.white, // White for contrast against purple background
                    ),
                  ),
                ],
              ),
            ),
            // Progress bar section
            Container(
              padding: EdgeInsets.symmetric(horizontal: padding, vertical: padding / 2),
              color: const Color.fromARGB(255, 176, 163, 230), // Light orange background
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Your Progress',
                    style: TextStyle(fontSize: bodyFontSize, color: Colors.black),
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: screenWidth * 0.3, // Define a finite width for the progress bar
                        child: LinearProgressIndicator(
                          value: 0.25,
                          backgroundColor: Colors.grey[300],
                          color: Colors.green,
                          minHeight: 10,
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                      SizedBox(width: padding),
                      Text(
                        '40% complete',
                        style: TextStyle(fontSize: bodyFontSize, color: Colors.black),
                      ),
                      const Icon(Icons.arrow_drop_down, color: Colors.black),
                    ],
                  ),
                ],
              ),
            ),
            // Main content
            Expanded(
              child: SingleChildScrollView(
                child: Container(
                  color: Colors.white, // White background as requested
                  padding: EdgeInsets.all(padding),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Referral Code',
                        style: TextStyle(
                          fontSize: subtitleFontSize,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      SizedBox(height: padding / 2),
                      Text(
                        'Optional',
                        style: TextStyle(fontSize: bodyFontSize, color: Colors.grey),
                      ),
                      SizedBox(height: padding),
                      Center(
                        child: Image.asset(
                          'assets/we_Logo.png', // Bounce logo asset
                          height: logoHeight,
                        ),
                      ),
                      SizedBox(height: padding),
                      Container(
                        padding: EdgeInsets.all(padding),
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 176, 163, 230), // Light orange background
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Enter Referral Code',
                              style: TextStyle(
                                fontSize: subtitleFontSize,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                            SizedBox(height: padding),
                            Text(
                              'If you have a referral code, please enter it below to receive potential benefits.',
                              style: TextStyle(fontSize: bodyFontSize, color: Colors.black),
                            ),
                            SizedBox(height: padding),
                            TextField(
                              decoration: InputDecoration(
                                labelText: 'Referral Code',
                                labelStyle: TextStyle(fontSize: bodyFontSize, color: Colors.grey),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: padding * 2),
                      Center(
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color.fromARGB(255, 107, 81, 210), // We app theme purple
                            minimumSize: Size(screenWidth * 0.9, buttonHeight), // Responsive button size
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          child: Text(
                            'SKIP',
                            style: TextStyle(
                              fontSize: bodyFontSize,
                              color: Colors.white, // White for contrast against purple button
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}