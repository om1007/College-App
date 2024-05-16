import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:provider/provider.dart';
import 'screens/StudentLoginPage.dart';
import 'screens/StudentSignupPage.dart';
import 'screens/FacultyLoginPage.dart';
import 'screens/FacultySignupPage.dart';
import 'screens/Alumini.dart';
import 'screens/Settings.dart'; // Import the SettingsPage.dart file
import 'screens/AboutPage.dart'; // Import the AboutPage.dart file
import 'package:firebase_messaging/firebase_messaging.dart';
import 'dart:async';
//import 'package:url_launcher/url_launcher.dart' as UrlLauncher;
import 'package:url_launcher/url_launcher.dart' as UrlLauncher;





// import 'package:firebase_core/firebase_core.dart';
// import 'fire_options.dart';

bool _darkThemeEnabled = true;
final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  // This function is called when a background message is received.
  print("Handling background message: ${message.notification!.title}");
}

void main() async{

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  //UrlLauncherUrlLauncher.init();
  //UrlLauncher();

  // FirebaseMessaging.instance.getInitialMessage().then(_firebaseMessagingBackgroundHandler);
  // FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

  FutureOr<dynamic> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
    // This function is called when a background message is received.
    print("Handling background message: ${message.notification!.title}");
  }

  final fcmToken = await FirebaseMessaging.instance.getToken();
  print(fcmToken);
  runApp(

    ChangeNotifierProvider(
      create: (_) => ThemeProvider(), // Provide your ThemeProvider instance here
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    return GetMaterialApp(
      title: 'IT Live',
      theme: _darkThemeEnabled ? ThemeData.dark() : ThemeData.light(),
      darkTheme: ThemeData.dark(),
      initialRoute: '/',
      routes: {
        '/': (context) => const HomeScreen(),
        '/student_login': (context) => StudentLoginPage(),
        '/student_signup': (context) => StudentSignupPage(),
        '/faculty_login': (context) => FacultyLoginPage(),
        '/faculty_signup': (context) => FacultySignupPage(),
        '/settings': (context) => const SettingsPage(),
        // Add more routes for other pages if needed
      },
    );
  }
}

class ThemeProvider extends ChangeNotifier {
  ThemeData _currentTheme = ThemeData.dark();

  void toggleTheme() {
    _currentTheme =
    _currentTheme == ThemeData.light() ? ThemeData.dark() : ThemeData.light();
    notifyListeners();
  }

  ThemeData getTheme() => _currentTheme;
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Text('IT Live'),
            IconButton(
              icon: Icon(Icons.info),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AboutPage()),
                );
              },
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Student',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            Card(
              elevation: 4,
              child: Padding(
                padding: const EdgeInsets.all(50.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Center(
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.pushNamed(context, '/student_login');
                        },
                        style: ButtonStyle(
                          padding: MaterialStateProperty.all<EdgeInsets>(
                            const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
                          ),
                        ),
                        child: const Text('Student Login'),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Center(
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.pushNamed(context, '/student_signup');
                        },
                        style: ButtonStyle(
                          padding: MaterialStateProperty.all<EdgeInsets>(
                            const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
                          ),
                        ),
                        child: const Text('Student Sign Up'),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'Faculty',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            Card(
              elevation: 4,
              child: Padding(
                padding: const EdgeInsets.all(50.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Center(
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.pushNamed(context, '/faculty_login');
                        },
                        style: ButtonStyle(
                          padding: MaterialStateProperty.all<EdgeInsets>(
                            const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
                          ),
                        ),
                        child: const Text('Faculty Login'),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Center(
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.pushNamed(context, '/faculty_signup');
                        },
                        style: ButtonStyle(
                          padding: MaterialStateProperty.all<EdgeInsets>(
                            const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
                          ),
                        ),
                        child: const Text('Faculty Sign Up'),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
