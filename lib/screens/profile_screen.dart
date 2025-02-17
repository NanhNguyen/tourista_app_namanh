import 'package:flutter/material.dart';
import 'package:tourista_app/screens/edit_profile_screen.dart';
import 'package:tourista_app/screens/favorite_screen.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.arrow_back_ios),
        title: const Text(
          "Profile",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) => const EditProfileScreen(),
                ));
              },
              icon: const Icon(
                Icons.edit_outlined,
                color: Color(0xffFF6421),
                size: 35,
              )),
          const SizedBox(width: 10)
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Column(
              children: [
                Center(
                  child: SizedBox(
                    height: 93,
                    width: 93,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(100),
                      child: Image.asset(
                        'assets/Images/avt.png',
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  'Nanh Nguyen',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const Text(
                  'namanhnguyen@gmail.com',
                  style: TextStyle(fontSize: 12, color: Colors.grey),
                )
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              height: 80,
              width: 350,
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(16)),
              child: Row(
                children: [
                  const Column(
                    children: [
                      Text(
                        "Reward Point",
                        style: TextStyle(
                            fontSize: 12, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "50",
                        style: TextStyle(
                            color: Color(0xffFF6421),
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                  const SizedBox(width: 10),
                  VerticalDivider(
                    thickness: 1.5,
                    color: Colors.grey[300],
                  ),
                  const Column(
                    children: [
                      Text(
                        "Travel Trips",
                        style: TextStyle(
                            fontSize: 12, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "40",
                        style: TextStyle(
                            color: Color(0xffFF6421),
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                  const SizedBox(width: 5),
                  VerticalDivider(
                    thickness: 1.5,
                    color: Colors.grey[300],
                  ),
                  const Column(
                    children: [
                      Text(
                        "Bucket List",
                        style: TextStyle(
                            fontSize: 12, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "200",
                        style: TextStyle(
                            color: Color(0xffFF6421),
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            GestureDetector(
              child: const SizedBox(
                height: 60,
                width: 350,
                child: Row(
                  children: [
                    Icon(
                      Icons.person_outline_rounded,
                      color: Colors.grey,
                      size: 30,
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Expanded(
                      child: Text(
                        "Profile",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                    ),
                    Icon(
                      Icons.arrow_forward_ios_outlined,
                      size: 30,
                      color: Colors.grey,
                    )
                  ],
                ),
              ),
            ),
            Divider(
              thickness: 1.5,
              color: Colors.grey[300],
            ),
            GestureDetector(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) => const FavoriteScreen(),
                ));
              },
              child: const SizedBox(
                height: 60,
                width: 350,
                child: Row(
                  children: [
                    Icon(
                      Icons.bookmark_outline_rounded,
                      color: Colors.grey,
                      size: 30,
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Expanded(
                      child: Text(
                        "Bookmarked",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                    ),
                    Icon(
                      Icons.arrow_forward_ios_outlined,
                      size: 30,
                      color: Colors.grey,
                    )
                  ],
                ),
              ),
            ),
            Divider(
              thickness: 1.5,
              color: Colors.grey[300],
            ),
            GestureDetector(
              child: SizedBox(
                height: 60,
                width: 350,
                child: Row(
                  children: [
                    Image.asset("assets/Icons/trips.png"),
                    const SizedBox(
                      width: 20,
                    ),
                    const Expanded(
                      child: Text(
                        "Previous Trips",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                    ),
                    const Icon(
                      Icons.arrow_forward_ios_outlined,
                      size: 30,
                      color: Colors.grey,
                    )
                  ],
                ),
              ),
            ),
            Divider(
              thickness: 1.5,
              color: Colors.grey[300],
            ),
            GestureDetector(
              child: const SizedBox(
                height: 60,
                width: 350,
                child: Row(
                  children: [
                    Icon(
                      Icons.settings_outlined,
                      color: Colors.grey,
                      size: 30,
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Expanded(
                      child: Text(
                        "Settings",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                    ),
                    Icon(
                      Icons.arrow_forward_ios_outlined,
                      size: 30,
                      color: Colors.grey,
                    )
                  ],
                ),
              ),
            ),
            Divider(
              thickness: 1.5,
              color: Colors.grey[300],
            ),
            GestureDetector(
              child: SizedBox(
                height: 60,
                width: 350,
                child: Row(
                  children: [
                    Image.asset("assets/Icons/Version.png"),
                    const SizedBox(
                      width: 20,
                    ),
                    const Expanded(
                      child: Text(
                        "Version",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                    ),
                    const Icon(
                      Icons.arrow_forward_ios_outlined,
                      size: 30,
                      color: Colors.grey,
                    )
                  ],
                ),
              ),
            ),
            Divider(
              thickness: 1.5,
              color: Colors.grey[300],
            ),
          ],
        ),
      ),
    );
  }
}
