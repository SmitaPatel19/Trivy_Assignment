import 'package:flutter/material.dart';
import 'package:faker/faker.dart' hide Image;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Trivy Assignment',
      theme: ThemeData.dark(),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  bool isFrozen = false;
  late AnimationController _controller;
  int _selectedIndex = 1; // Start with "yolo pay" tab selected

  late Faker faker;
  late String cardNumber;
  late String expiryDate;
  final String cvv = "***";

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: const Duration(milliseconds: 500));

    // Initialize Faker values
    faker = Faker();
    cardNumber = faker.randomGenerator.numbers(9999, 4).join(" ");
    expiryDate = faker.date.time().substring(0, 5);
  }

  void toggleFreeze() {
    setState(() {
      isFrozen = !isFrozen;
      if (isFrozen) {
        _controller.forward();
      } else {
        _controller.reverse();
      }
    });
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true, // To make bottom nav bar float
      bottomNavigationBar: CustomBottomNavBar(
        selectedIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 50),
            const Text("select payment mode",
                style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Colors.white)),
            const SizedBox(height: 5),
            const Text(
              "choose your preferred payment method to make payment.",
              style: TextStyle(
                color: Colors.grey,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                    foregroundColor: Colors.white,
                    side: BorderSide(
                      style: BorderStyle.solid,
                      color: Colors.white.withOpacity(0.8),
                    ),
                  ),
                  child: const Text("pay"),
                ),
                const SizedBox(width: 10),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                    foregroundColor: Colors.red,
                    side: BorderSide(
                      style: BorderStyle.solid,
                      color: Colors.red.withOpacity(0.8),
                    ),
                  ),
                  child: const Text("card"),
                )
              ],
            ),
            const SizedBox(height: 20),
            const Text(
              "YOUR DIGITAL DEBIT CARD",
              style: TextStyle(
                color: Colors.grey,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                AnimatedOpacity(
                  opacity: isFrozen ? 0.3 : 1,
                  duration: const Duration(milliseconds: 500),
                  child: Container(
                    width: 200,
                    height: 332,
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.white.withOpacity(0.8), blurRadius: 5)
                      ],
                      // border: Border.all(color: Colors.grey.withOpacity(0.9), width: 2),
                    ),
                    child: isFrozen
                        ? const Center(
                            child:
                                Icon(Icons.lock, size: 50, color: Colors.red))
                        : Padding(
                            padding: const EdgeInsets.only(
                                left: 15, top: 9, right: 15),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              // mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Row(
                                  children: [
                                    const Text("YOLO",
                                        style: TextStyle(
                                          fontSize: 30,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.red,
                                        )),
                                    const SizedBox(
                                      width: 15,
                                    ),
                                    Image.asset('assets/yes_bank.png', width: 75,)

                    ],
                                ),
                                const SizedBox(height: 30),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                        height: 130,
                                        width: 60,
                                        child: Padding(
                                          padding:
                                              const EdgeInsets.only(top: 8),
                                          child: Text(cardNumber,
                                              style: const TextStyle(
                                                  fontSize: 18,
                                                  letterSpacing: 3,
                                                  fontWeight: FontWeight.bold)),
                                        )),
                                    const SizedBox(
                                      width: 50,
                                    ),
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        SizedBox(
                                          height: 70,
                                          width: 60,
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              const Text(
                                                "Expiry:",
                                                style: TextStyle(
                                                  fontSize: 14,
                                                  color: Colors.grey,
                                                ),
                                              ),
                                              Text(
                                                expiryDate,
                                                style: const TextStyle(
                                                  fontSize: 20,
                                                  // fontWeight: FontWeight.bold,
                                                  color: Colors.white,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        // SizedBox(height: 5,),
                                        SizedBox(
                                          height: 70,
                                          width: 60,
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              const Text(
                                                "CVV:",
                                                style: TextStyle(
                                                  fontSize: 14,
                                                  color: Colors.grey,
                                                ),
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    cvv,
                                                    style: const TextStyle(
                                                      fontSize: 20,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: Colors.grey,
                                                    ),
                                                  ),
                                                  const SizedBox(
                                                    width: 5,
                                                  ),
                                                  const Icon(
                                                    Icons.visibility_off_outlined,
                                                    color: Colors.red,
                                                  )
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                const Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Icon(
                                      Icons.copy_rounded,
                                      color: Colors.red,
                                      size: 20,
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Text(
                                      "copy details",
                                      style: TextStyle(
                                          // fontWeight: FontWeight.bold,
                                          color: Colors.red,
                                          fontSize: 18),
                                    )
                                  ],
                                ),

                                Padding(
                                  padding: const EdgeInsets.only(left: 70,top: 8),
                                  child: Image.asset("assets/rupay_logo.png",width: 100,),
                                ),
                                // const Padding(
                                //   padding: EdgeInsets.only(left: 70,top: 8),
                                //   child: Column(
                                //     mainAxisAlignment: MainAxisAlignment.end,
                                //     // crossAxisAlignment: CrossAxisAlignment.end,
                                //     children: [
                                //       Row(
                                //         children: [
                                //           Text(
                                //             "RuPay",
                                //             style: TextStyle(fontSize: 25),
                                //           ),
                                //           Icon(
                                //             Icons.currency_rupee_rounded,
                                //             size: 28,
                                //           ),
                                //         ],
                                //       ),
                                //       Text(
                                //         "PREPAID",
                                //         style: TextStyle(
                                //           fontSize: 15,
                                //         ),
                                //       ),
                                //     ],
                                //   ),
                                // ),
                                const SizedBox(
                                  height: 10,
                                ),
                              ],
                            ),
                          ),
                  ),
                ),
                const SizedBox(width: 20),
                GestureDetector(
                    onTap: toggleFreeze,
                    child: Column(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: Colors.black,
                            shape: BoxShape.circle,
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.white.withOpacity(0.9),
                                  blurRadius: 3)
                            ],
                          ),
                          child: Icon(Icons.ac_unit_sharp,
                              size: 30,
                              color: isFrozen ? Colors.red : Colors.white),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          isFrozen ? "Unfreeze" : "Freeze",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: isFrozen ? Colors.red : Colors.white,
                          ),
                        ),
                      ],
                    )),
              ],
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}

