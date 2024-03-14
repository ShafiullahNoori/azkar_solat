import "dart:ui";
import "package:flutter/material.dart";
import "package:message_app/components/constants.dart";

var morningPrayerActive = false;
var noonPrayerActive = false;
var afterNoonPrayerActive = false;
var eveningPrayerActive = false;
var nightPrayerActive = false;

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  void initState() {
    var currentTime = DateTime.now().hour;

    super.initState();

    if (currentTime < 5) {
      morningPrayerActive = false;
      noonPrayerActive = false;
      afterNoonPrayerActive = false;
      eveningPrayerActive = false;
      nightPrayerActive = true;
    } else if (currentTime < 6) {
      morningPrayerActive = true;
      noonPrayerActive = false;
      afterNoonPrayerActive = false;
      eveningPrayerActive = false;
      nightPrayerActive = false;
    } else if (currentTime < 13) {
      morningPrayerActive = false;
      noonPrayerActive = false;
      afterNoonPrayerActive = false;
      eveningPrayerActive = false;
      nightPrayerActive = false;
    } else if (currentTime < 15) {
      morningPrayerActive = true;
      noonPrayerActive = true;
      afterNoonPrayerActive = false;
      eveningPrayerActive = false;
      nightPrayerActive = false;
    } else if (currentTime < 17) {
      morningPrayerActive = false;
      noonPrayerActive = false;
      afterNoonPrayerActive = true;
      eveningPrayerActive = false;
      nightPrayerActive = false;
    } else if (currentTime < 19) {
      morningPrayerActive = false;
      noonPrayerActive = false;
      afterNoonPrayerActive = false;
      eveningPrayerActive = true;
      nightPrayerActive = false;
    } else if (currentTime < 23) {
      morningPrayerActive = false;
      noonPrayerActive = false;
      afterNoonPrayerActive = false;
      eveningPrayerActive = false;
      nightPrayerActive = true;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.fill,
            image: AssetImage("assets/images/madina.jpg"),
          ),
        ),
        width: double.infinity,
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 1.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              PrayerButton(
                isButtonActive: morningPrayerActive,
                duaaCount: morningDuaa.toString(),
                buttonText: "Morning Prayer",
                buttonFunction: () {
                  activeZikr = "morningPrayer";
                  Navigator.pushNamed(context, "/morningPrayer");
                },
              ),
              const SizedBox(
                height: 20,
              ),
              PrayerButton(
                isButtonActive: noonPrayerActive,
                duaaCount: noonDuaa.toString(),
                buttonText: "Noon Prayer",
                buttonFunction: () {
                  activeZikr = "noonPrayer";
                  print(activeZikr);
                  Navigator.pushNamed(context, "/noonPrayer");
                },
              ),
              const SizedBox(
                height: 20,
              ),
              PrayerButton(
                isButtonActive: afterNoonPrayerActive,
                duaaCount: afternoonDuaa.toString(),
                buttonText: "Afternoon Prayer",
                buttonFunction: () {
                  Navigator.pushNamed(context, "/afterNoonPrayer");
                },
              ),
              const SizedBox(
                height: 20,
              ),
              PrayerButton(
                isButtonActive: eveningPrayerActive,
                duaaCount: eveningDuaa.toString(),
                buttonText: "Evening Prayer",
                buttonFunction: () {
                  Navigator.pushNamed(context, "/eveningPrayer");
                },
              ),
              const SizedBox(
                height: 20,
              ),
              PrayerButton(
                isButtonActive: nightPrayerActive,
                duaaCount: nightDuaa.toString(),
                buttonText: "Night Prayer",
                buttonFunction: () {
                  Navigator.pushNamed(context, "/nightPrayer");
                },
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                height: 100,
              ),
              PrayerButton(
                  buttonText: "About",
                  buttonFunction: () {
                    Navigator.pushNamed(context, "/about");
                  },
                  duaaCount: "",
                  isButtonActive: true)
            ],
          ),
        ),
      ),
    );
  }
}

class PrayerButton extends StatelessWidget {
  const PrayerButton(
      {super.key,
      required this.buttonText,
      required this.buttonFunction,
      this.duaaCount,
      required this.isButtonActive});

  final String buttonText;
  final String? duaaCount;
  final buttonFunction;
  final bool isButtonActive;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: isButtonActive ? buttonFunction : null,
      child: Container(
        alignment: Alignment.center,
        width: 250,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          gradient: isButtonActive
              ? LinearGradient(
                  colors: [Colors.blue, Color.fromARGB(255, 143, 123, 255)],
                )
              : LinearGradient(
                  colors: [
                    const Color.fromARGB(255, 75, 75, 75),
                    Color.fromARGB(255, 189, 189, 189)
                  ],
                ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              buttonText,
              style: const TextStyle(color: Colors.white, fontSize: 20),
            ),
            Text(
              duaaCount.toString(),
              style: TextStyle(color: Colors.white, fontSize: 20),
            )
          ],
        ),
      ),
    );
  }
}
