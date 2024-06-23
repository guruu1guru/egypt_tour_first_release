import 'package:flutter/material.dart';
import 'package:guru/Screens/home_screen.dart';
import 'package:guru/Screens/tour_guides.dart';

class TourGuideSuccess extends StatelessWidget {
  const TourGuideSuccess({super.key});

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Your Information is saved ",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 1, 61, 58),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: screenSize.width * 0.8,
              height: screenSize.height * 0.2,
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 1, 61, 58),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Center(
                  child: const Text(
                    "Your Details are saved",
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  )),
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton.icon(
              icon: const Icon(
                Icons.home,
                color: Colors.white,
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 1, 61, 58),
                minimumSize: const Size(225, 40),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return HomeScreen();
                    },
                  ),
                );
              },
              label: const Text(
                "Go to Home",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
