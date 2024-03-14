import "package:flutter/cupertino.dart";
import "package:flutter/material.dart";

void main() => runApp(const ZikrComplete());

class ZikrComplete extends StatelessWidget {
  const ZikrComplete({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              "Congratulations You have Completed the zikr once!😎",
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 20,
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(CupertinoIcons.back),
                  SizedBox(
                    width: 5,
                  ),
                  Text("Go back!")
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
