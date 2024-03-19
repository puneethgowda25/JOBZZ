import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_job_portal/home/Homez.dart';
import 'package:flutter_job_portal/bottomsheet.dart';
import 'package:flutter_job_portal/sigin%20pages/log_in_page.dart';
import 'package:flutter_job_portal/home/profile.dart';
import 'package:flutter_job_portal/sigin%20pages/sign_up_page.dart';
import 'package:flutter_job_portal/sigin%20pages/splash_screen.dart';
//import 'package:flutter_job_portal/ui/screens/screens.dart';
import 'package:provider/provider.dart';

import 'bottomsheet.dart';
import 'firebase_options.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  ).then((FirebaseApp value) => Get.put(AuthenticationRepository()),
  );
  runApp(MyApp() );
}

class Get {
  static put(AuthenticationRepository authenticationRepository) {}
}

class AuthenticationRepository {
}


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<MyBottomSheetModel>(
      create: (_) => MyBottomSheetModel(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          fontFamily: 'OpenSans',
        ),
        home: SplashScreen(),
      ),
    );
  }
}


