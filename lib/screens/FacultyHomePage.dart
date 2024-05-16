//
//
//
// import 'dart:math';
//
// import 'package:flutter/material.dart';
// import 'package:intl/intl.dart';
// import '../main.dart';
// import 'ChatRoom.dart'; // Import the ChatRoom.dart
// import 'Notice.dart'; // Import the Notice.dart
// import 'UserProfile.dart';
// import 'Settings.dart';
// import 'package:url_launcher/url_launcher.dart';
// import 'AroundCampus.dart';
// import 'AttendancePage.dart';
// import 'StatusNavigator.dart';
//
// class FacultyHomePage extends StatefulWidget {
//   final String facultyName;
//
//   const FacultyHomePage({Key? key, required this.facultyName}) : super(key: key);
//
//   @override
//   _FacultyHomePageState createState() => _FacultyHomePageState();
// }
//
// class _FacultyHomePageState extends State<FacultyHomePage> {
//   String _selectedDay = 'Monday'; // Default day is Monday
//
//   @override
//   Widget build(BuildContext context) {
//     String formattedDateTime = DateFormat('EEEE, MMMM d, y HH:mm').format(DateTime.now());
//
//     return SafeArea(
//       child: Scaffold(
//         appBar: AppBar(
//           title: Text('Hello, ${widget.facultyName}!'),
//           actions: [
//             Row(
//               children: [
//                 IconButton(
//                   icon: const Icon(Icons.notifications),
//                   onPressed: () {
//                     // Navigate to the notice page
//                     Navigator.push(
//                       context,
//                       MaterialPageRoute(builder: (context) => const NoticePage()),
//                     );
//                   },
//                 ),
//                 IconButton(
//                   icon: const Icon(Icons.check), // Icon for attendance marking
//                   onPressed: () {
//                     // Navigate to the attendance page
//                     Navigator.push(
//                       context,
//                       MaterialPageRoute(builder: (context) => const AttendancePage()),
//                     );
//                   },
//                 ),
//               ],
//             )
//           ],
//         ),
//         drawer: Drawer(
//           child: ListView(
//             padding: EdgeInsets.zero,
//             children: <Widget>[
//               // Drawer items...
//               DrawerHeader(
//                 decoration: BoxDecoration(
//                   color: Color.fromRGBO(162, 83, 169, 1.0),
//                 ),
//                 child: const Text(
//                   'Additional Features',
//                   style: TextStyle(
//                     color: Colors.white,
//                     fontSize: 24,
//                   ),
//                 ),
//               ),
//               ListTile(
//                 title: const Text('Edit Profile'),
//                 onTap: () {
//                   _showEditProfileAlert(context);
//                 },
//               ),
//               ListTile(
//                 title: const Text('Settings'),
//                 onTap: () {
//                   _showSettingsAlert(context);
//                 },
//               ),
//               _buildApplicationTile(
//                 title: 'Linkedin',
//                 url: 'https://www.linkedin.com/',
//                 context: context,
//               ),
//               _buildApplicationTile(
//                 title: 'Whatsapp',
//                 url: 'whatsapp://send?phone=<PHONE_NUMBER>',
//                 context: context,
//               ),
//               _buildApplicationTile(
//                 title: 'MS Teams',
//                 url: 'https://www.microsoft.com/en-in/microsoft-teams/log-in',
//                 context: context,
//               ),
//               _buildApplicationTile(
//                 title: 'OneDrive',
//                 url: 'https://onedrive.live.com/login/',
//                 context: context,
//               ),
//               _buildApplicationTile(
//                 title: 'SAP Academic Portal',
//                 url: 'https://sdc-sppap1.svkm.ac.in:50001/irj/portal',
//                 context: context,
//               ),
//               _buildApplicationTile(
//                 title: 'Attendance Tracker',
//                 url: 'https://portal.svkm.ac.in/usermgmt/loginSvkm',
//                 context: context,
//               ),
//               _buildApplicationTile(
//                 title: 'Faculty Feedback',
//                 url: 'https://feedback-portal-djsce.netlify.app/',
//                 context: context,
//               ),
//               ListTile(
//                 title: const Text('Around Campus'),
//                 onTap: () {
//                   // Navigate to the AroundCampus screen
//                   Navigator.push(
//                     context,
//                     MaterialPageRoute(builder: (context) => AroundCampus()),
//                   );
//                 },
//               ),
//               ListTile(
//                 title: const Text('Logout'),
//                 onTap: () {
//                   _confirmLogout(context);
//                 },
//               ),
//             ],
//           ),
//         ),
//
//
//         ],
//           ),
//         );
//         body: Column(
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//             Padding(
//               padding: const EdgeInsets.all(16.0),
//               child: Column(
//                 children: [
//                   Text(
//                     formattedDateTime,
//                     style: const TextStyle(
//                       fontSize: 18,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                   // SizedBox(height: 8),
//                   // DropdownButton<String>(
//                   //   value: _selectedDay,
//                   //   onChanged: (String? newValue) {
//                   //     setState(() {
//                   //       _selectedDay = newValue!;
//                   //     });
//                   //   },
//                   //   items: <String>['Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday']
//                   //       .map<DropdownMenuItem<String>>((String value) {
//                   //     return DropdownMenuItem<String>(
//                   //       value: value,
//                   //       child: Text(value),
//                   //     );
//                   //   }).toList(),
//                   // ),
//                 ],
//               ),
//             ),
//             Expanded(
//               child: SingleChildScrollView(
//                 child: Column(
//                   children: [
//                     Card(
//                       elevation: 4,
//                       margin: const EdgeInsets.all(16),
//                       child: Column(
//                         children: [
//                           Padding(
//                             padding: const EdgeInsets.all(8.0),
//                             child: Text(
//                               'Your Lectures'
//                               ,style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//                             ),
//                           ),
//                           SizedBox(
//                             height: MediaQuery.of(context).size.height * 0.3,
//                             child: ListView.builder(
//                               itemCount: 5,
//                               itemBuilder: (context, index) {
//                                 return ListTile(
//                                   title: Text(_generateRandomLecture()),
//                                   subtitle: Text('Time: ${_generateRandomTime()}, Classroom: ${_generateRandomClassroom()}'),
//                                 );
//                               },
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                     const SizedBox(
//                       height: 20,
//                     ),
//                     const SizedBox(
//                       width: double.infinity,
//                       child: Padding(
//                         padding: EdgeInsets.all(8.0),
//                         child: Text(
//                           'Your Study Groups',
//                           style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//                         ),
//                       ),
//                     ),
//                     Container(
//                       padding: const EdgeInsets.all(8),
//                       child: GridView.count(
//                         crossAxisCount: 2,
//                         crossAxisSpacing: 10,
//                         mainAxisSpacing: 10,
//                         shrinkWrap: true,
//                         physics: const NeverScrollableScrollPhysics(),
//                         children: [
//                           GestureDetector(
//                             onTap: () {
//                               _navigateToChatRoom(context, 'Competitive Coding');
//                             },
//                             child: _buildStudyGroupTile('Competitive Coding'),
//                           ),
//                           GestureDetector(
//                             onTap: () {
//                               _navigateToChatRoom(context, 'Interview Tips');
//                             },
//                             child: _buildStudyGroupTile('Interview Tips'),
//                           ),
//                         ],
//                       ),
//                     ),
//                     // Add the line graph here
//                   ],
//                 ),
//               ),
//             ),
//           ],
//         );
//         bottomNavigationBar: GestureDetector(
//           onTap: () {
//             Navigator.push(
//               context,
//               MaterialPageRoute(builder: (context) => StatusNavigator()),
//             );
//           },
//           child: Container(
//             color: Color.fromRGBO(162, 83, 169, 1.0),
//             padding: const EdgeInsets.symmetric(vertical: 12),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: const [
//                 Icon(Icons.info, color: Colors.white),
//                 SizedBox(width: 8),
//                 Text(
//                   'Status',
//                   style: TextStyle(color: Colors.white, fontSize: 16),
//                 ),
//               ],
//             ),
//           ),
//         );
//       ),
//     ;
//   }
//
//   String _generateRandomLecture() {
//     List<String> availableLectures = [
//       'Power Electronics',
//       'Image Analysis And Computer Vision',
//       'Big Data Analytics',
//       'Parallel And Distrubuted Systems',
//       'Soft Computing',
//       'Devops',
//       'Software Engineering',
//       'Antenna Technology',
//       'Data Structures',
//       'AR/VR',
//     ];
//     Random random = Random();
//     return availableLectures[random.nextInt(availableLectures.length)];
//   }
//
//   String _generateRandomTime() {
//     Random random = Random();
//     int hour = random.nextInt(12) + 1; // Random hour between 1 and 12
//     int minute = random.nextInt(60); // Random minute between 0 and 59
//     return '$hour:${minute.toString().padLeft(2, '0')} ${hour >= 12 ? 'PM' : 'AM'}';
//   }
//
//   String _generateRandomClassroom() {
//     Random random = Random();
//     return (random.nextInt(50) + 1).toString(); // Random classroom number between 1 and 50
//   }
//
//   void _navigateToChatRoom(BuildContext context, String groupName) {
//     Navigator.push(
//       context,
//       MaterialPageRoute(
//         builder: (context) => ChatRoom(groupName: groupName),
//       ),
//     );
//   }
//
//   Widget _buildStudyGroupTile(String groupName) {
//     return Card(
//       elevation: 4,
//       child: Padding(
//         padding: const EdgeInsets.all(8.0),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             const Icon(Icons.group, size: 40),
//             const SizedBox(height: 8),
//             Text(
//               groupName,
//               style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
//
 //3333333333333333333
//33333333333333333333333333
//





//55555555555555
//777777777

// import 'dart:math';
// import 'package:flutter/material.dart';
// import 'package:intl/intl.dart';
// import 'package:it_live/screens/Lectures.dart';
// import '../main.dart';
// import 'ChatRoom.dart'; // Import the ChatRoom.dart
// import 'Notice.dart'; // Import the Notice.dart
// import 'UserProfile.dart';
// import 'Settings.dart';
// import 'package:url_launcher/url_launcher.dart';
// import 'AroundCampus.dart';
// import 'AttendancePage.dart';
// import 'StatusNavigator.dart';
// import 'Lectures.dart';
//
// class FacultyHomePage extends StatefulWidget {
//   final String facultyName;
//
//   const FacultyHomePage({Key? key, required this.facultyName}) : super(key: key);
//
//   @override
//   _FacultyHomePageState createState() => _FacultyHomePageState();
// }
//
// class _FacultyHomePageState extends State<FacultyHomePage> {
//   String _selectedDay = 'Monday'; // Default day is Monday
//
//   @override
//   Widget build(BuildContext context) {
//     String formattedDateTime = DateFormat('EEEE, MMMM d, y HH:mm').format(DateTime.now());
//
//     return SafeArea(
//       child: Scaffold(
//         appBar: AppBar(
//           title: Text('Hello, ${widget.facultyName}!'),
//           actions: [
//             Row(
//               children: [
//                 IconButton(
//                   icon: const Icon(Icons.notifications),
//                   onPressed: () {
//                     // Navigate to the notice page
//                     Navigator.push(
//                       context,
//                       MaterialPageRoute(builder: (context) => const NoticePage()),
//                     );
//                   },
//                 ),
//                 IconButton(
//                   icon: const Icon(Icons.check), // Icon for attendance marking
//                   onPressed: () {
//                     // Navigate to the attendance page
//                     Navigator.push(
//                       context,
//                       MaterialPageRoute(builder: (context) => const AttendancePage()),
//                     );
//                   },
//                 ),
//               ],
//             )
//           ],
//         ),
//         drawer: Drawer(
//           child: ListView(
//             padding: EdgeInsets.zero,
//             children: <Widget>[
//               // Drawer items...
//               DrawerHeader(
//                 decoration: BoxDecoration(
//                   color: Color.fromRGBO(162, 83, 169, 1.0),
//                 ),
//                 child: const Text(
//                   'Additional Features',
//                   style: TextStyle(
//                     color: Colors.white,
//                     fontSize: 24,
//                   ),
//                 ),
//               ),
//               ListTile(
//                 title: const Text('Edit Profile'),
//                 onTap: () {
//                   _showEditProfileAlert(context);
//                 },
//               ),
//               ListTile(
//                 title: const Text('Settings'),
//                 onTap: () {
//                   _showSettingsAlert(context);
//                 },
//               ),
//               _buildApplicationTile(
//                 title: 'Linkedin',
//                 url: 'https://www.linkedin.com/',
//                 context: context,
//               ),
//               _buildApplicationTile(
//                 title: 'Whatsapp',
//                 url: 'whatsapp://send?phone=<PHONE_NUMBER>',
//                 context: context,
//               ),
//               _buildApplicationTile(
//                 title: 'MS Teams',
//                 url: 'https://www.microsoft.com/en-in/microsoft-teams/log-in',
//                 context: context,
//               ),
//               _buildApplicationTile(
//                 title: 'OneDrive',
//                 url: 'https://onedrive.live.com/login/',
//                 context: context,
//               ),
//               _buildApplicationTile(
//                 title: 'SAP Academic Portal',
//                 url: 'https://sdc-sppap1.svkm.ac.in:50001/irj/portal',
//                 context: context,
//               ),
//               _buildApplicationTile(
//                 title: 'Attendance Tracker',
//                 url: 'https://portal.svkm.ac.in/usermgmt/loginSvkm',
//                 context: context,
//               ),
//               _buildApplicationTile(
//                 title: 'Faculty Feedback',
//                 url: 'https://feedback-portal-djsce.netlify.app/',
//                 context: context,
//               ),
//               ListTile(
//                 title: const Text('Around Campus'),
//                 onTap: () {
//                   // Navigate to the AroundCampus screen
//                   Navigator.push(
//                     context,
//                     MaterialPageRoute(builder: (context) => AroundCampus()),
//                   );
//                 },
//               ),
//               ListTile(
//                 title: const Text('Logout'),
//                 onTap: () {
//                   _confirmLogout(context);
//                 },
//               ),
//             ],
//           ),
//         ),
//             ],
//           ),
//         ),
//         body: Column(
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//             Padding(
//               padding: const EdgeInsets.all(16.0),
//               child: Column(
//                 children: [
//                   Text(
//                     formattedDateTime,
//                     style: const TextStyle(
//                       fontSize: 18,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             Expanded(
//               child: SingleChildScrollView(
//                 child: Column(
//                   children: [
//                     Card(
//                       elevation: 4,
//                       margin: const EdgeInsets.all(16),
//                       child: Column(
//                         children: [
//                           Padding(
//                             padding: const EdgeInsets.all(8.0),
//                             child: ElevatedButton( // Replace Text with TextButton
//                               onPressed: () {
//                                 Navigator.push(
//                                   context,
//                                   MaterialPageRoute(builder: (context) => Lectures()), // Navigate to LecturesPage
//                                 );
//                               },
//                               child: Text(
//                                 'Your Lectures',
//                                 style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                     const SizedBox(
//                       height: 20,
//                     ),
//                     const SizedBox(
//                       width: double.infinity,
//                       child: Padding(
//                         padding: EdgeInsets.all(8.0),
//                         child: Text(
//                           'Your Study Groups',
//                           style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//                         ),
//                       ),
//                     ),
//                     Container(
//                       padding: const EdgeInsets.all(8),
//                       child: GridView.count(
//                         crossAxisCount: 2,
//                         crossAxisSpacing: 10,
//                         mainAxisSpacing: 10,
//                         shrinkWrap: true,
//                         physics: const NeverScrollableScrollPhysics(),
//                         children: [
//                           GestureDetector(
//                             onTap: () {
//                               _navigateToChatRoom(context, 'Competitive Coding');
//                             },
//                             child: _buildStudyGroupTile('Competitive Coding'),
//                           ),
//                           GestureDetector(
//                             onTap: () {
//                               _navigateToChatRoom(context, 'Interview Tips');
//                             },
//                             child: _buildStudyGroupTile('Interview Tips'),
//                           ),
//                           GestureDetector(
//                             onTap: () {
//                               _navigateToChatRoom(context, 'Interview Tips');
//                             },
//                             child: _buildStudyGroupTile('Notes'),
//                           ),
//                           GestureDetector(
//                             onTap: () {
//                               _navigateToChatRoom(context, 'Interview Tips');
//                             },
//                             child: _buildStudyGroupTile('ChatRoom '),
//                           ),
//                         ],
//                       ),
//                     ),
//                     // Add the line graph here
//                   ],
//                 ),
//               ),
//             ),
//           ],
//         ),
//         bottomNavigationBar: GestureDetector(
//           onTap: () {
//             Navigator.push(
//               context,
//               MaterialPageRoute(builder: (context) => StatusNavigator()),
//             );
//           },
//           child: Container(
//             color: Color.fromRGBO(162, 83, 169, 1.0),
//             padding: const EdgeInsets.symmetric(vertical: 12),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: const [
//                 Icon(Icons.info, color: Colors.white),
//                 SizedBox(width: 8),
//                 Text(
//                   'Status',
//                   style: TextStyle(color: Colors.white, fontSize: 16),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
//
//   String _generateRandomLecture() {
//     List<String> availableLectures = [
//       'Power Electronics',
//       'Image Analysis And Computer Vision',
//       'Big Data Analytics',
//       'Parallel And Distrubuted Systems',
//       'Soft Computing',
//       'Devops',
//       'Software Engineering',
//       'Antenna Technology',
//       'Data Structures',
//       'AR/VR',
//     ];
//     Random random = Random();
//     return availableLectures[random.nextInt(availableLectures.length)];
//   }
//
//   String _generateRandomTime() {
//     Random random = Random();
//     int hour = random.nextInt(12) + 1; // Random hour between 1 and 12
//     int minute = random.nextInt(60); // Random minute between 0 and 59
//     return '$hour:${minute.toString().padLeft(2, '0')} ${hour >= 12 ? 'PM' : 'AM'}';
//   }
//
//   String _generateRandomClassroom() {
//     Random random = Random();
//     return (random.nextInt(50) + 1).toString(); // Random classroom number between 1 and 50
//   }
//
//   void _navigateToChatRoom(BuildContext context, String groupName) {
//     Navigator.push(
//       context,
//       MaterialPageRoute(
//         builder: (context) => ChatRoom(groupName: groupName),
//       ),
//     );
//   }
//
//   Widget _buildStudyGroupTile(String groupName) {
//     return Card(
//       elevation: 4,
//       child: Padding(
//         padding: const EdgeInsets.all(8.0),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             const Icon(Icons.group, size: 40),
//             const SizedBox(height: 8),
//             Text(
//               groupName,
//               style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
//
// Future<bool> _onBackPressed(BuildContext context) async {
//   bool logoutConfirmed = await showDialog(
//     context: context,
//     builder: (BuildContext context) {
//       return AlertDialog(
//         title: const Text('Logout'),
//         content: const Text('Do you want to logout?'),
//         actions: [
//           TextButton(
//             onPressed: () {
//               Navigator.pop(context, false); // Logout not confirmed
//             },
//             child: const Text('No'),
//           ),
//           TextButton(
//             onPressed: () {
//               Navigator.pop(context, true); // Logout confirmed
//             },
//             child: const Text('Yes'),
//           ),
//         ],
//       );
//     },
//   );
//
//   if (logoutConfirmed ?? false) {
//     // If logout is confirmed, navigate to main.dart
//     Navigator.pushReplacement(
//       context,
//       MaterialPageRoute(builder: (context) => const MyApp()), // Replace MyApp with your main.dart class name
//     );
//   }
//
//   return logoutConfirmed ?? false;
// }
//
//
// void _showEditProfileAlert(BuildContext context) {
//   Navigator.push(
//     context,
//     MaterialPageRoute(builder: (context) => const UserProfile()),
//   );
// }
//
//
// void _showSettingsAlert(BuildContext context) {
//   Navigator.push(
//     context,
//     MaterialPageRoute(builder: (context) => const SettingsPage()),
//   );
// }
//
// void _openApplication(String url, String appName, BuildContext context) async {
//   // Show an alert window asking the user if they want to open the application
//   showDialog(
//     context: context,
//     builder: (BuildContext context) {
//       return AlertDialog(
//         title: Text('Open $appName?'),
//         content: Text('Do you want to open $appName?'),
//         actions: <Widget>[
//           TextButton(
//             onPressed: () {
//               Navigator.of(context).pop();
//             },
//             child: const Text('Cancel'),
//           ),
//           TextButton(
//             onPressed: () async {
//               if (await canLaunch(url)) {
//                 await launch(url);
//               } else {
//                 // Handle error
//                 showDialog(
//                   context: context,
//                   builder: (BuildContext context) {
//                     return AlertDialog(
//                       title: Text('Error'),
//                       content: Text('Could not launch $appName.'),
//                       actions: <Widget>[
//                         TextButton(
//                           onPressed: () {
//                             Navigator.of(context).pop();
//                           },
//                           child: const Text('OK'),
//                         ),
//                       ],
//                     );
//                   },
//                 );
//               }
//               Navigator.of(context).pop();
//             },
//             child: const Text('Open'),
//           ),
//         ],
//       );
//     },
//   );
// }
//
// Widget _buildApplicationTile({required String title, required String url, required BuildContext context}) {
//   return ListTile(
//     title: Text(title),
//     onTap: () {
//       _openApplication(url, title, context);
//     },
//   );
// }
//
// void _confirmLogout(BuildContext context) {
//   showDialog(
//     context: context,
//     builder: (BuildContext context) {
//       return AlertDialog(
//         title: const Text('Logout'),
//         content: const Text('Do you want to logout?'),
//         actions: [
//           TextButton(
//             onPressed: () {
//               Navigator.pop(context); // Cancel logout
//             },
//             child: const Text('No'),
//           ),
//           TextButton(
//             onPressed: () {
//               Navigator.pop(context);
//               // Confirm logout
//               Navigator.pushReplacement(
//                 context,
//                 MaterialPageRoute(builder: (context) => const MyApp()),
//               );
//             },
//             child: const Text('Yes'),
//           ),
//         ],
//       );
//     },
//   );
// }
//
//
// Widget _buildStudyGroupTile(String groupName) {
//   return Card(
//     elevation: 4,
//     child: Padding(
//       padding: const EdgeInsets.all(8.0),
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           const Icon(Icons.group, size: 40),
//           const SizedBox(height: 8),
//           Text(
//             groupName,
//             style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
//           ),
//         ],
//       ),
//     ),
//   );
// }
//
// void _navigateToChatRoom(BuildContext context, String groupName) {
//   Navigator.push(
//     context,
//     MaterialPageRoute(
//       builder: (context) => ChatRoom(groupName: groupName),
//     ),
//   );
// }



//66666666666666666666
//777777777777777777777777

// import 'package:flutter/material.dart';
// import 'package:intl/intl.dart';
// import '../main.dart';
// import 'ChatRoom.dart'; // Import the ChatRoom.dart
// import 'Notice.dart'; // Import the Notice.dart
// import 'UserProfile.dart';
// import 'Settings.dart';
// import 'package:flutter/material.dart';
// import 'package:intl/intl.dart' show DateFormat;
// import 'package:url_launcher/url_launcher.dart';
// import 'AroundCampus.dart';
// import 'AttendancePage.dart';
// import 'StatusNavigator.dart';
// import 'Lectures.dart';
//
//
//
// class FacultyHomePage extends StatelessWidget {
//   final String facultyName;
//
//   const FacultyHomePage({Key? key, required this.facultyName}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     String formattedDateTime = DateFormat('EEEE, MMMM d, y HH:mm').format(DateTime.now());
//
//     return SafeArea(
//       child: Scaffold(
//         appBar: AppBar(
//           title: Text('Hello, Faculty!'),
//           actions: [
//             Row(
//               children: [
//                 IconButton(
//                   icon: const Icon(Icons.notifications),
//                   onPressed: () {
//                     // Navigate to the notice page
//                     Navigator.push(
//                       context,
//                       MaterialPageRoute(builder: (context) => const NoticePage()),
//                     );
//                   },
//                 ),
//                 IconButton(
//                   icon: const Icon(Icons.check), // Icon for attendance marking
//                   onPressed: () {
//                     // Navigate to the attendance page
//                     Navigator.push(
//                       context,
//                       MaterialPageRoute(builder: (context) => const AttendancePage()),
//                     );
//                   },
//                 ),
//               ],
//             )
//           ],
//         ),
//         drawer: Drawer(
//           child: ListView(
//             padding: EdgeInsets.zero,
//             children: <Widget>[
//               DrawerHeader(
//                 decoration: BoxDecoration(
//                   color: Color.fromRGBO(162, 83, 169, 1.0),
//                 ),
//                 child: const Text(
//                   'Additionaal Features',
//                   style: TextStyle(
//                     color: Colors.white,
//                     fontSize: 24,
//                   ),
//                 ),
//               ),
//               ListTile(
//                 title: const Text('Edit Profile'),
//                 onTap: () {
//                   _showEditProfileAlert(context);
//                 },
//               ),
//               ListTile(
//                 title: const Text('Settings'),
//                 onTap: () {
//                   _showSettingsAlert(context);
//                 },
//               ),
//               _buildApplicationTile(
//                 title: 'Linkedin',
//                 url: 'https://www.linkedin.com/',
//                 context: context,
//               ),
//               _buildApplicationTile(
//                 title: 'Whatsapp',
//                 url: 'whatsapp://send?phone=<PHONE_NUMBER>',
//                 context: context,
//               ),
//               _buildApplicationTile(
//                 title: 'MS Teams',
//                 url: 'https://www.microsoft.com/en-in/microsoft-teams/log-in',
//                 context: context,
//               ),
//               _buildApplicationTile(
//                 title: 'OneDrive',
//                 url: 'https://onedrive.live.com/login/',
//                 context: context,
//               ),
//               _buildApplicationTile(
//                 title: 'SAP Academic Portal',
//                 url: 'https://sdc-sppap1.svkm.ac.in:50001/irj/portal',
//                 context: context,
//               ),
//               _buildApplicationTile(
//                 title: 'Attendance Tracker',
//                 url: 'https://portal.svkm.ac.in/usermgmt/loginSvkm',
//                 context: context,
//               ),
//               _buildApplicationTile(
//                 title: 'Faculty Feedback',
//                 url: 'https://feedback-portal-djsce.netlify.app/',
//                 context: context,
//               ),
//               ListTile(
//                 title: const Text('Around Campus'),
//                 onTap: () {
//                   // Navigate to the AroundCampus screen
//                   Navigator.push(
//                     context,
//                     MaterialPageRoute(builder: (context) => AroundCampus()),
//                   );
//                 },
//               ),
//               ListTile(
//                 title: const Text('Logout'),
//                 onTap: () {
//                   _confirmLogout(context);
//                 },
//               ),
//             ],
//           ),
//         ),
//
//         body: Column(
//           crossAxisAlignment: CrossAxisAlignment.stretch,
//           children: [
//             Padding(
//               padding: const EdgeInsets.all(16.0),
//               child: Text(
//                 formattedDateTime,
//                 style: const TextStyle(
//                   fontSize: 18,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//             ),
//             Expanded(
//               child: SingleChildScrollView(
//                 child: Column(
//                   children: [
//                     Card(
//                       elevation: 4,
//                       margin: const EdgeInsets.all(16),
//                       child: Column(
//                         children: [
//                           // const Padding(
//                           //   padding: EdgeInsets.all(8.0),
//                           //   child: Text(
//                           //     'Your Lectures',
//                           //     style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//                           //   ),
//                           // ),
//                           Padding(
//                             padding: const EdgeInsets.all(8.0),
//                             child: ElevatedButton(
//                               onPressed: () {
//                                 Navigator.push(
//                                   context,
//                                   MaterialPageRoute(builder: (context) => Lectures()),
//                                 );
//                               },
//                               child: Text(
//                                 'Your Lectures',
//                                 style: TextStyle(
//                                   fontSize: 18,
//                                   fontWeight: FontWeight.bold,
//                                 ),
//                               ),
//                             ),
//                           ),
//                           SizedBox(
//                             height: MediaQuery.of(context).size.height * 0.3,
//                             child: ListView(
//                               children: const [
//                                 ListTile(
//                                   title: Text('Power Electronics'),
//                                   subtitle: Text('Time: 7:00 AM - 8:00 AM, Classroom: 45'),
//                                 ),
//                                 ListTile(
//                                   title: Text('Random Signals'),
//                                   subtitle: Text('Time: 8:00 AM - 9:00 AM, Classroom: 33'),
//                                 ),
//                                 ListTile(
//                                   title: Text('Radio Technology'),
//                                   subtitle: Text('Time: 9:00 AM - 10:00 AM, Classroom: 63'),
//                                 ),
//                                 ListTile(
//                                   title: Text('Embedded Electronics'),
//                                   subtitle: Text('Time: 10:00 AM - 11:00 AM, Classroom: 65'),
//                                 ),
//                                 ListTile(
//                                   title: Text('Soft Computing'),
//                                   subtitle: Text('Time: 11:00 AM - 12:00 PM, Classroom: 66'),
//                                 ),
//                                 ListTile(
//                                   title: Text('Analog And Digital'),
//                                   subtitle: Text('Time: 12:00 PM - 1:00 PM, Classroom: 55'),
//                                 ),
//                                 ListTile(
//                                   title: Text('High Voltage Electronics'),
//                                   subtitle: Text('Time: 1:00 PM - 2:00 PM, Classroom: 43'),
//                                 ),
//                                 ListTile(
//                                   title: Text('Antenna Technology '),
//                                   subtitle: Text('Time: 2:00 PM - 3:00 PM, Classroom: 33'),
//                                 ),
//                                 ListTile(
//                                   title: Text('Remote Control'),
//                                   subtitle: Text('Time: 3:00 PM - 4:00 PM, Classroom: 62'),
//                                 ),
//                                 ListTile(
//                                   title: Text('AR/VR'),
//                                   subtitle: Text('Time: 4:00 PM - 5:00 PM, Classroom: 35'),
//                                 ),
//                               ],
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                     const SizedBox(
//                       height: 20,
//                     ),
//                     const SizedBox(
//                       width: double.infinity,
//                       child: Padding(
//                         padding: EdgeInsets.all(8.0),
//                         child: Text(
//                           'Your Study Groups',
//                           style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//                         ),
//                       ),
//                     ),
//
//                     Container(
//                       padding: const EdgeInsets.all(8),
//                       child: GridView.count(
//                         crossAxisCount: 2,
//                         crossAxisSpacing: 10,
//                         mainAxisSpacing: 10,
//                         shrinkWrap: true,
//                         physics: const NeverScrollableScrollPhysics(),
//                         children: [
//                           GestureDetector(
//                             onTap: () {
//                               _navigateToChatRoom(context, 'Competitive Coding');
//                             },
//                             child: _buildStudyGroupTile('Competitive Coding'),
//                           ),
//                           GestureDetector(
//                             onTap: () {
//                               _navigateToChatRoom(context, 'Interview Tips');
//                             },
//                             child: _buildStudyGroupTile('Interview Tips'),
//                           ),
//                           GestureDetector(
//                             onTap: () {
//                               _navigateToChatRoom(context, 'Interview Tips');
//                             },
//                             child: _buildStudyGroupTile('Notes'),
//                           ),
//                           GestureDetector(
//                             onTap: () {
//                               _navigateToChatRoom(context, 'Interview Tips');
//                             },
//                             child: _buildStudyGroupTile('Chat Room'),
//                           ),
//                         ],
//                       ),
//                     ),
//                     // Add the line graph here
//                   ],
//                 ),
//               ),
//             ),
//           ],
//         ),
//
//         bottomNavigationBar: GestureDetector(
//           onTap: () {
//             Navigator.push(
//               context,
//               MaterialPageRoute(builder: (context) => StatusNavigator()),
//             );
//           },
//           child: Container(
//             color: Color.fromRGBO(162, 83, 169, 1.0),
//             padding: const EdgeInsets.symmetric(vertical: 12),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: const [
//                 Icon(Icons.info, color: Colors.white),
//                 SizedBox(width: 8),
//                 Text(
//                   'Status',
//                   style: TextStyle(color: Colors.white, fontSize: 16),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
//
// // Rest of the code...
// }
//
//
// Future<bool> _onBackPressed(BuildContext context) async {
//   bool logoutConfirmed = await showDialog(
//     context: context,
//     builder: (BuildContext context) {
//       return AlertDialog(
//         title: const Text('Logout'),
//         content: const Text('Do you want to logout?'),
//         actions: [
//           TextButton(
//             onPressed: () {
//               Navigator.pop(context, false); // Logout not confirmed
//             },
//             child: const Text('No'),
//           ),
//           TextButton(
//             onPressed: () {
//               Navigator.pop(context, true); // Logout confirmed
//             },
//             child: const Text('Yes'),
//           ),
//         ],
//       );
//     },
//   );
//
//   if (logoutConfirmed ?? false) {
//     // If logout is confirmed, navigate to main.dart
//     Navigator.pushReplacement(
//       context,
//       MaterialPageRoute(builder: (context) => const MyApp()), // Replace MyApp with your main.dart class name
//     );
//   }
//
//   return logoutConfirmed ?? false;
// }
//
//
// void _showEditProfileAlert(BuildContext context) {
//   Navigator.push(
//     context,
//     MaterialPageRoute(builder: (context) => const UserProfile()),
//   );
// }
//
//
// void _showSettingsAlert(BuildContext context) {
//   Navigator.push(
//     context,
//     MaterialPageRoute(builder: (context) => const SettingsPage()),
//   );
// }
//
// void _openApplication(String url, String appName, BuildContext context) async {
//   // Show an alert window asking the user if they want to open the application
//   showDialog(
//     context: context,
//     builder: (BuildContext context) {
//       return AlertDialog(
//         title: Text('Open $appName?'),
//         content: Text('Do you want to open $appName?'),
//         actions: <Widget>[
//           TextButton(
//             onPressed: () {
//               Navigator.of(context).pop();
//             },
//             child: const Text('Cancel'),
//           ),
//           TextButton(
//             onPressed: () async {
//               if (await canLaunch(url)) {
//                 await launch(url);
//               } else {
//                 // Handle error
//                 showDialog(
//                   context: context,
//                   builder: (BuildContext context) {
//                     return AlertDialog(
//                       title: Text('Error'),
//                       content: Text('Could not launch $appName.'),
//                       actions: <Widget>[
//                         TextButton(
//                           onPressed: () {
//                             Navigator.of(context).pop();
//                           },
//                           child: const Text('OK'),
//                         ),
//                       ],
//                     );
//                   },
//                 );
//               }
//               Navigator.of(context).pop();
//             },
//             child: const Text('Open'),
//           ),
//         ],
//       );
//     },
//   );
// }
//
// Widget _buildApplicationTile({required String title, required String url, required BuildContext context}) {
//   return ListTile(
//     title: Text(title),
//     onTap: () {
//       _openApplication(url, title, context);
//     },
//   );
// }
//
// void _confirmLogout(BuildContext context) {
//   showDialog(
//     context: context,
//     builder: (BuildContext context) {
//       return AlertDialog(
//         title: const Text('Logout'),
//         content: const Text('Do you want to logout?'),
//         actions: [
//           TextButton(
//             onPressed: () {
//               Navigator.pop(context); // Cancel logout
//             },
//             child: const Text('No'),
//           ),
//           TextButton(
//             onPressed: () {
//               Navigator.pop(context);
//               // Confirm logout
//               Navigator.pushReplacement(
//                 context,
//                 MaterialPageRoute(builder: (context) => const MyApp()),
//               );
//             },
//             child: const Text('Yes'),
//           ),
//         ],
//       );
//     },
//   );
// }
//
//
// Widget _buildStudyGroupTile(String groupName) {
//   return Card(
//     elevation: 4,
//     child: Padding(
//       padding: const EdgeInsets.all(8.0),
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           const Icon(Icons.group, size: 40),
//           const SizedBox(height: 8),
//           Text(
//             groupName,
//             style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
//           ),
//         ],
//       ),
//     ),
//   );
// }
//
// void _navigateToChatRoom(BuildContext context, String groupName) {
//   Navigator.push(
//     context,
//     MaterialPageRoute(
//       builder: (context) => ChatRoom(groupName: groupName),
//     ),
//   );
// }

//44444444444444444444
//ooooooooooooooooooooo

// import 'package:flutter/material.dart';
// import '../main.dart';
// import 'ChatRoom.dart';
// import 'Notice.dart';
// import 'UserProfile.dart';
// import 'Settings.dart';
// import 'package:flutter/material.dart';
// import 'package:intl/intl.dart' show DateFormat;
// import 'package:url_launcher/url_launcher.dart';
// import 'AroundCampus.dart';
// import 'AttendancePage.dart';
// import 'StatusNavigator.dart';
// import 'dart:math';
//
// class FacultyHomePage extends StatefulWidget {
//   final String facultyName;
//
//   const FacultyHomePage({Key? key, required this.facultyName}) : super(key: key);
//
//   @override
//   _FacultyHomePageState createState() => _FacultyHomePageState();
// }
//
// class _FacultyHomePageState extends State<FacultyHomePage> {
//   late String formattedDateTime;
//   late String selectedDay = "Monday"; // Default selected day
//
//   final List<String> days = ["Monday", "Tuesday", "Wednesday", "Thursday", "Friday"];
//   Map<String, List<String>> lecturesByDay = {
//     "Monday": [
//       'Power Electronics',
//       'Random Signals',
//       'Radio Technology',
//       'Embedded Electronics',
//       'Soft Computing',
//       'Analog And Digital',
//       'High Voltage Electronics',
//       'Antenna Technology',
//       'Remote Control',
//       'AR/VR'
//     ],
//     "Tuesday": [
//       'Analog And Digital',
//       'High Voltage Electronics',
//       'Antenna Technology',
//       'Remote Control',
//       'AR/VR',
//       'Random Signals',
//       'Radio Technology',
//       'Embedded Electronics',
//       'Soft Computing',
//
//     ],
//     "Wednesday": [
//       'Random Signals',
//       'Radio Technology',
//       'Embedded Electronics',
//       'Soft Computing',
//       'Analog And Digital',
//       'High Voltage Electronics',
//       'Antenna Technology',
//       'Remote Control',
//       'AR/VR'
//     ],
//     "Thursday": [
//       'Random Signals',
//       'Radio Technology',
//       'Embedded Electronics',
//       'Soft Computing',
//       'Analog And Digital',
//       'High Voltage Electronics',
//       'Antenna Technology',
//       'Remote Control',
//       'AR/VR'
//     ],
//     "Friday": [
//       'Random Signals',
//       'Radio Technology',
//       'Embedded Electronics',
//       'Soft Computing',
//       'Analog And Digital',
//       'High Voltage Electronics',
//       'Antenna Technology',
//       'Remote Control',
//       'AR/VR'
//     ],
//   };
//
//   @override
//   void initState() {
//     super.initState();
//     formattedDateTime = DateFormat('EEEE, MMMM d, y HH:mm').format(DateTime.now());
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         appBar: AppBar(
//           title: Text('Hello, Faculty!'),
//           actions: [
//             Row(
//               children: [
//                 IconButton(
//                   icon: const Icon(Icons.notifications),
//                   onPressed: () {
//                     // Navigate to the notice page
//                     Navigator.push(
//                       context,
//                       MaterialPageRoute(builder: (context) => const NoticePage()),
//                     );
//                   },
//                 ),
//                 IconButton(
//                   icon: const Icon(Icons.check), // Icon for attendance marking
//                   onPressed: () {
//                     // Navigate to the attendance page
//                     Navigator.push(
//                       context,
//                       MaterialPageRoute(builder: (context) => const AttendancePage()),
//                     );
//                   },
//                 ),
//               ],
//             )
//           ],
//         ),
//         drawer: Drawer(
//           child: ListView(
//             padding: EdgeInsets.zero,
//             children: <Widget>[
//               DrawerHeader(
//                 decoration: BoxDecoration(
//                   color: Color.fromRGBO(162, 83, 169, 1.0),
//                 ),
//                 child: const Text(
//                   'Additional Features',
//                   style: TextStyle(
//                     color: Colors.white,
//                     fontSize: 24,
//                   ),
//                 ),
//               ),
//               ListTile(
//                 title: const Text('Edit Profile'),
//                 onTap: () {
//                   _showEditProfileAlert(context);
//                 },
//               ),
//               ListTile(
//                 title: const Text('Settings'),
//                 onTap: () {
//                   _showSettingsAlert(context);
//                 },
//               ),
//               _buildApplicationTile(
//                 title: 'Linkedin',
//                 url: 'https://www.linkedin.com/',
//                 context: context,
//               ),
//               _buildApplicationTile(
//                 title: 'Whatsapp',
//                 url: 'whatsapp://send?phone=<PHONE_NUMBER>',
//                 context: context,
//               ),
//               _buildApplicationTile(
//                 title: 'MS Teams',
//                 url: 'https://www.microsoft.com/en-in/microsoft-teams/log-in',
//                 context: context,
//               ),
//               _buildApplicationTile(
//                 title: 'OneDrive',
//                 url: 'https://onedrive.live.com/login/',
//                 context: context,
//               ),
//               _buildApplicationTile(
//                 title: 'SAP Academic Portal',
//                 url: 'https://sdc-sppap1.svkm.ac.in:50001/irj/portal',
//                 context: context,
//               ),
//               _buildApplicationTile(
//                 title: 'Attendance Tracker',
//                 url: 'https://portal.svkm.ac.in/usermgmt/loginSvkm',
//                 context: context,
//               ),
//               _buildApplicationTile(
//                 title: 'Faculty Feedback',
//                 url: 'https://feedback-portal-djsce.netlify.app/',
//                 context: context,
//               ),
//               ListTile(
//                 title: const Text('Around Campus'),
//                 onTap: () {
//                   // Navigate to the AroundCampus screen
//                   Navigator.push(
//                     context,
//                     MaterialPageRoute(builder: (context) => AroundCampus()),
//                   );
//                 },
//               ),
//               ListTile(
//                 title: const Text('Logout'),
//                 onTap: () {
//                   _confirmLogout(context);
//                 },
//               ),
//             ],
//           ),
//         ),
//
//         body: Column(
//           crossAxisAlignment: CrossAxisAlignment.stretch,
//           children: [
//             Center(
//               child: Column(
//                 children: [
//                   Padding(
//                     padding: const EdgeInsets.all(16.0),
//                     child: DropdownButton<String>(
//                       value: selectedDay,
//                       onChanged: (String? newValue) {
//                         setState(() {
//                           selectedDay = newValue!;
//                         });
//                       },
//                       items: days.map<DropdownMenuItem<String>>((String value) {
//                         return DropdownMenuItem<String>(
//                           value: value,
//                           child: Text(value),
//                         );
//                       }).toList(),
//                     ),
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: Text(
//                       formattedDateTime,
//                       style: const TextStyle(
//                         fontSize: 18,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             Expanded(
//               child: SingleChildScrollView(
//                 child: Column(
//                   children: [
//                     Card(
//                       elevation: 4,
//                       margin: const EdgeInsets.all(16),
//                       child: Column(
//                         children: [
//                           SizedBox(
//                             height: MediaQuery.of(context).size.height * 0.3,
//                             child: ListView.builder(
//                               itemCount: lecturesByDay[selectedDay]!.length,
//                               itemBuilder: (BuildContext context, int index) {
//                                 return ListTile(
//                                   title: Text(lecturesByDay[selectedDay]![index]),
//                                   subtitle: Text('Time: ${_generateRandomTime()}, Classroom: ${_generateRandomClassroom()}'),
//                                 );
//                               },
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                     const SizedBox(
//                       height: 20,
//                     ),
//                     const SizedBox(
//                       width: double.infinity,
//                       child: Padding(
//                         padding: EdgeInsets.all(8.0),
//                         child: Text(
//                           'Your Study Groups',
//                           style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//                         ),
//                       ),
//                     ),
//
//                     Container(
//                       padding: const EdgeInsets.all(8),
//                       child: GridView.count(
//                         crossAxisCount: 2,
//                         crossAxisSpacing: 10,
//                         mainAxisSpacing: 10,
//                         shrinkWrap: true,
//                         physics: const NeverScrollableScrollPhysics(),
//                         children: [
//                           GestureDetector(
//                             onTap: () {
//                               _navigateToChatRoom(context, 'Competitive Coding');
//                             },
//                             child: _buildStudyGroupTile('Competitive Coding'),
//                           ),
//                           GestureDetector(
//                             onTap: () {
//                               _navigateToChatRoom(context, 'Interview Tips');
//                             },
//                             child: _buildStudyGroupTile('Interview Tips'),
//                           ),
//                           GestureDetector(
//                             onTap: () {
//                               _navigateToChatRoom(context, 'Interview Tips');
//                             },
//                             child: _buildStudyGroupTile('Notes'),
//                           ),
//                           GestureDetector(
//                             onTap: () {
//                               _navigateToChatRoom(context, 'Interview Tips');
//                             },
//                             child: _buildStudyGroupTile('Chat Room'),
//                           ),
//                         ],
//                       ),
//                     ),
//                     // Add the line graph here
//                   ],
//                 ),
//               ),
//             ),
//           ],
//         ),
//
//         bottomNavigationBar: GestureDetector(
//           onTap: () {
//             Navigator.push(
//               context,
//               MaterialPageRoute(builder: (context) => StatusNavigator()),
//             );
//           },
//           child: Container(
//             color: Color.fromRGBO(162, 83, 169, 1.0),
//             padding: const EdgeInsets.symmetric(vertical: 12),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: const [
//                 Icon(Icons.info, color: Colors.white),
//                 SizedBox(width: 8),
//                 Text(
//                   'Status',
//                   style: TextStyle(color: Colors.white, fontSize: 16),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
//
//   String _generateRandomTime() {
//     final Random random = Random();
//     final int hour = random.nextInt(12) + 1; // Random hour between 1 and 12
//     final int minute = random.nextInt(60); // Random minute between 0 and 59
//     final String meridian = random.nextBool() ? 'AM' : 'PM'; // Randomly select AM or PM
//     return '$hour:${minute.toString().padLeft(2, '0')} $meridian';
//   }
//
//   int _generateRandomClassroom() {
//     final Random random = Random();
//     return random.nextInt(100) + 1; // Random classroom between 1 and 100
//   }
//
//   void _showEditProfileAlert(BuildContext context) {
//     Navigator.push(
//       context,
//       MaterialPageRoute(builder: (context) => const UserProfile()),
//     );
//   }
//
//   void _showSettingsAlert(BuildContext context) {
//     Navigator.push(
//       context,
//       MaterialPageRoute(builder: (context) => const SettingsPage()),
//     );
//   }
//
//   void _openApplication(String url, String appName, BuildContext context) async {
//     // Show an alert window asking the user if they want to open the application
//     showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         return AlertDialog(
//           title: Text('Open $appName?'),
//           content: Text('Do you want to open $appName?'),
//           actions: <Widget>[
//             TextButton(
//               onPressed: () {
//                 Navigator.of(context).pop();
//               },
//               child: const Text('Cancel'),
//             ),
//             TextButton(
//               onPressed: () async {
//                 if (await canLaunch(url)) {
//                   await launch(url);
//                 } else {
//                   // Handle error
//                   showDialog(
//                     context: context,
//                     builder: (BuildContext context) {
//                       return AlertDialog(
//                         title: Text('Error'),
//                         content: Text('Could not launch $appName.'),
//                         actions: <Widget>[
//                           TextButton(
//                             onPressed: () {
//                               Navigator.of(context).pop();
//                             },
//                             child: const Text('OK'),
//                           ),
//                         ],
//                       );
//                     },
//                   );
//                 }
//                 Navigator.of(context).pop();
//               },
//               child: const Text('Open'),
//             ),
//           ],
//         );
//       },
//     );
//   }
//
//   Widget _buildApplicationTile({required String title, required String url, required BuildContext context}) {
//     return ListTile(
//       title: Text(title),
//       onTap: () {
//         _openApplication(url, title, context);
//       },
//     );
//   }
//
//   void _confirmLogout(BuildContext context) {
//     showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         return AlertDialog(
//           title: const Text('Logout'),
//           content: const Text('Do you want to logout?'),
//           actions: [
//             TextButton(
//               onPressed: () {
//                 Navigator.pop(context); // Cancel logout
//               },
//               child: const Text('No'),
//             ),
//             TextButton(
//               onPressed: () {
//                 Navigator.pop(context);
//                 // Confirm logout
//                 Navigator.pushReplacement(
//                   context,
//                   MaterialPageRoute(builder: (context) => const MyApp()),
//                 );
//               },
//               child: const Text('Yes'),
//             ),
//           ],
//         );
//       },
//     );
//   }
//
//   Widget _buildStudyGroupTile(String groupName) {
//     return Card(
//       elevation: 4,
//       child: Padding(
//         padding: const EdgeInsets.all(8.0),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             const Icon(Icons.group, size: 40),
//             const SizedBox(height: 8),
//             Text(
//               groupName,
//               style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
//
//   void _navigateToChatRoom(BuildContext context, String groupName) {
//     Navigator.push(
//       context,
//       MaterialPageRoute(
//         builder: (context) => ChatRoom(groupName: groupName),
//       ),
//     );
//   }
// }
//


 //777777777777777777777//0
//9999999999999999999999999


import 'package:flutter/material.dart';
import '../main.dart';
import 'ChatRoom.dart';
import 'Notice.dart';
import 'UserProfile.dart';
import 'Settings.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart' show DateFormat;
import 'package:url_launcher/url_launcher.dart';
import 'AroundCampus.dart';
import 'AttendancePage.dart';
import 'StatusNavigator.dart';
import 'dart:math';
import 'ChatRoom2.dart';

class FacultyHomePage extends StatefulWidget {
  final String facultyName;

  const FacultyHomePage({Key? key, required this.facultyName}) : super(key: key);

  @override
  _FacultyHomePageState createState() => _FacultyHomePageState();
}

class _FacultyHomePageState extends State<FacultyHomePage> {
  late String formattedDateTime;
  late String selectedDay = "Monday"; // Default selected day

  final List<String> days = ["Monday", "Tuesday", "Wednesday", "Thursday", "Friday"];
  Map<String, List<String>> lecturesByDay = {
    "Monday": [
      'Honours Lab , Time: 8:00am - 10:00 am ,  Class : 66',
      'BDA Lab , Time:10 am - 12:00  pm ,  Class : 66',
      'BREAK :  12 :00 pm- 12: 30 pm',
      'SE Lec , Time: 12:30pm - 01:30 pm ,  Class : 66',
      'IACV Lec , Time: 01:30pm - 02:30 pm ,  Class : 66',
    ],
    "Tuesday": [
      'Minors Lab , Time: 8:00am - 10:00 am ,   Class : 66',
      'IACV Lab , Time:10 am - 12:00  pm ,  Class : 66',
      'BREAK :  12 :00 pm- 12: 30 pm',
      'IACV Lec , Time: 12:30pm - 01:30 pm ,  Class : 66',
      'PDC Lec , Time: 01:30pm - 02:30 pm ,  Class : 66',
      'SC Lec , Time: 02:30pm - 03:30 pm ,  Class : 66',


    ],
    "Wednesday": [
      'SC Lec , Time:10 am - 11:00  pm ,   Class : 66',
      'SE Lec , Time: 11:00pm - 12:00 pm ,   Class : 66',
      'PDC Lec , Time: 12:00 pm  - 01:00 pm ,  Class : 66',
      'BREAK :  01:00 pm- 01: 30 pm',
      'BDA Lec , Time: 01:30 - 2:30 pm ,   Class : 66',
      'EVS  Lec , Time: 02:30pm - 03:30 pm ,  Class : 66',
      'SE LAB , Time: 3:30pm - 5:00 pm ,  Class : 66',
    ],
    "Thursday": [
      'SC Lec , Time:10 am - 11:00  pm ,   Class : 66',
      'BDA Lec , Time: 01:30 - 2:30 pm ,    Class : 66',
      'EVS  Lec , Time: 02:30pm - 03:30 pm ,   Class : 66',
      'SE Lec , Time: 11:00pm - 12:00 pm ,  Class : 66',
      'PDC Lec , Time: 12:00 pm  - 01:00 pm ,   Class : 66',
      'BREAK :  01:00 pm- 01: 30 pm',
      'BDA Lec , Time: 01:30 - 2:30 pm ,    Class : 66',
    ],
    "Friday": [
      'Honours Lab , Time: 8:00am - 10:00 am , Faculty : Monali Mam , Class : 66',
      'PDC Lab , Time:10 am - 12:00  pm , Faculty : Vinaya Mam ,  Class : 66',
      'BREAK :  12 :00 pm- 12: 30 pm',
      'BDA  Lec , Time: 12:30pm - 01:30 pm , Faculty : Harshal Sir ,  Class : 66',
      'IACV Lec , Time: 01:30pm - 02:30 pm , Faculty : Neha Mam,  Class : 66',
    ],
  };

  @override
  void initState() {
    super.initState();
    formattedDateTime = DateFormat('EEEE, MMMM d, y HH:mm').format(DateTime.now());
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Hello, Faculty!'),
          actions: [
            Row(
              children: [
                IconButton(
                  icon: const Icon(Icons.notifications),
                  onPressed: () {
                    // Navigate to the notice page
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const NoticePage()),
                    );
                  },
                ),
                IconButton(
                  icon: const Icon(Icons.check), // Icon for attendance marking
                  onPressed: () {
                    // Navigate to the attendance page
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const AttendancePage()),
                    );
                  },
                ),
              ],
            )
          ],
        ),
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              DrawerHeader(
                decoration: BoxDecoration(
                  color: Color.fromRGBO(162, 83, 169, 1.0),
                ),
                child: const Text(
                  'Additional Features',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                  ),
                ),
              ),
              ListTile(
                title: const Text('Edit Profile'),
                onTap: () {
                  _showEditProfileAlert(context);
                },
              ),
              ListTile(
                title: const Text('Settings'),
                onTap: () {
                  _showSettingsAlert(context);
                },
              ),
              _buildApplicationTile(
                title: 'Linkedin',
                url: 'https://www.linkedin.com/',
                context: context,
              ),
              _buildApplicationTile(
                title: 'Whatsapp',
                url: 'whatsapp://send?phone=<PHONE_NUMBER>',
                // url:'https://www.whatsapp.com/',
                context: context,
              ),
              _buildApplicationTile(
                title: 'MS Teams',
                url: 'https://www.microsoft.com/en-in/microsoft-teams/log-in',
                context: context,
              ),
              _buildApplicationTile(
                title: 'OneDrive',
                url: 'https://onedrive.live.com/login/',
                context: context,
              ),
              _buildApplicationTile(
                title: 'SAP Academic Portal',
                url: 'https://sdc-sppap1.svkm.ac.in:50001/irj/portal',
                context: context,
              ),
              _buildApplicationTile(
                title: 'Attendance Tracker',
                url: 'https://portal.svkm.ac.in/usermgmt/loginSvkm',
                context: context,
              ),
              _buildApplicationTile(
                title: 'Faculty Feedback',
                url: 'https://feedback-portal-djsce.netlify.app/',
                context: context,
              ),
              ListTile(
                title: const Text('Around Campus'),
                onTap: () {
                  // Navigate to the AroundCampus screen
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => AroundCampus()),
                  );
                },
              ),
              ListTile(
                title: const Text('Logout'),
                onTap: () {
                  _confirmLogout(context);
                },
              ),
            ],
          ),
        ),

        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Center(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: DropdownButton<String>(
                      value: selectedDay,
                      onChanged: (String? newValue) {
                        setState(() {
                          selectedDay = newValue!;
                        });
                      },
                      items: days.map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      formattedDateTime,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Card(
                      elevation: 4,
                      margin: const EdgeInsets.all(16),
                      child: Column(
                        children: [
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.3,
                            child: ListView.builder(
                              itemCount: lecturesByDay[selectedDay]!.length,
                              itemBuilder: (BuildContext context, int index) {
                                return ListTile(
                                  title: Text(lecturesByDay[selectedDay]![index]),
                                 // subtitle: Text('Time: ${_generateRandomTime()}, Classroom: ${_generateRandomClassroom()}'),
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const SizedBox(
                      width: double.infinity,
                      child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          'Your Study Groups',
                          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),

                    Container(
                      padding: const EdgeInsets.all(8),
                      child: GridView.count(
                        crossAxisCount: 2,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10,
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        children: [
                          GestureDetector(
                            onTap: () {
                              _navigateToChatRoom(context, 'Competitive Coding');
                            },
                            child: _buildStudyGroupTile('Competitive Coding'),
                          ),

                          GestureDetector(
                            onTap: () {
                              _navigateToChatRoom2(context, 'Data Structures Help');
                            },
                            child: _buildStudyGroupTile('Data Structures Help'),
                          ),

                        ],
                      ),
                    ),
                    // Add the line graph here
                  ],
                ),
              ),
            ),
          ],
        ),

        bottomNavigationBar: GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => StatusNavigator()),
            );
          },
          child: Container(
            color: Color.fromRGBO(162, 83, 169, 1.0),
            padding: const EdgeInsets.symmetric(vertical: 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Icon(Icons.info, color: Colors.white),
                SizedBox(width: 8),
                Text(
                  'Status',
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  String _generateRandomTime() {
    final Random random = Random();
    final int hour = random.nextInt(12) + 1; // Random hour between 1 and 12
    final int minute = random.nextInt(60); // Random minute between 0 and 59
    final String meridian = random.nextBool() ? 'AM' : 'PM'; // Randomly select AM or PM
    return '$hour:${minute.toString().padLeft(2, '0')} $meridian';
  }

  int _generateRandomClassroom() {
    final Random random = Random();
    return random.nextInt(56) + 1; // Random classroom between 1 and 100
  }

  void _showEditProfileAlert(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const UserProfile()),
    );
  }

  void _showSettingsAlert(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const SettingsPage()),
    );
  }

  void _openApplication(String url, String appName, BuildContext context) async {
    // Show an alert window asking the user if they want to open the application
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Open $appName?'),
          content: Text('Do you want to open $appName?'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () async {
                if (await canLaunch(url)) {
                  await launch(url);
                } else {
                  // Handle error
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text('Error'),
                        content: Text('Could not launch $appName.'),
                        actions: <Widget>[
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: const Text('OK'),
                          ),
                        ],
                      );
                    },
                  );
                }
                Navigator.of(context).pop();
              },
              child: const Text('Open'),
            ),
          ],
        );
      },
    );
  }

  Widget _buildApplicationTile({required String title, required String url, required BuildContext context}) {
    return ListTile(
      title: Text(title),
      onTap: () {
        _openApplication(url, title, context);
      },
    );
  }

  void _confirmLogout(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Logout'),
          content: const Text('Do you want to logout?'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context); // Cancel logout
              },
              child: const Text('No'),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
                // Confirm logout
                // Navigator.pushReplacement(
                //   context,
                //   MaterialPageRoute(builder: (context) => const MyApp()),
                // );
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => HomeScreen()),
                );
              },
              child: const Text('Yes'),
            ),
          ],
        );
      },
    );
  }

  Widget _buildStudyGroupTile(String groupName) {
    return Card(
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.group, size: 40),
            const SizedBox(height: 8),
            Text(
              groupName,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }

  void _navigateToChatRoom(BuildContext context, String groupName) {
    Navigator.push(
      context,
      MaterialPageRoute(
       // builder: (context) => ChatRoom(groupName: groupName),
        builder: (context) => ChatRoom(),
      ),
    );
  }
}

void _navigateToChatRoom2(BuildContext context, String groupName) {
  Navigator.push(
    context,
    MaterialPageRoute(
      //  builder: (context) => ChatRoom2(groupName: groupName),
      builder: (context) => ChatRoom2(),
    ),
  );
}



//999999999999999999

