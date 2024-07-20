import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:inten/home.dart';
import 'dart:io' show Platform;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  if (Platform.isAndroid) {
    await Firebase.initializeApp(
      options: const FirebaseOptions(
        apiKey: "AIzaSyCw5zX9C-wtykJmlBP6rIJnBzrcuXr41Ws",
        projectId: "intern-16b59",
        storageBucket: "intern-16b59.appspot.com",
        messagingSenderId: "788558506979",
        appId: "1:788558506979:android:3f3c706adc230855d64ed6",
      ),
    );
  } else {
    await Firebase.initializeApp();
  }

  runApp(const MyApp());
}
