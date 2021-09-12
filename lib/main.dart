import 'package:flutter/material.dart';
import 'package:flutter_4proj_resit/config/config.dart';
import 'package:flutter_4proj_resit/screens/Login/components/provider/google_sign_in.dart';
import 'package:flutter_4proj_resit/screens/SplashScreen/splash.dart';
import 'package:flutter_4proj_resit/screens/SplashScreen/splashScreen.dart';
import 'package:flutter_4proj_resit/screens/Welcome/welcome_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) => ChangeNotifierProvider(
        create: (context) => GoogleSignInProvider(),
        child: MaterialApp(
          title: 'Flutter 4PROJ App',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            fontFamily: "CiutadellaRounded",
            primaryColor: Config.colors.primaryColor,
            primarySwatch: Colors.blue,
          ),
          home: SplashWidget(
            child: SplashScreen(),
            nextPage: Welcome(),
            time: 4,
          ),
        ),
      );
}
