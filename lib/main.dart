// Muhammad Senopati Panotogomo - 202310370311326
import 'package:flutter/material.dart';
import 'pages/login_page.dart';

void main() {
  runApp(const CinemaBookingApp());
}

class CinemaBookingApp extends StatelessWidget {
  const CinemaBookingApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cinema Booking',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.indigo,
        scaffoldBackgroundColor: Colors.grey[900],
      ),
      home: const LoginPage(),
    );
  }
}
