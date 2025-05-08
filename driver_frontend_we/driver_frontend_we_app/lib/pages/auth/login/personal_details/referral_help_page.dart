import 'package:flutter/material.dart';

class ReferralHelpPage extends StatefulWidget {
  const ReferralHelpPage({super.key});

  @override
  State<ReferralHelpPage> createState() => _ReferralHelpPageState();
}

class _ReferralHelpPageState extends State<ReferralHelpPage> {
  final TextEditingController _issueController = TextEditingController();
  int _characterCount = 0;
  static const int _maxCharacters = 500;

  @override
  void initState() {
    super.initState();
    _issueController.addListener(_updateCharacterCount);
  }

  void _updateCharacterCount() {
    setState(() {
      _characterCount = _issueController.text.length;
    });
  }

  @override
  void dispose() {
    _issueController.dispose();
    super.dispose();
  }

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
    final buttonHeight = screenHeight * 0.06; // 6% of screen height

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 107, 81, 210), // Orange from the image
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context); // Navigate back
          },
        ),
        title: Text(
          'Registration Help',
          style: TextStyle(
            fontSize: titleFontSize * 0.7, // Adjusted for app bar
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
      ),
      body: Container(
        color: Colors.white, // White background
        padding: EdgeInsets.all(padding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Main content
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Hi, Janu. Are you having trouble completing the registration process?',
                      style: TextStyle(
                        fontSize: subtitleFontSize,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(height: padding),
                    Text(
                      'What you should do next:',
                      style: TextStyle(
                        fontSize: bodyFontSize,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(height: padding / 2),
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
                            'If you are a referred person, please select the related option form drop down or type the code and you will receive the confirmation of referral success. If not press the “Skip” button',
                            style: TextStyle(fontSize: bodyFontSize, color: Colors.black),
                          ),
                          SizedBox(height: padding),
                          Text(
                            'If you still cannot proceed, tell us why below, and we will get back to you. You will receive a call on this number : +94 764585277',
                            style: TextStyle(fontSize: bodyFontSize, color: Colors.black),
                          ),
                          SizedBox(height: padding),
                          TextField(
                            controller: _issueController,
                            maxLength: _maxCharacters,
                            maxLines: 3,
                            decoration: InputDecoration(
                              labelText: 'Describe issue...',
                              labelStyle: TextStyle(fontSize: bodyFontSize, color: Colors.grey),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                              counterText: '$_characterCount/$_maxCharacters',
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            // Submit button
            Center(
              child: ElevatedButton(
                onPressed: () {
                  // Add submit logic here
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 107, 81, 210), // Orange from the image
                  minimumSize: Size(screenWidth * 0.9, buttonHeight), // Responsive button size
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: Text(
                  'SUBMIT',
                  style: TextStyle(
                    fontSize: bodyFontSize,
                    color: Colors.white, // White for contrast against orange button
                  ),
                ),
              ),
            ),
            SizedBox(height: padding),
            Center(
              child: Text(
                'Alternatively, you can call us on:',
                style: TextStyle(fontSize: bodyFontSize, color: Colors.black),
              ),
            ),
            SizedBox(height: padding / 2),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  // Add call logic here
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 176, 163, 230), // Light orange background
                  minimumSize: Size(screenWidth * 0.9, buttonHeight * 0.8), // Slightly smaller button
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(Icons.phone, color: Colors.black),
                    const SizedBox(width: 8),
                    Text(
                      'NEW REGISTRATIONS\n+94 11 4562556',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: bodyFontSize, color: Colors.black),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: padding), // Extra padding at the bottom
          ],
        ),
      ),
    );
  }
}