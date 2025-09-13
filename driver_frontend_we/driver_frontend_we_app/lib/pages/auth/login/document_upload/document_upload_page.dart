import 'package:flutter/material.dart';
import 'package:dotted_border/dotted_border.dart'; // Add this import
import 'profile_photo_page.dart';
import 'document_upload_help_page.dart'; // Add this import

class DocumentUploadPage extends StatefulWidget {
  const DocumentUploadPage({super.key});

  @override
  State<DocumentUploadPage> createState() => _DocumentUploadPageState();
}

class _DocumentUploadPageState extends State<DocumentUploadPage> {
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
            // Top section with back button, help icon, logo, title, and required label
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
                              color: Colors.white, // White for contrast
                              fontSize: subtitleFontSize,
                            ),
                          ),
                          IconButton(
                            icon: const Icon(Icons.help_outline, color: Colors.white),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => const DocumentUploadHelpPage()),
                              );
                            },
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
                    'Document Upload',
                    style: TextStyle(
                      fontSize: titleFontSize,
                      fontWeight: FontWeight.bold,
                      color: Colors.white, // White for contrast
                    ),
                  ),
                  SizedBox(height: padding / 2),
                  Text(
                    '*Required',
                    style: TextStyle(fontSize: bodyFontSize, color: Colors.red),
                  ),
                ],
              ),
            ),
            // Progress bar section
            Container(
              padding: EdgeInsets.symmetric(horizontal: padding, vertical: padding / 2),
              color: const Color.fromARGB(255, 176, 163, 230), // Light purple background
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
                          value: 0.5, // 50% complete
                          backgroundColor: Colors.grey[300],
                          color: Colors.green,
                          minHeight: 10,
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                      SizedBox(width: padding),
                      Text(
                        '50% complete',
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
                  color: Colors.white, // White background
                  padding: EdgeInsets.all(padding),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: padding),
                      Center(
                        child: Image.asset(
                          'assets/we_Logo.png', // Corrected to Bounce logo
                          height: logoHeight / 2,
                        ),
                      ),
                      SizedBox(height: padding),
                      Container(
                        padding: EdgeInsets.all(padding),
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 176, 163, 230), // Light purple background
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Profile Photo',
                              style: TextStyle(
                                fontSize: subtitleFontSize,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                            SizedBox(height: padding),
                            Center(
                              child: DottedBorder(
                                borderType: BorderType.RRect,
                                radius: const Radius.circular(8),
                                dashPattern: const [6, 4],
                                strokeWidth: 2,
                                color: Colors.grey,
                                child: ElevatedButton(
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(builder: (context) => const ProfilePhotoPage()),
                                    );
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.white,
                                    minimumSize: Size(screenWidth * 0.9, buttonHeight * 0.8),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    padding: EdgeInsets.symmetric(horizontal: padding, vertical: padding / 2),
                                  ),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      const Icon(Icons.add_a_photo, color: Colors.grey),
                                      SizedBox(width: padding / 2),
                                      Text(
                                        'Profile Photo *',
                                        style: TextStyle(
                                          fontSize: bodyFontSize,
                                          color: Colors.black,
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
                      SizedBox(height: padding),
                      Container(
                        padding: EdgeInsets.all(padding),
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 176, 163, 230), // Light purple background
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Driving License',
                              style: TextStyle(
                                fontSize: subtitleFontSize,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                            SizedBox(height: padding),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                DottedBorder(
                                  borderType: BorderType.RRect,
                                  radius: const Radius.circular(8),
                                  dashPattern: const [6, 4],
                                  strokeWidth: 2,
                                  color: Colors.grey,
                                  child: ElevatedButton(
                                    onPressed: () {
                                      // Logic to upload front photo
                                    },
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.white,
                                      minimumSize: Size(screenWidth * 0.9, buttonHeight * 0.8),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      padding: EdgeInsets.symmetric(horizontal: padding, vertical: padding / 2),
                                    ),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        const Icon(Icons.add_a_photo, color: Colors.grey),
                                        SizedBox(width: padding / 2),
                                        Text(
                                          'Driving License - Front *',
                                          style: TextStyle(
                                            fontSize: bodyFontSize,
                                            color: Colors.black,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                SizedBox(height: padding),
                                DottedBorder(
                                  borderType: BorderType.RRect,
                                  radius: const Radius.circular(8),
                                  dashPattern: const [6, 4],
                                  strokeWidth: 2,
                                  color: Colors.grey,
                                  child: ElevatedButton(
                                    onPressed: () {
                                      // Logic to upload rear photo
                                    },
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.white,
                                      minimumSize: Size(screenWidth * 0.9, buttonHeight * 0.8),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      padding: EdgeInsets.symmetric(horizontal: padding, vertical: padding / 2),
                                    ),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        const Icon(Icons.add_a_photo, color: Colors.grey),
                                        SizedBox(width: padding / 2),
                                        Text(
                                          'Driving License - Rear *',
                                          style: TextStyle(
                                            fontSize: bodyFontSize,
                                            color: Colors.black,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                SizedBox(height: padding),
                                TextField(
                                  decoration: InputDecoration(
                                    labelText: 'Driving License Number *',
                                    labelStyle: TextStyle(fontSize: bodyFontSize, color: Colors.black),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                  ),
                                ),
                                SizedBox(height: padding),
                                TextField(
                                  decoration: InputDecoration(
                                    labelText: 'Expiration Date *',
                                    labelStyle: TextStyle(fontSize: bodyFontSize, color: Colors.black),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                  ),
                                ),
                                SizedBox(height: padding),
                                Row(
                                  children: [
                                    Checkbox(
                                      value: false,
                                      onChanged: (bool? value) {
                                        // Logic for checkbox
                                      },
                                    ),
                                    Expanded(
                                      child: Text(
                                        'My license does not have an expiry date. (for older licenses)',
                                        style: TextStyle(fontSize: bodyFontSize, color: Colors.black),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: padding),
                      Container(
                        padding: EdgeInsets.all(padding),
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 176, 163, 230), // Light purple background
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'National Identity Card',
                              style: TextStyle(
                                fontSize: subtitleFontSize,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                            SizedBox(height: padding),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                DottedBorder(
                                  borderType: BorderType.RRect,
                                  radius: const Radius.circular(8),
                                  dashPattern: const [6, 4],
                                  strokeWidth: 2,
                                  color: Colors.grey,
                                  child: ElevatedButton(
                                    onPressed: () {
                                      // Logic to upload front photo
                                    },
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.white,
                                      minimumSize: Size(screenWidth * 0.9, buttonHeight * 0.8),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      padding: EdgeInsets.symmetric(horizontal: padding, vertical: padding / 2),
                                    ),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        const Icon(Icons.add_a_photo, color: Colors.grey),
                                        SizedBox(width: padding / 2),
                                        Text(
                                          'National Identity Card - Front *',
                                          style: TextStyle(
                                            fontSize: bodyFontSize,
                                            color: Colors.black,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                SizedBox(height: padding),
                                DottedBorder(
                                  borderType: BorderType.RRect,
                                  radius: const Radius.circular(8),
                                  dashPattern: const [6, 4],
                                  strokeWidth: 2,
                                  color: Colors.grey,
                                  child: ElevatedButton(
                                    onPressed: () {
                                      // Logic to upload rear photo
                                    },
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.white,
                                      minimumSize: Size(screenWidth * 0.9, buttonHeight * 0.8),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      padding: EdgeInsets.symmetric(horizontal: padding, vertical: padding / 2),
                                    ),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        const Icon(Icons.add_a_photo, color: Colors.grey),
                                        SizedBox(width: padding / 2),
                                        Text(
                                          'National Identity Card - Rear *',
                                          style: TextStyle(
                                            fontSize: bodyFontSize,
                                            color: Colors.black,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                SizedBox(height: padding),
                                TextField(
                                  decoration: InputDecoration(
                                    labelText: 'National Identity Card Number *',
                                    labelStyle: TextStyle(fontSize: bodyFontSize, color: Colors.black),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: padding),
                      Container(
                        padding: EdgeInsets.all(padding),
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 176, 163, 230), // Light purple background
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Billing Proof (optional)',
                              style: TextStyle(
                                fontSize: subtitleFontSize,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                            SizedBox(height: padding),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                DottedBorder(
                                  borderType: BorderType.RRect,
                                  radius: const Radius.circular(8),
                                  dashPattern: const [6, 4],
                                  strokeWidth: 2,
                                  color: Colors.grey,
                                  child: ElevatedButton(
                                    onPressed: () {
                                      // Logic to upload front photo
                                    },
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.white,
                                      minimumSize: Size(screenWidth * 0.9, buttonHeight * 0.8),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      padding: EdgeInsets.symmetric(horizontal: padding, vertical: padding / 2),
                                    ),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        const Icon(Icons.add_a_photo, color: Colors.grey),
                                        SizedBox(width: padding / 2),
                                        Text(
                                          'Billing Proof - Front',
                                          style: TextStyle(
                                            fontSize: bodyFontSize,
                                            color: Colors.black,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                SizedBox(height: padding),
                                DottedBorder(
                                  borderType: BorderType.RRect,
                                  radius: const Radius.circular(8),
                                  dashPattern: const [6, 4],
                                  strokeWidth: 2,
                                  color: Colors.grey,
                                  child: ElevatedButton(
                                    onPressed: () {
                                      // Logic to upload rear photo
                                    },
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.white,
                                      minimumSize: Size(screenWidth * 0.9, buttonHeight * 0.8),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      padding: EdgeInsets.symmetric(horizontal: padding, vertical: padding / 2),
                                    ),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        const Icon(Icons.add_a_photo, color: Colors.grey),
                                        SizedBox(width: padding / 2),
                                        Text(
                                          'Billing Proof - Rear',
                                          style: TextStyle(
                                            fontSize: bodyFontSize,
                                            color: Colors.black,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                SizedBox(height: padding),
                                TextField(
                                  decoration: InputDecoration(
                                    labelText: 'Billing Proof Number',
                                    labelStyle: TextStyle(fontSize: bodyFontSize, color: Colors.black),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: padding * 2),
                      Center(
                        child: ElevatedButton(
                          onPressed: () {
                            // Navigation logic can be added here
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color.fromARGB(255, 107, 81, 210), // We app theme purple
                            minimumSize: Size(screenWidth * 0.9, buttonHeight), // Responsive button size
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          child: Text(
                            'CONTINUE',
                            style: TextStyle(
                              fontSize: bodyFontSize,
                              color: Colors.white, // White for contrast
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: padding),
                      Center(
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => const DocumentUploadHelpPage()),
                            );
                          },
                          child: RichText(
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: 'Having trouble completing? ',
                                  style: TextStyle(fontSize: bodyFontSize, color: Colors.black),
                                ),
                                TextSpan(
                                  text: 'Let us know',
                                  style: TextStyle(fontSize: bodyFontSize, color: Colors.blue),
                                ),
                              ],
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