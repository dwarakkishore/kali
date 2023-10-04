import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyDIZE5TbjM0XPMcpA9fIEq2TivV_rVgcl4",
            authDomain: "kali-c4429.firebaseapp.com",
            projectId: "kali-c4429",
            storageBucket: "kali-c4429.appspot.com",
            messagingSenderId: "877348360184",
            appId: "1:877348360184:web:4561333da9f760eeb0500d",
            measurementId: "G-9Z313G93YH"));
  } else {
    await Firebase.initializeApp();
  }
}
