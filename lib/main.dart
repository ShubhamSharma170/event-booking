import 'package:event_booking/provider/api_provider/api-provider.dart';
import 'package:event_booking/provider/auth_provider/auth-provider.dart';
import 'package:event_booking/routes/routes.dart';
import 'package:event_booking/screen/splash_screen/splash-screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthProvider()),
        ChangeNotifierProvider(create: (_) => APICall()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(),
        home: SplashScreen(),
        onGenerateRoute: (settings) => Routes.generateRoutes(settings),
      ),
    );
  }
}
