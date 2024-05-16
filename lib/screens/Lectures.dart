//
// //wwwwwwwwwwwwwwwwwwwwwwwwwwwwww
//
// import 'dart:io';
// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_storage/firebase_storage.dart';
//
// class Lectures extends StatefulWidget {
//   const Lectures({Key? key}) : super(key: key);
//
//   @override
//   _LecturesState createState() => _LecturesState();
// }
//
// class _LecturesState extends State<Lectures> {
//   File? _image;
//   final ImagePicker _picker = ImagePicker();
//   final FirebaseAuth _auth = FirebaseAuth.instance;
//   final FirebaseStorage _storage = FirebaseStorage.instance;
//
//   Future getImage() async {
//     final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
//
//     if (pickedFile != null) {
//       bool? confirm = await showDialog(
//         context: context,
//         builder: (BuildContext context) {
//           return AlertDialog(
//             title: Text("Confirm"),
//             content: Text("Do you want to upload this image?"),
//             actions: [
//               TextButton(
//                 onPressed: () => Navigator.of(context).pop(false),
//                 child: Text("No"),
//               ),
//               TextButton(
//                 onPressed: () => Navigator.of(context).pop(true),
//                 child: Text("Yes"),
//               ),
//             ],
//           );
//         },
//       );
//
//       if (confirm == true) {
//         // Upload the image to Firebase Storage
//         final ref = _storage.ref().child('lecture_images/${pickedFile.name}');
//         await ref.putFile(File(pickedFile.path));
//
//         // Get the image URL from Firebase Storage
//         final imageUrl = await ref.getDownloadURL();
//
//         setState(() {
//           // Update _image with the downloaded image URL
//           _image = File(pickedFile.path);
//         });
//       }
//     } else {
//       print('No image selected.');
//     }
//   }
//
//   void removeImage() {
//     setState(() {
//       _image = null;
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     final currentUser = _auth.currentUser;
//     final isAdmin = currentUser?.email == 'admin@gmail.com';
//
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(
//           'Your Lectures',
//           style: TextStyle(
//             fontSize: 18,
//             fontWeight: FontWeight.bold,
//             color: Colors.white,
//           ),
//         ),
//         centerTitle: true,
//         backgroundColor: Theme.of(context).primaryColor,
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             if (isAdmin)
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   ElevatedButton(
//                     onPressed: getImage,
//                     child: Text('Upload Image'),
//                   ),
//                   SizedBox(width: 10),
//                   ElevatedButton(
//                     onPressed: _image != null ? removeImage : null,
//                     child: Text('Remove Image'),
//                   ),
//                 ],
//               ),
//             SizedBox(height: 20),
//             Expanded(
//               child: Center(
//                 child: _image == null
//                     ? Text('No image here.')
//                     : _image!.path.startsWith('http')
//                     ? Image.network(
//                   _image!.path,
//                   fit: BoxFit.contain,
//                 )
//                     : Image.file(
//                   _image!,
//                   fit: BoxFit.contain,
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }


import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';

class Lectures extends StatefulWidget {
  const Lectures({Key? key}) : super(key: key);

  @override
  _LecturesState createState() => _LecturesState();
}

class _LecturesState extends State<Lectures> {
  Image? _image;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  void loadAssetImage() {
    setState(() {
      _image = Image.asset(
        'assets/image1.jpg',
        fit: BoxFit.contain,
      );
    });
  }

  void removeImage() {
    setState(() {
      _image = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    final currentUser = _auth.currentUser;
    final isAdmin = currentUser?.email == 'admin@gmail.com';

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Your Lectures',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (isAdmin)
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: loadAssetImage,
                    child: Text('Upload Image'),
                  ),
                  SizedBox(width: 10),
                  ElevatedButton(
                    onPressed: _image != null ? removeImage : null,
                    child: Text('Remove Image'),
                  ),
                ],
              ),
            SizedBox(height: 20),
            if (_image != null)
              Expanded(
                child: Center(
                  child: _image,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