// Custom Bottom Navigation Bar
class CustomBottomNavBar extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onTap;

  const CustomBottomNavBar({
    super.key,
    required this.selectedIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        ClipPath(
          // clipper: CustomNavBarClipper(),
          child: Container(
            height: 100,
            decoration: BoxDecoration(
              borderRadius:
                  const BorderRadius.vertical(top: Radius.elliptical(200, 60)),
              color: Colors.black,
              boxShadow: [
                BoxShadow(color: Colors.white.withOpacity(0.9), blurRadius: 3)
              ],
            ),
          ),
        ),
        Positioned(
          top: 15,
          child: GestureDetector(
              onTap: () => onTap(1),
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: selectedIndex == 1 ? Colors.black : Colors.grey,
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                            color: Colors.white.withOpacity(0.9), blurRadius: 3)
                      ],
                    ),
                    child: Icon(Icons.qr_code_scanner,
                        size: 30,
                        color:
                            selectedIndex == 1 ? Colors.white : Colors.black),
                  ),
                  Text(
                    "yolo pay",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: selectedIndex == 1 ? Colors.white : Colors.grey,
                    ),
                  ),
                ],
              )),
        ),
        Positioned(
            bottom: 10,
            left: 40,
            child: GestureDetector(
                onTap: () => onTap(0),
                child: Column(
                  children: [
                    Icon(Icons.home,
                        size: 30,
                        color:
                            selectedIndex == 0 ? Colors.white : Colors.white24),
                    Text(
                      "home",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color:
                            selectedIndex == 0 ? Colors.white : Colors.white24,
                      ),
                    ),
                  ],
                ))),
        Positioned(
            bottom: 10,
            right: 40,
            child: GestureDetector(
                onTap: () => onTap(2),
                child: Column(
                  children: [
                    Icon(Icons.settings,
                        size: 30,
                        color: selectedIndex == 2 ? Colors.white : Colors.grey),
                    Text(
                      "ginie",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: selectedIndex == 2 ? Colors.white : Colors.grey,
                      ),
                    ),
                  ],
                ))),
      ],
    );
  }
}
