import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyALAx3EgktlHmscMHDj680viaFGkcJusVw",
            authDomain: "amanda-beauty-cdu9n7.firebaseapp.com",
            projectId: "amanda-beauty-cdu9n7",
            storageBucket: "amanda-beauty-cdu9n7.appspot.com",
            messagingSenderId: "937014926679",
            appId: "1:937014926679:web:3045f1c7ab86f3e7f93212"));
  } else {
    await Firebase.initializeApp();
  }
}
