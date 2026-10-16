import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyCQyoxTOe0oUTkT0ET6T7v8Zf_dnZkAJg4",
            authDomain: "invatrans-4d6e7.firebaseapp.com",
            projectId: "invatrans-4d6e7",
            storageBucket: "invatrans-4d6e7.appspot.com",
            messagingSenderId: "479689612998",
            appId: "1:479689612998:web:b0691532767488b88d41c7"));
  } else {
    await Firebase.initializeApp();
  }
}
