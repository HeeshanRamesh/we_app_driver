import 'package:flutter/material.dart';
import 'registration_help_page.dart';
import 'agents_login_page.dart';
import 'verification_code_page.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  String _selectedCountryCode = '+94'; // Default country code
  String _selectedOption = 'Create Account'; // Default option for dropdown

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            color: const Color.fromARGB(255, 239, 239, 238), // Light beige background
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.all(16.0),
                  color: const Color.fromARGB(255, 107, 81, 210), // Purple background
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        icon: const Icon(Icons.arrow_back, color: Colors.white),
                        onPressed: () {},
                      ),
                      Row(
                        children: [
                          const Text(
                            'Drive with We',
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
                                MaterialPageRoute(builder: (context) => const RegistrationHelpPage()),
                              );
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                DropdownButton<String>(
                  value: _selectedOption,
                  icon: const Icon(Icons.arrow_drop_down),
                  iconSize: 24,
                  elevation: 16,
                  style: const TextStyle(color: Colors.black, fontSize: 16),
                  underline: Container(
                    height: 2,
                    color: Colors.black,
                  ),
                  onChanged: (String? newValue) {
                    setState(() {
                      _selectedOption = newValue!;
                      if (_selectedOption == 'Agent\'s Login') {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (context) => const AgentsLoginPage()),
                        );
                      }
                    });
                  },
                  items: <String>['Create Account', 'Agent\'s Login']
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
                const SizedBox(height: 40),
                Image.asset(
                  'assets/we_Logo.png', // Replace with your "We" logo asset
                  height: 80,
                ),
                const SizedBox(height: 20),
                const Text(
                  'Enter your mobile number. We\'ll text you a verification code.',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 20),
                Row(
                  children: [
                    DropdownButton<String>(
                      value: _selectedCountryCode,
                      icon: const Icon(Icons.arrow_drop_down, color: Colors.black),
                      iconSize: 24,
                      elevation: 16,
                      style: const TextStyle(color: Colors.black, fontSize: 16),
                      underline: Container(
                        height: 2,
                        color: Colors.black,
                      ),
                      onChanged: (String? newValue) {
                        setState(() {
                          _selectedCountryCode = newValue!;
                        });
                      },
                      items: <String>['+94', '+1', '+91', '+44', '+61']
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Row(
                            children: [
                              Image.asset(
                                'assets/sri_lanka_flag.png', // Replace with flag asset for +94
                                width: 20,
                                height: 15,
                              ),
                              const SizedBox(width: 4),
                              Text(value),
                            ],
                          ),
                        );
                      }).toList(),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: 'Phone Number',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                const Text(
                  'E.g.: 771324711',
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
                      MaterialPageRoute(builder: (context) => const VerificationCodePage()),
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
                    'NEXT',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}