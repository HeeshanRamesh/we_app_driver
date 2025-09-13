import 'package:flutter/material.dart';
   import 'package:image_picker/image_picker.dart';
   import 'dart:io';

   class ProfilePhotoPage extends StatefulWidget {
     const ProfilePhotoPage({super.key});

     @override
     State<ProfilePhotoPage> createState() => _ProfilePhotoPageState();
   }

   class _ProfilePhotoPageState extends State<ProfilePhotoPage> {
     File? _image; // To store the selected image
     final ImagePicker _picker = ImagePicker();

     // Function to show the image source dialog
     Future<void> _showImageSourceDialog() async {
       showDialog(
         context: context,
         builder: (BuildContext context) {
           return AlertDialog(
             title: const Text('Choose'),
             actions: [
               TextButton(
                 onPressed: () {
                   Navigator.pop(context);
                   _pickImage(ImageSource.camera);
                 },
                 child: Row(
                   children: const [
                     Icon(Icons.camera_alt),
                     SizedBox(width: 8),
                     Text('Camera'),
                   ],
                 ),
               ),
               TextButton(
                 onPressed: () {
                   Navigator.pop(context);
                   _pickImage(ImageSource.gallery);
                 },
                 child: Row(
                   children: const [
                     Icon(Icons.photo),
                     SizedBox(width: 8),
                     Text('Gallery'),
                   ],
                 ),
               ),
               TextButton(
                 onPressed: () {
                   Navigator.pop(context);
                 },
                 child: const Text(
                   'CANCEL',
                   style: TextStyle(color: Colors.orange),
                 ),
               ),
             ],
           );
         },
       );
     }

     // Function to pick an image from the selected source
     Future<void> _pickImage(ImageSource source) async {
       final XFile? pickedFile = await _picker.pickImage(source: source);
       if (pickedFile != null) {
         setState(() {
           _image = File(pickedFile.path);
         });
       }
     }

     @override
     Widget build(BuildContext context) {
       return Scaffold(
         body: SafeArea(
           child: Center(
             child: Padding(
               padding: const EdgeInsets.all(16.0),
               child: Column(
                 mainAxisAlignment: MainAxisAlignment.center,
                 children: [
                   Container(
                     width: 150,
                     height: 150,
                     decoration: const BoxDecoration(
                       shape: BoxShape.circle,
                       color: Color.fromARGB(255, 255, 165, 0), // Orange background
                     ),
                     child: _image == null
                         ? const Icon(
                             Icons.person,
                             size: 100,
                             color: Colors.white,
                           )
                         : ClipOval(
                             child: Image.file(
                               _image!,
                               width: 150,
                               height: 150,
                               fit: BoxFit.cover,
                             ),
                           ),
                   ),
                   const SizedBox(height: 20),
                   const Text(
                     'Your profile picture is visible to everyone that interacts with you on Bounce.lk.',
                     textAlign: TextAlign.center,
                     style: TextStyle(fontSize: 16),
                   ),
                   const SizedBox(height: 20),
                   const Text(
                     'A suitable profile picture should have the following:',
                     style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                   ),
                   const SizedBox(height: 10),
                   const Text('• Full face with top of the shoulders'),
                   const Text('• Face is centered in frame'),
                   const Text('• No hats, sunglasses or masks'),
                   const Text('• Good lighting'),
                   const SizedBox(height: 30),
                   ElevatedButton(
                     onPressed: _showImageSourceDialog,
                     style: ElevatedButton.styleFrom(
                       backgroundColor: const Color.fromARGB(255, 107, 81, 210), // Purple color
                       minimumSize: const Size(200, 50),
                       shape: RoundedRectangleBorder(
                         borderRadius: BorderRadius.circular(8),
                       ),
                     ),
                     child: const Text(
                       'ADD PROFILE PICTURE',
                       style: TextStyle(fontSize: 16, color: Colors.white),
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