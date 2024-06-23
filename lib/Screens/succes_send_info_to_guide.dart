import 'package:flutter/material.dart';
import 'package:guru/Screens/home_screen.dart';
import 'package:lottie/lottie.dart';

class Success extends StatelessWidget {
  final String tourGuideName;
  final String tourGuidePhoneNumber;
  final String touristName;
  final String touristPhoneNumber;
  final String touristEmail;
  final String touristDate;
  const Success({super.key,required this.tourGuideName,required this.tourGuidePhoneNumber,required this.touristName,required this.touristEmail,required this.touristPhoneNumber,required this.touristDate});

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Information sent to [$tourGuideName]",
            style: const TextStyle(color: Colors.white),
          ),
          centerTitle: true,
          backgroundColor: const Color.fromARGB(255, 1, 61, 58),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 30),
          child: Stack(
            children: [
              const Positioned(
                left: 2,
                top: 10,
                child: Text(
                  "Your details are sent to the Tour Guide.\nThe Tour Guide will contact you immediately.\nWishing you Happy Tour",
                  style: TextStyle(fontSize: 16),
                ),
              ),
              const Positioned(
                left: 2,
                top: 80,
                child: Text(
                  "----------Guru Tour Guides----------",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    color: Color.fromARGB(255, 1, 61, 58),
                  ),
                ),
              ),
              Positioned(
                left: 20,
                top: 160,
                child: Container(
                  width: screenSize.width * 0.8,
                  height: screenSize.height * 0.18,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: Colors.grey,
                      width: 1,
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 10),
                        child: Container(
                          width: screenSize.width * 0.9,
                          decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 1, 61, 58),
                          ),
                          child: const Align(
                            alignment: Alignment.center,
                            child: Text(
                              "Tour Guide Details",
                              style: TextStyle(
                                  fontSize: 20,
                                  color: Color.fromARGB(255, 255, 255, 255),
                                  fontWeight: FontWeight.w700),
                            ),
                          ),
                        ),
                      ),
                       Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                         const Icon(
                            Icons.person,
                            color: Color.fromARGB(255, 1, 61, 58),
                            size: 30,
                          ),
                        const  SizedBox(
                            width: 8,
                          ),
                          Text(
                            "$tourGuideName",
                            style: const TextStyle(
                              fontSize: 18,
                              color: Color.fromARGB(255, 1, 61, 58),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                       Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                         const Icon(
                            Icons.phone,
                            color: Color.fromARGB(255, 1, 61, 58),
                            size: 25,
                          ),
                         const SizedBox(
                            width: 8,
                          ),
                          Text(
                            "$tourGuidePhoneNumber",
                            style: const  TextStyle(
                              fontSize: 18,
                              color: Color.fromARGB(255, 1, 61, 58),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                left: 0,
                top: 140,
                child: Card(
                  elevation: 5,
                  child: Image.asset(
                    "images/guru_contact1.jpg",
                    width: 90,
                  ),
                ),
              ),
              Positioned(
                left: 20,
                top: 360,
                child: Container(
                  width: screenSize.width * 0.8,
                  height: screenSize.height * 0.25,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: Colors.grey,
                      width: 1,
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 10),
                        child: Container(
                          width: screenSize.width * 0.9,
                          decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 1, 61, 58),
                          ),
                          child: const Align(
                            alignment: Alignment.center,
                            child: Text(
                              "Tourist Details",
                              style: TextStyle(
                                  fontSize: 20,
                                  color: Color.fromARGB(255, 255, 255, 255),
                                  fontWeight: FontWeight.w700),
                            ),
                          ),
                        ),
                      ),
                      Row(
                        children: [
                          Container(
                            width: screenSize.width * 0.1,
                            child: const Icon(
                              Icons.person,
                              color: Color.fromARGB(255, 1, 61, 58),
                              size: 30,
                            ),
                          ),
                          const SizedBox(
                            width: 8,
                          ),
                          Text(
                            "$touristName",
                            style: const TextStyle(
                              fontSize: 18,
                              color: Color.fromARGB(255, 1, 61, 58),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Row(
                        children: [
                          Container(
                            width: screenSize.width * 0.1,
                            child: const Icon(
                              Icons.phone,
                              color: Color.fromARGB(255, 1, 61, 58),
                              size: 25,
                            ),
                          ),
                          const SizedBox(
                            width: 8,
                          ),
                           Text(
                            "$touristPhoneNumber",
                            style: const TextStyle(
                              fontSize: 18,
                              color: Color.fromARGB(255, 1, 61, 58),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Row(
                        children: [
                          Container(
                            width: screenSize.width * 0.1,
                            child: const Icon(
                              Icons.mail,
                              color: Color.fromARGB(255, 1, 61, 58),
                              size: 25,
                            ),
                          ),
                          const SizedBox(
                            width: 8,
                          ),
                           Text(
                            "$touristEmail",
                            style: const TextStyle(
                              fontSize: 18,
                              color: Color.fromARGB(255, 1, 61, 58),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Row(
                        children: [
                          Container(
                            width: screenSize.width * 0.1,
                            child: const Icon(
                              Icons.calendar_month,
                              color: Color.fromARGB(255, 1, 61, 58),
                              size: 25,
                            ),
                          ),
                          const SizedBox(
                            width: 8,
                          ),
                          Text(
                            "$touristDate",
                            style: const TextStyle(
                              fontSize: 18,
                              color: Color.fromARGB(255, 1, 61, 58),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                left: 70,
                top: 600,
                child: ElevatedButton.icon(
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
              ),
            ],
          ),
        ));
  }
}
