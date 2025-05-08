import 'package:flutter/material.dart';
import 'referral_code_page.dart'; // Import ReferralCodePage

class PersonalDetailsPage extends StatefulWidget {
  const PersonalDetailsPage({super.key});

  @override
  State<PersonalDetailsPage> createState() => _PersonalDetailsPageState();
}

class _PersonalDetailsPageState extends State<PersonalDetailsPage> {
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
                    'Personal Details',
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
                          value: 0.25,
                          backgroundColor: Colors.grey[300],
                          color: Colors.green,
                          minHeight: 10,
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                      SizedBox(width: padding),
                      Text(
                        '25% complete',
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
                        'Personal Information',
                        style: TextStyle(
                          fontSize: subtitleFontSize,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      SizedBox(height: padding / 2),
                      Text(
                        '*Required',
                        style: TextStyle(fontSize: bodyFontSize, color: Colors.red),
                      ),
                      SizedBox(height: padding),
                      Center(
                        child: Image.asset(
                          'assets/we_Logo.png', // Corrected to "Bounce" logo asset
                          height: logoHeight / 1,
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
                              'About You',
                              style: TextStyle(
                                fontSize: subtitleFontSize,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                            SizedBox(height: padding),
                            Row(
                              children: [
                                Expanded(
                                  child: TextField(
                                    decoration: InputDecoration(
                                      labelText: 'First Name *',
                                      labelStyle: TextStyle(fontSize: bodyFontSize, color: Colors.grey),
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(width: padding),
                                Expanded(
                                  child: TextField(
                                    decoration: InputDecoration(
                                      labelText: 'Last Name *',
                                      labelStyle: TextStyle(fontSize: bodyFontSize, color: Colors.grey),
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: padding),
                            TextField(
                              decoration: InputDecoration(
                                labelText: 'Date of Birth *',
                                labelStyle: TextStyle(fontSize: bodyFontSize, color: Colors.grey),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                suffixIcon: const Icon(Icons.arrow_drop_down, color: Colors.grey),
                              ),
                              readOnly: true,
                              onTap: () {
                                // Logic to pick date (e.g., showDatePicker)
                              },
                            ),
                            SizedBox(height: padding),
                            TextField(
                              decoration: InputDecoration(
                                labelText: 'Gender *',
                                labelStyle: TextStyle(fontSize: bodyFontSize, color: Colors.grey),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                suffixIcon: const Icon(Icons.arrow_drop_down, color: Colors.grey),
                              ),
                              readOnly: true,
                              onTap: () {
                                // Logic to pick gender (e.g., show dropdown)
                              },
                            ),
                            SizedBox(height: padding),
                            TextField(
                              decoration: InputDecoration(
                                labelText: 'NIC Number *',
                                labelStyle: TextStyle(fontSize: bodyFontSize, color: Colors.grey),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
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
                              'Contact Details',
                              style: TextStyle(
                                fontSize: subtitleFontSize,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                            SizedBox(height: padding),
                            TextField(
                              decoration: InputDecoration(
                                labelText: 'Secondary Mobile Number *',
                                labelStyle: TextStyle(fontSize: bodyFontSize, color: Colors.grey),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                            ),
                            SizedBox(height: padding),
                            TextField(
                              decoration: InputDecoration(
                                labelText: 'Email Address (optional)',
                                labelStyle: TextStyle(fontSize: bodyFontSize, color: Colors.grey),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                            ),
                            SizedBox(height: padding),
                            TextField(
                              decoration: InputDecoration(
                                labelText: 'Address Line 1 *',
                                labelStyle: TextStyle(fontSize: bodyFontSize, color: Colors.grey),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                            ),
                            SizedBox(height: padding),
                            TextField(
                              decoration: InputDecoration(
                                labelText: 'Address Line 2 (optional)',
                                labelStyle: TextStyle(fontSize: bodyFontSize, color: Colors.grey),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                            ),
                            SizedBox(height: padding),
                            TextField(
                              decoration: InputDecoration(
                                labelText: 'City *',
                                labelStyle: TextStyle(fontSize: bodyFontSize, color: Colors.grey),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                            ),
                            SizedBox(height: padding),
                            TextField(
                              decoration: InputDecoration(
                                labelText: 'District *',
                                labelStyle: TextStyle(fontSize: bodyFontSize, color: Colors.grey),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                            ),
                            SizedBox(height: padding),
                            TextField(
                              decoration: InputDecoration(
                                labelText: 'Province *',
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
                              'Vehicle Ownership',
                              style: TextStyle(
                                fontSize: subtitleFontSize,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                            SizedBox(height: padding),
                            Row(
                              children: [
                                Radio(
                                  value: true,
                                  groupValue: true,
                                  onChanged: (value) {},
                                ),
                                Expanded(
                                  child: Text(
                                    'I am the owner of this vehicle I am about to register.',
                                    style: TextStyle(fontSize: bodyFontSize, color: Colors.black),
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Radio(
                                  value: false,
                                  groupValue: true,
                                  onChanged: (value) {},
                                ),
                                Expanded(
                                  child: Text(
                                    'I am not the owner of the vehicle.',
                                    style: TextStyle(fontSize: bodyFontSize, color: Colors.black),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: padding),
                            GestureDetector(
                              onTap: () {
                                // Logic to navigate to document list
                              },
                              child: Text(
                                'See list of documents required',
                                style: TextStyle(fontSize: bodyFontSize, color: Colors.blue, decoration: TextDecoration.underline),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: padding * 2),
                      Center(
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => const ReferralCodePage()),
                            );
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
                              color: Colors.white, // White for contrast against purple button
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: padding),
                      Center(
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