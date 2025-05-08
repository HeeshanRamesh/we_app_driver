import 'package:flutter/material.dart';

class VerificationHelpPage extends StatefulWidget {
  const VerificationHelpPage({super.key});

  @override
  State<VerificationHelpPage> createState() => _VerificationHelpPageState();
}

class _VerificationHelpPageState extends State<VerificationHelpPage> {
  List<String> _code = ['', '', '', '']; // 4-digit code
  final TextEditingController _codeController = TextEditingController();
  final TextEditingController _issueController = TextEditingController();
  final FocusNode _focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _codeController.addListener(() {
      setState(() {
        String text = _codeController.text.replaceAll(RegExp(r'[^0-9]'), ''); // Only allow numbers
        for (int i = 0; i < _code.length; i++) {
          _code[i] = (i < text.length) ? text[i] : '';
        }
        if (text.length > 4) {
          _codeController.text = text.substring(0, 4); // Limit to 4 digits
          _codeController.selection = TextSelection.fromPosition(
            const TextPosition(offset: 4),
          );
        }
      });
    });
    // Focus the TextField when the page loads
    WidgetsBinding.instance.addPostFrameCallback((_) {
      FocusScope.of(context).requestFocus(_focusNode);
    });
  }

  @override
  void dispose() {
    _codeController.dispose();
    _issueController.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Top section with back button and help icon
              Container(
                padding: const EdgeInsets.all(16.0),
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
                            const Text(
                              'Help',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
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
                    const SizedBox(height: 10),
                    Image.asset(
                      'assets/we_Logo.png', // Replace with your "We" logo asset
                      height: 60,
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      'Verification Help',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
              // Main content
              Container(
                color: const Color.fromARGB(255, 239, 239, 238), // Light beige background
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Hi, Newbie. Are you having trouble completing the registration process?',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      'What you should do next:',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      'You will receive an SMS with a 4-digit code to the mobile number you provided. Enter the code and press the "Next" button within 5 minutes. If you didn\'t receive the code within 5 minutes, please press the "Resend" button at the bottom.',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.black87,
                      ),
                    ),
                    const SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color.fromARGB(255, 107, 81, 210), // Purple button
                        minimumSize: const Size(double.infinity, 50),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: const Text(
                        'VERIFY & CREATE ACCOUNT',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    const Text(
                      'If you still cannot proceed, tell us why below, and we will get back to you on this number: +94 764585277',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.black87,
                      ),
                    ),
                    const SizedBox(height: 10),
                    TextField(
                      controller: _issueController,
                      maxLines: 3,
                      decoration: InputDecoration(
                        hintText: 'Describe issue...',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color.fromARGB(255, 107, 81, 210), // Purple button
                        minimumSize: const Size(double.infinity, 50),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: const Text(
                        'SUBMIT',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    const Text(
                      'Alternatively, you can call us on:',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.black87,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: const Color(0xFFFF9800), // Orange background
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: const [
                          Icon(Icons.phone, color: Colors.white),
                          SizedBox(width: 8),
                          Text(
                            '+94 11 4562556',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.white,
                            ),
                          ),
                        ],
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