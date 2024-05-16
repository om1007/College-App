//
//
//
//
// import 'dart:math';
// import 'package:flutter/material.dart';
// import 'package:intl/intl.dart' show DateFormat;
// import '../main.dart';
// import 'ChatRoom.dart'; // Import the ChatRoom.dart
// import 'Notice.dart'; // Import the Notice.dart
// import 'UserProfile.dart';
// import 'Settings.dart';
// import 'package:fl_chart/fl_chart.dart';
// import 'package:url_launcher/url_launcher.dart';
// import 'AroundCampus.dart';
// import 'FacultyStatus.dart';
// import 'MarksTarget.dart';
// import 'Alumini.dart';
//
// class StudentHomePage extends StatefulWidget {
//   final String studentName; // Pass the student's name from the login page
//
//   const StudentHomePage({Key? key, required this.studentName}) : super(key: key);
//
//   @override
//   _StudentHomePageState createState() => _StudentHomePageState();
// }
//
// class _StudentHomePageState extends State<StudentHomePage> {
//   String? _selectedDay; // Variable to hold the selected day value
//
//   // Add dropdown items
//   List<String> _days = [
//     'Monday',
//     'Tuesday',
//     'Wednesday',
//     'Thursday',
//     'Friday',
//
//   ];
//
//   List<String> _lectures = [];
//
//   @override
//   Widget build(BuildContext context) {
//     String formattedDateTime =
//     DateFormat('EEEE, MMMM d').format(DateTime.now());
//
//     return WillPopScope(
//       onWillPop: () => _onBackPressed(context),
//       child: Scaffold(
//         appBar: AppBar(
//             title: Text('Welcome, ${widget.studentName} !'),
//             actions: [
//               IconButton(
//                 icon: const Icon(Icons.notifications), // Notice icon
//                 onPressed: () {
//                   // Navigate to the notice page
//                   Navigator.push(
//                     context,
//                     MaterialPageRoute(builder: (context) => const NoticePage()),
//                   );
//                 },
//               ),
//             ]),
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
//               ListTile(
//                 title: const Text('Linkedin'),
//                 onTap: () {
//                   _openApplication(
//                     'https://www.linkedin.com/',
//                     'LinkedIn',
//                     context,
//                   );
//                 },
//
//               ),
//               ListTile(
//                 title: const Text('Whatsapp'),
//                 onTap: () {
//                   _openApplication(
//                     'whatsapp://send?phone=<PHONE_NUMBER>',
//                     'WhatsApp',
//                     context,
//                   );
//                 },
//               ),
//               ListTile(
//                 title: const Text('MS Teams'),
//                 onTap: () {
//                   _openApplication(
//                     'https://www.microsoft.com/en-in/microsoft-teams/log-in',
//                     'MS Teams',
//                     context,
//                   );
//                 },
//               ),
//               ListTile(
//                 title: const Text('OneDrive'),
//                 onTap: () {
//                   _openApplication(
//                     'https://onedrive.live.com/login/',
//                     'OneDrive',
//                     context,
//                   );
//                 },
//               ),
//               ListTile(
//                 title: const Text('SAP Academic Portal'),
//                 onTap: () {
//                   _openApplication(
//                     'https://sdc-sppap1.svkm.ac.in:50001/irj/portal',
//                     'SAP Academic Portal',
//                     context,
//                   );
//                 },
//               ),
//               ListTile(
//                 title: const Text('Attendance Tracker'),
//                 onTap: () {
//                   _openApplication(
//                     'https://portal.svkm.ac.in/usermgmt/loginSvkm',
//                     'Attendance Tracker',
//                     context,
//                   );
//                 },
//               ),
//               ListTile(
//                 title: const Text('Faculty Feedback'),
//                 onTap: () {
//                   _openApplication(
//                     'https://feedback-portal-djsce.netlify.app/',
//                     'Faculty Feedback',
//                     context,
//                   );
//                 },
//               ),
//               ListTile(
//                 title: const Text('Alumini Connect'),
//                 onTap: () {
//                   Navigator.push(
//                     context,
//                     MaterialPageRoute(builder: (context) => AluminiPage()),
//                   );
//                 },
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
//               child: Column(
//                 children: [
//                   DropdownButton<String>(
//                     hint: Text('Select Day'),
//                     value: _selectedDay,
//                     onChanged: (String? newValue) {
//                       setState(() {
//                         _selectedDay = newValue;
//                         _generateRandomLectures(); // Generate random lectures when day is selected
//                       });
//                     },
//                     items: _days.map<DropdownMenuItem<String>>((String value) {
//                       return DropdownMenuItem<String>(
//                         value: value,
//                         child: Text(value),
//                       );
//                     }).toList(),
//                   ),
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
//                           const Padding(
//                             padding: EdgeInsets.all(8.0),
//                             child: Text(
//                               'Your Lectures',
//                               style: TextStyle(
//                                   fontSize: 18, fontWeight: FontWeight.bold),
//                             ),
//                           ),
//                           SizedBox(
//                             height: MediaQuery.of(context).size.height * 0.3,
//                             child: ListView.builder(
//                               itemCount: _lectures.length,
//                               itemBuilder: (context, index) {
//                                 return ListTile(
//                                   title: Text(_lectures[index]),
//                                   subtitle: Text(
//                                       'Time: ${_generateRandomTime()}, Classroom: ${_generateRandomClassroom()}, Faculty: ${_generateRandomFaculty()}'),
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
//                           style: TextStyle(
//                               fontSize: 18, fontWeight: FontWeight.bold),
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
//                               _navigateToChatRoom(context, 'Data Structures Help');
//                             },
//                             child: _buildStudyGroupTile('Data Structures Help'),
//                           ),
//                         ],
//                       ),
//                     ),
//                     const SizedBox(height: 20),
//                     _buildCGPAGraph(context), // Add the line graph here
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
//               MaterialPageRoute(builder: (context) => FacultyStatus()),
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
//   Future<bool> _onBackPressed(BuildContext context) async {
//     bool logoutConfirmed = await showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         return AlertDialog(
//           title: const Text('Logout'),
//           content: const Text('Do you want to logout?'),
//           actions: [
//             TextButton(
//               onPressed: () {
//                 Navigator.pop(context, false); // Logout not confirmed
//               },
//               child: const Text('No'),
//             ),
//             TextButton(
//               onPressed: () {
//                 Navigator.pop(context, true); // Logout confirmed
//               },
//               child: const Text('Yes'),
//             ),
//           ],
//         );
//       },
//     );
//
//     if (logoutConfirmed ?? false) {
//       // If logout is confirmed, navigate to main.dart
//       Navigator.pushReplacement(
//         context,
//         MaterialPageRoute(builder: (context) => const MyApp()), // Replace MyApp with your main.dart class name
//       );
//     }
//
//     return logoutConfirmed ?? false;
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
//     showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         return AlertDialog(
//           title: Text('Open $appName?'),
//           content: Text('Do you want to open $appName?'),
//           actions: <Widget>[
//             TextButton(
//               onPressed: () async {
//                 Navigator.of(context).pop();
//                 if (await canLaunch(url)) {
//                   await launch(url);
//                 } else {
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
//               },
//               child: const Text('Open'),
//             ),
//             TextButton(
//               onPressed: () {
//                 Navigator.of(context).pop();
//               },
//               child: const Text('Cancel'),
//             ),
//           ],
//         );
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
//
//   Widget _buildCGPAGraph(BuildContext context) {
//     final List<FlSpot> cgpaData = [
//       FlSpot(1, 9.0),
//       FlSpot(2, 9.14),
//       FlSpot(3, 9.27),
//       FlSpot(4, 8.83),
//       FlSpot(5, 9.26),
//     ];
//
//     return Padding(
//       padding: const EdgeInsets.all(8.0),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.stretch,
//         children: [
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               Text(
//                 'Your Academics\n',
//                 style: TextStyle(
//                     fontSize: 18,
//                     fontWeight: FontWeight.bold,
//                     color: Colors.white),
//               ),
//               IconButton(
//                 icon: Icon(Icons.info),
//                 color: Colors.white,
//                 onPressed: () {
//                   Navigator.push(
//                     context,
//                     MaterialPageRoute(builder: (context) => MarksTarget()),
//                   );
//                 },
//               ),
//             ],
//           ),
//           SizedBox(height: 10),
//           AspectRatio(
//             aspectRatio: 2.0,
//             child: LineChart(
//               LineChartData(
//                 minX: 0,
//                 maxX: 6,
//                 minY: 6,
//                 maxY: 10,
//                 titlesData: FlTitlesData(
//                   bottomTitles: SideTitles(
//                     showTitles: true,
//                     reservedSize: 22, // add spacing
//                     margin: 10, // add margin
//                     getTitles: (value) {
//                       switch (value.toInt()) {
//                         case 1:
//                           return 'Sem 1';
//                         case 2:
//                           return 'Sem 2';
//                         case 3:
//                           return 'Sem 3';
//                         case 4:
//                           return 'Sem 4';
//                         case 5:
//                           return 'Sem 5';
//                       }
//                       return '';
//                     },
//                     getTextStyles: (value) => TextStyle(color: Colors.white),
//                   ),
//                   leftTitles: SideTitles(
//                     showTitles: true,
//                     reservedSize: 40, // add spacing
//                     margin: 12, // add margin
//                     // add axis name
//                     getTextStyles: (value) => TextStyle(color: Colors.white),
//                     getTitles: (value) {
//                       return value.toString();
//                     },
//                   ),
//                 ),
//                 borderData: FlBorderData(show: true),
//                 lineBarsData: [
//                   LineChartBarData(
//                     spots: cgpaData,
//                     isCurved: true,
//                     colors: [Colors.blue],
//                     barWidth: 3,
//                     isStrokeCapRound: true,
//                     belowBarData: BarAreaData(show: false),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
//
//   void _generateRandomLectures() {
//     _lectures.clear();
//     Random random = Random();
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
//     for (int i = 0; i < 5; i++) {
//       int index = random.nextInt(availableLectures.length);
//       _lectures.add(availableLectures[index]);
//     }
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
//   String _generateRandomFaculty() {
//     List<String> faculties = [
//       'Prof. Tanaji Biradar',
//       'Prof. Neha Katre',
//       'Prof. Harshal Dalvi',
//       'Prof. Vinaya Savant',
//       'Prof. Savyasacchi Pandit',
//       'Prof. Monali Sankhe',
//       'Prof. Richa Sharma',
//       'Prof. Arjun Jaiswal',
//     ];
//     Random random = Random();
//     return faculties[random.nextInt(faculties.length)];
//   }
// }
//
//
//


//555555555555555555555555

import 'dart:math';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart' show DateFormat;
import '../main.dart';
import 'ChatRoom.dart'; // Import the ChatRoom.dart
import 'Notice.dart'; // Import the Notice.dart
import 'UserProfile.dart';
import 'Settings.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:url_launcher/url_launcher.dart';
import 'AroundCampus.dart';
import 'FacultyStatus.dart';
import 'MarksTarget.dart';
import 'Alumini.dart';
import 'ChatRoom2.dart';
// import 'HomeScreen.dart';

class StudentHomePage extends StatefulWidget {
  final String studentName; // Pass the student's name from the login page

  const StudentHomePage({Key? key, required this.studentName}) : super(key: key);

  @override
  _StudentHomePageState createState() => _StudentHomePageState();
}

class _StudentHomePageState extends State<StudentHomePage> {
  String? _selectedDay; // Variable to hold the selected day value

  // Add dropdown items
  List<String> _days = [
    'Monday',
    'Tuesday',
    'Wednesday',
    'Thursday',
    'Friday',
  ];

  List<String> _lectures = [];

  @override
  Widget build(BuildContext context) {
    String formattedDateTime =
    DateFormat('EEEE, MMMM d').format(DateTime.now());

    return WillPopScope(
      onWillPop: () => _onBackPressed(context),
      child: Scaffold(
        appBar: AppBar(
          title: Text('Welcome, ${widget.studentName} !'),
          actions: [
            IconButton(
              icon: const Icon(Icons.notifications), // Notice icon
              onPressed: () {
                // Navigate to the notice page
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const NoticePage()),
                );
              },
            ),
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
              ListTile(
                title: const Text('Linkedin'),
                onTap: () {
                  _openApplication(
                    'http://www.linkedin.com/',
                    'LinkedIn',
                    context,
                  );
                },
              ),
              ListTile(
                title: const Text('Whatsapp'),
                onTap: () {
                  _openApplication(
                    'whatsapp://send?phone=<PHONE_NUMBER>',
                    'WhatsApp',
                    context,
                  );
                },
              ),
              ListTile(
                title: const Text('MS Teams'),
                onTap: () {
                  _openApplication(
                    'http://www.microsoft.com/en-in/microsoft-teams/log-in',
                    'MS Teams',
                    context,
                  );

                },
              ),
              ListTile(
                title: const Text('OneDrive'),
                onTap: () {
                  _openApplication(
                    'https://onedrive.live.com/login/',
                    'OneDrive',
                    context,
                  );
                },
              ),
              ListTile(
                title: const Text('SAP Academic Portal'),
                onTap: () {
                  _openApplication(
                    'https://sdc-sppap1.svkm.ac.in:50001/irj/portal',
                    'SAP Academic Portal',
                    context,
                  );
                },
              ),
              ListTile(
                title: const Text('Attendance Tracker'),
                onTap: () {
                  _openApplication(
                    'https://portal.svkm.ac.in/usermgmt/loginSvkm',
                    'Attendance Tracker',
                    context,
                  );
                },
              ),
              ListTile(
                title: const Text('Faculty Feedback'),
                onTap: () {
                  _openApplication(
                    'https://feedback-portal-djsce.netlify.app/',
                    'Faculty Feedback',
                    context,
                  );
                },
              ),
              ListTile(
                title: const Text('Alumini Connect'),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => AluminiPage()),
                  );
                },
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
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  DropdownButton<String>(
                    hint: Text('Select Day'),
                    value: _selectedDay,
                    onChanged: (String? newValue) {
                      setState(() {
                        _selectedDay = newValue;
                        _generateRandomLectures(); // Generate random lectures when day is selected
                      });
                    },
                    items: _days.map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                  Text(
                    formattedDateTime,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
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
                          const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text(
                              'Your Lectures',
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.3,
                            child: ListView.builder(
                              itemCount: _lectures.length,
                              itemBuilder: (context, index) {
                                return ListTile(
                                  title: Text(_lectures[index]),
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
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
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
                    const SizedBox(height: 20),
                    _buildCGPAGraph(context), // Add the line graph here
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
              MaterialPageRoute(builder: (context) => FacultyStatus()),
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

  Future<bool> _onBackPressed(BuildContext context) async {
    bool logoutConfirmed = await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Logout'),
          content: const Text('Do you want to logout?'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context, false); // Logout not confirmed
              },
              child: const Text('No'),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context, true); // Logout confirmed
              },
              child: const Text('Yes'),
            ),
          ],
        );
      },
    );

    if (logoutConfirmed ?? false) {
      // If logout is confirmed, navigate to main.dart
      // Navigator.pushReplacement(
      //   context,
      //   MaterialPageRoute(builder: (context) => const MyApp()), // Replace MyApp with your main.dart class name
      // );
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => HomeScreen()),
      );

    }

    return logoutConfirmed ?? false;
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
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Open $appName?'),
          content: Text('Do you want to open $appName?'),
          actions: <Widget>[
            TextButton(
              onPressed: () async {
                Navigator.of(context).pop();
                if (await canLaunch(url)) {
                  await launch(url);
                } else {
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
              },
              child: const Text('Open'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Cancel'),
            ),
          ],
        );
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
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const HomeScreen()),
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
      //  builder: (context) => ChatRoom(groupName: groupName),
        builder: (context) => ChatRoom(),
      ),
    );
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

  Widget _buildCGPAGraph(BuildContext context) {
    final List<FlSpot> cgpaData = [
      FlSpot(1, 9.0),
      FlSpot(2, 9.14),
      FlSpot(3, 9.27),
      FlSpot(4, 8.83),
      FlSpot(5, 9.26),
    ];

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Your Academics\n',
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              IconButton(
                icon: Icon(Icons.info),
                color: Colors.white,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => MarksTarget()),
                  );
                },
              ),
            ],
          ),
          SizedBox(height: 10),
          AspectRatio(
            aspectRatio: 2.0,
            child: LineChart(
              LineChartData(
                minX: 0,
                maxX: 6,
                minY: 6,
                maxY: 10,
                titlesData: FlTitlesData(
                  bottomTitles: SideTitles(
                    showTitles: true,
                    reservedSize: 22, // add spacing
                    margin: 10, // add margin
                    getTitles: (value) {
                      switch (value.toInt()) {
                        case 1:
                          return 'Sem 1';
                        case 2:
                          return 'Sem 2';
                        case 3:
                          return 'Sem 3';
                        case 4:
                          return 'Sem 4';
                        case 5:
                          return 'Sem 5';
                      }
                      return '';
                    },
                    getTextStyles: (value) => TextStyle(color: Colors.white),
                  ),
                  leftTitles: SideTitles(
                    showTitles: true,
                    reservedSize: 40, // add spacing
                    margin: 12, // add margin
                    // add axis name
                    getTextStyles: (value) => TextStyle(color: Colors.white),
                    getTitles: (value) {
                      return value.toString();
                    },
                  ),
                ),
                borderData: FlBorderData(show: true),
                lineBarsData: [
                  LineChartBarData(
                    spots: cgpaData,
                    isCurved: true,
                    colors: [Colors.blue],
                    barWidth: 3,
                    isStrokeCapRound: true,
                    belowBarData: BarAreaData(show: false),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _generateRandomLectures() {
    _lectures.clear();
    Random random = Random();
    List<String> mondayLectures = [
      'Honours Lab , Time: 8:00am - 10:00 am , Faculty : Monali Mam ,  Class : 66',
      'BDA Lab , Time:10 am - 12:00  pm , Faculty : Harshal Dalvi ,  Class : 66',
      'BREAK :  12 :00 pm- 12: 30 pm',
      'SE Lec , Time: 12:30pm - 01:30 pm , Faculty : Richa Mam ,  Class : 66',
      'IACV Lec , Time: 01:30pm - 02:30 pm , Faculty : Neha Mam ,  Class : 66',
    ];
    List<String> tuesdayLectures = [
      // Define Tuesday lectures similarly
      'Minors Lab , Time: 8:00am - 10:00 am , Faculty : Sneha Mam ,  Class : 66',
      'IACV Lab , Time:10 am - 12:00  pm , Faculty : Neha Mam ,  Class : 66',
      'BREAK :  12 :00 pm- 12: 30 pm',
      'IACV Lec , Time: 12:30pm - 01:30 pm , Faculty : Neha Mam ,  Class : 66',
      'PDC Lec , Time: 01:30pm - 02:30 pm , Faculty : Vinaya  Mam ,  Class : 66',
      'SC Lec , Time: 02:30pm - 03:30 pm , Faculty : Savyasachi  Mam ,  Class : 66',

    ];
    List<String> wednesdayLectures = [
      // Define Tuesday lectures similarly
      'SC Lec , Time:10 am - 11:00  pm , Faculty : Savyasachi  Mam ,  Class : 66',
      'SE Lec , Time: 11:00pm - 12:00 pm , Faculty : Richa Mam ,  Class : 66',
      'PDC Lec , Time: 12:00 pm  - 01:00 pm , Faculty : Vinaya  Mam ,  Class : 66',
      'BREAK :  01:00 pm- 01: 30 pm',
      'BDA Lec , Time: 01:30 - 2:30 pm ,  Faculty : Harshal Dalvi ,  Class : 66',
      'EVS  Lec , Time: 02:30pm - 03:30 pm , Faculty : Arjun Jaiswal Sir ,  Class : 66',
      'SE LAB , Time: 3:30pm - 5:00 pm , Faculty : Richa Mam ,  Class : 66',

    ];
    List<String> ThursdayLectures = [
      // Define Tuesday lectures similarly
      'SC Lec , Time:10 am - 11:00  pm , Faculty : Savyasachi  Mam ,  Class : 66',
      'BDA Lec , Time: 01:30 - 2:30 pm ,  Faculty : Harshal Dalvi,  Class : 66',
      'EVS  Lec , Time: 02:30pm - 03:30 pm , Faculty : Arjun Jaiswal Sir ,  Class : 66',
      'SE Lec , Time: 11:00pm - 12:00 pm , Faculty : Richa Mam ,  Class : 66',
      'PDC Lec , Time: 12:00 pm  - 01:00 pm , Faculty : Vinaya  Mam ,  Class : 66',
      'BREAK :  01:00 pm- 01: 30 pm',
      'SE LAB , Time: 1:30pm - 3:00 pm , Faculty : Richa Mam ,  Class : 66',

    ];
    List<String> FridayLectures = [
      // Define Tuesday lectures similarly
      'Honours Lab , Time: 8:00am - 10:00 am , Faculty : Monali Mam , Class : 66',
      'PDC Lab , Time:10 am - 12:00  pm , Faculty : Vinaya Mam ,  Class : 66',
      'BREAK :  12 :00 pm- 12: 30 pm',
      'BDA  Lec , Time: 12:30pm - 01:30 pm , Faculty : Harshal Sir ,  Class : 66',
      'IACV Lec , Time: 01:30pm - 02:30 pm , Faculty : Neha Mam,  Class : 66',

    ];
    // Define lectures for other days as well

    switch (_selectedDay) {
      case 'Monday':
        _lectures.addAll(mondayLectures);
        break;
      case 'Tuesday':
        _lectures.addAll(tuesdayLectures);
        break;
      case 'Wednesday':
        _lectures.addAll(wednesdayLectures);
        break;
      case 'Thursday':
        _lectures.addAll(ThursdayLectures);
        break;
      case 'Friday':
        _lectures.addAll(FridayLectures);
        break;
    // Add cases for Wednesday, Thursday, Friday
    }
  }

  String _generateRandomTime() {
    Random random = Random();
    int hour = random.nextInt(12) + 1; // Random hour between 1 and 12
    int minute = random.nextInt(60); // Random minute between 0 and 59
    return '$hour:${minute.toString().padLeft(2, '0')} ${hour >= 12 ? 'PM' : 'AM'}';
  }

  String _generateRandomClassroom() {
    Random random = Random();
    return (random.nextInt(50) + 1).toString(); // Random classroom number between 1 and 50
  }

  String _generateRandomFaculty() {
    List<String> faculties = [
      'Prof. Tanaji Biradar',
      'Prof. Neha Katre',
      'Prof. Harshal Dalvi',
      'Prof. Vinaya Savant',
      'Prof. Savyasacchi Pandit',
      'Prof. Monali Sankhe',
      'Prof. Richa Sharma',
      'Prof. Richa Sharma',
      'Prof. Arjun Jaiswal',
    ];
    Random random = Random();
    return faculties[random.nextInt(faculties.length)];
  }
}
