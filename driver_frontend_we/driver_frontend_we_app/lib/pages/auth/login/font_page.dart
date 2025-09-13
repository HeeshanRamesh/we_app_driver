import 'package:driver_frontend_we_app/core/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:driver_frontend_we_app/pages/auth/login/login_page.dart'; // Ensure this path is correct and the LoginPage class exists in the file
class FrontPage extends StatefulWidget {
  const FrontPage({super.key});

  @override
  State<FrontPage> createState() => _FrontPageState();
}

class _FrontPageState extends State<FrontPage> {
  String? _selectedLanguage;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundLight,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Center(
                child: Image.asset(
                  'assets/We_Logo.png', // Ensure you have a logo.png in assets
                  height: 180,
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(20.0),
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: const BorderRadius.vertical(top: Radius.circular(24)),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Select Your Language',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: AppColors.secondaryGray,
                    ),
                  ),
                  const SizedBox(height: 12),
                  _buildLanguageOption('English'),
                  const SizedBox(height: 8),
                  _buildLanguageOption('සිංහල'),
                  const SizedBox(height: 8),
                  _buildLanguageOption('தமிழ்'),
                  const SizedBox(height: 24),
                  ElevatedButton(
                    onPressed: _selectedLanguage != null
                        ? () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => const LoginPage()),
                            );
                          }
                        : null,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 69, 57, 174),
                      disabledBackgroundColor: AppColors.secondaryGray.withOpacity(0.3),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      minimumSize: const Size(double.infinity, 48),
                    ),
                    child: Text(
                      'Continue',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: _selectedLanguage != null
                            ? AppColors.textDark
                            : AppColors.secondaryGray,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLanguageOption(String language) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedLanguage = language;
        });
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
        decoration: BoxDecoration(
          color: _selectedLanguage == language
              ? AppColors.primaryBlue.withOpacity(0.1)
              : AppColors.white,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: _selectedLanguage == language
                ? AppColors.primaryBlue
                : AppColors.secondaryGray.withOpacity(0.2),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              language,
              style: TextStyle(
                fontSize: 16,
                color: AppColors.textDark,
              ),
            ),
            if (_selectedLanguage == language)
              Icon(
                Icons.check_circle,
                color: AppColors.primaryBlue,
                size: 20,
              ),
          ],
        ),
      ),
    );
  }
}