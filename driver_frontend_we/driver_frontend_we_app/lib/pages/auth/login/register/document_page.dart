import 'package:flutter/material.dart';
import '../personal_details/personal_details_page.dart';

class DocumentPage extends StatefulWidget {
  const DocumentPage({super.key});

  @override
  State<DocumentPage> createState() => _DocumentPageState();
}

class _DocumentPageState extends State<DocumentPage> {
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
              color: const Color.fromARGB(255, 107, 81, 210), // Purple background
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        icon: const Icon(Icons.arrow_back, color: Colors.white),
                        onPressed: () {
                          Navigator.pop(context); // Navigate back to VerificationCodePage
                        },
                      ),
                      Row(
                        children: [
                          Text(
                            'Help',
                            style: TextStyle(
                              color: Colors.white,
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
                      'assets/we_Logo.png', // Replace with your "We" logo asset
                      height: logoHeight,
                    ),
                  ),
                  SizedBox(height: padding),
                  Text(
                    'Documents Required',
                    style: TextStyle(
                      fontSize: titleFontSize,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            // Main content
            Expanded(
              child: SingleChildScrollView(
                child: Container(
                  color: const Color.fromARGB(255, 239, 239, 238), // Light beige background
                  padding: EdgeInsets.all(padding),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Documents required for vehicle registration',
                        style: TextStyle(
                          fontSize: subtitleFontSize,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      SizedBox(height: padding * 2),
                      Text(
                        'Mandatory documents',
                        style: TextStyle(
                          fontSize: bodyFontSize,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      SizedBox(height: padding),
                      Text('• Revenue License', style: TextStyle(fontSize: bodyFontSize, color: Colors.black87)),
                      Text('• Driving License', style: TextStyle(fontSize: bodyFontSize, color: Colors.black87)),
                      Text('• Insurance Certificate (any insurance category)', style: TextStyle(fontSize: bodyFontSize, color: Colors.black87)),
                      Text('• Vehicle photos (front/ rear/ inside)', style: TextStyle(fontSize: bodyFontSize, color: Colors.black87)),
                      Text('• Driver\'s photo', style: TextStyle(fontSize: bodyFontSize, color: Colors.black87)),
                      SizedBox(height: padding * 2),
                      Text(
                        'Non-mandatory documents',
                        style: TextStyle(
                          fontSize: bodyFontSize,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      SizedBox(height: padding),
                      Text('• National Identity Card', style: TextStyle(fontSize: bodyFontSize, color: Colors.black87)),
                      Text('• No Objection Certificate from the vehicle owner', style: TextStyle(fontSize: bodyFontSize, color: Colors.black87)),
                      Text('• National Identity Card of the vehicle owner', style: TextStyle(fontSize: bodyFontSize, color: Colors.black87)),
                      Text('• Billing Proof', style: TextStyle(fontSize: bodyFontSize, color: Colors.black87)),
                      SizedBox(height: padding * 2),
                      // Okay button
                      Center(
                        child: ElevatedButton(
                          onPressed: () {
                            // Navigate to PersonalDetailsPage
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => const PersonalDetailsPage()),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color.fromARGB(255, 107, 81, 210), // Purple button
                            minimumSize: Size(screenWidth * 0.9, buttonHeight), // Responsive button size
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          child: Text(
                            'OKAY',
                            style: TextStyle(
                              fontSize: bodyFontSize,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: padding), // Extra padding at the bottom
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