import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutterfire_ui/auth.dart'
    show
        EmailProviderConfiguration,
        FlutterFireUIAuth,
        GoogleProviderConfiguration,
        ProfileScreen,
        RegisterScreen,
        SignedOutAction;
import 'package:ist_bug/auth/firebase_options.dart';
import 'package:ist_bug/constant.dart';
import 'package:ist_bug/views/screens/log_in_screen.dart';
import 'package:ist_bug/views/screens/splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  FlutterFireUIAuth.configureProviders([
    const EmailProviderConfiguration(),
    const GoogleProviderConfiguration(clientId: googleCientId),
  ]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: Theme.of(context).colorScheme.primary,
      ),
    );
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'IstBugs',
      theme: ThemeData(
        colorScheme: kColorScheme,
        textTheme: kTextTheme,
      ),
      initialRoute: '/',
      routes: {
        '/': ((context) => const SplashScreen()),
        '/register': ((context) => const RegisterScreen()),
        '/sign-in': (context) {
          return const LoginScreen();
        },
        '/profile': (context) {
          return ProfileScreen(
            actions: [
              SignedOutAction((context) {
                Navigator.pushReplacementNamed(context, '/sign-in');
              }),
            ],
          );
        },
      },
    );
  }
}
