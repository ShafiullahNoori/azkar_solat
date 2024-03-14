import 'package:flutter/material.dart';
import 'package:message_app/components/constants.dart';

class PrayerDuaa extends StatefulWidget {
  const PrayerDuaa({
    super.key,
    required this.prayerTime,
  });

  final String prayerTime;

  @override
  State<PrayerDuaa> createState() => _PrayerDuaaState();
}

class _PrayerDuaaState extends State<PrayerDuaa> {
  var completedZikre = 0;

  var alhamdulilahCount = 0;
  var subhanullahCount = 0;
  var allahAkbar = 0;
  var activeImage = "assets/images/azkar-1.jpg";

  bool isSubhanullahCompleted = false;
  bool isAllahAkbarCompleted = false;
  bool isAlhamdulilahCompleted = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: Text(widget.prayerTime),
        centerTitle: true,
      ),
      body: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: 400,
              width: 300,
              decoration: BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.cover, image: AssetImage(activeImage)),
                borderRadius: BorderRadius.all(
                  Radius.circular(8.0),
                ),
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            const SizedBox(
              height: 8,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Icon(
                      Icons.check,
                      color:
                          isAllahAkbarCompleted ? Colors.green : Colors.white,
                    ),
                    Text(
                      "الله اکبر",
                      style: TextStyle(
                          color: isAllahAkbarCompleted
                              ? Colors.black
                              : const Color.fromARGB(255, 87, 87, 87)),
                    ),
                    Text(
                      allahAkbar.toString(),
                      style: TextStyle(
                          color: isAllahAkbarCompleted
                              ? Colors.black
                              : const Color.fromARGB(255, 87, 87, 87)),
                    )
                  ],
                ),
                Column(
                  children: [
                    Icon(
                      Icons.check,
                      color:
                          isSubhanullahCompleted ? Colors.green : Colors.white,
                    ),
                    Text(
                      "سبحان الله",
                      style: TextStyle(
                          color: isSubhanullahCompleted
                              ? Colors.black
                              : const Color.fromARGB(255, 87, 87, 87)),
                    ),
                    Text(
                      subhanullahCount.toString(),
                      style: TextStyle(
                          color: isSubhanullahCompleted
                              ? Colors.black
                              : const Color.fromARGB(255, 87, 87, 87)),
                    )
                  ],
                ),
                Column(
                  children: [
                    Icon(
                      Icons.check,
                      color:
                          isAlhamdulilahCompleted ? Colors.green : Colors.white,
                    ),
                    Text(
                      "الحمد الله",
                      style: TextStyle(
                          color: isAlhamdulilahCompleted
                              ? Colors.black
                              : const Color.fromARGB(255, 87, 87, 87)),
                    ),
                    Text(
                      alhamdulilahCount.toString(),
                      style: TextStyle(
                          color: isAlhamdulilahCompleted
                              ? Colors.black
                              : const Color.fromARGB(255, 87, 87, 87)),
                    )
                  ],
                ),
              ],
            ),
            const SizedBox(
              height: 25,
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(horizontal: 90, vertical: 10),
                  backgroundColor: Colors.blue),
              onPressed: () {
                if (alhamdulilahCount < 5) {
                  setState(() {
                    alhamdulilahCount++;
                  });
                } else if (subhanullahCount < 5) {
                  setState(() {
                    activeImage = "assets/images/azkar-2.jpg";
                    subhanullahCount++;
                    isAlhamdulilahCompleted = true;
                  });
                } else if (allahAkbar < 6) {
                  setState(() {
                    activeImage = "assets/images/azkar-3.jpg";
                    allahAkbar++;
                    isSubhanullahCompleted = true;
                  });
                } else if (allahAkbar == 6) {
                  setState(() {
                    isAllahAkbarCompleted = true;
                  });
                  completedZikre++;
                  if (activeZikr == "morningPrayer") {
                    setState(() {
                      morningDuaa++;
                    });
                  } else if (activeZikr == "noonPrayer") {
                    setState(() {
                      noonDuaa++;
                    });
                    print(noonDuaa);
                  }
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: Text("Congratulations!"),
                      content: Text(
                          "You have completed the Zikr $completedZikre time!"),
                      actions: [
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.red,
                          ),
                          onPressed: () {
                            setState(() {
                              isAlhamdulilahCompleted = false;
                              isAllahAkbarCompleted = false;
                              isSubhanullahCompleted = false;

                              alhamdulilahCount = 0;
                              subhanullahCount = 0;
                              allahAkbar = 0;
                              activeImage = "assets/images/azkar-1.jpg";
                            });
                            Navigator.pushReplacementNamed(context, "/");
                          },
                          child: Text(
                            "Home",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blue,
                          ),
                          onPressed: () {
                            setState(() {
                              isAlhamdulilahCompleted = false;
                              isAllahAkbarCompleted = false;
                              isSubhanullahCompleted = false;

                              alhamdulilahCount = 0;
                              subhanullahCount = 0;
                              allahAkbar = 0;
                              activeImage = "assets/images/azkar-1.jpg";
                            });
                            Navigator.pop(context);
                          },
                          child: Text(
                            "Do again",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                  );
                }
              },
              child: Text(
                "ذکر",
                style: TextStyle(color: Colors.white, fontSize: 30),
              ),
            )
          ],
        ),
      ),
    );
  }
}
