import "package:flutter/material.dart";
import "package:message_app/pages/about.dart";
import "package:message_app/pages/main_page.dart";
import 'package:message_app/pages/morning_duaa.dart';

void main() => runApp(const Tasbih());

class Tasbih extends StatefulWidget {
  const Tasbih({super.key});

  @override
  State<Tasbih> createState() => _TasbihState();
}

class _TasbihState extends State<Tasbih> {
  @override
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        fontFamily: "Kufam",
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.blue,
          titleTextStyle: TextStyle(color: Colors.white, fontSize: 25),
          iconTheme: IconThemeData(color: Colors.white),
        ),
      ),
      title: "Tasbih",
      initialRoute: "/",
      routes: {
        "/": (context) => const MainPage(),
        "/morningPrayer": (context) => const PrayerDuaa(
              prayerTime: "Morning Prayer",
            ),
        "/noonPrayer": (context) => const PrayerDuaa(
              prayerTime: "Noon Prayer",
            ),
        "/afterNoonPrayer": (context) => const PrayerDuaa(
              prayerTime: "Afternoon Prayer",
            ),
        "/eveningPrayer": (context) => const PrayerDuaa(
              prayerTime: "Evening Prayer",
            ),
        "/nightPrayer": (context) => const PrayerDuaa(
              prayerTime: "Night Prayer",
            ),
        "/about": (context) => const AboutPage(),
      },
    );
  }
}
