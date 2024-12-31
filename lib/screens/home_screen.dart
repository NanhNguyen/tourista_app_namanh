import 'package:flutter/material.dart';
import 'package:tourista_app/data/database.dart';
import 'package:tourista_app/screens/detail_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              children: [
                Row(
                  children: [
                    Container(
                      height: 50,
                      width: 120,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(22),
                          color: const Color(0xffF7F7F9)),
                      child: Row(
                        children: [
                          SizedBox(
                            height: 35,
                            width: 35,
                            child: Image.asset("assets/Images/avt.png"),
                          ),
                          const Text(
                            " Nanh",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Color(0xff1B1E28),
                                fontSize: 14),
                          ),
                        ],
                      ),
                    ),
                    const Expanded(child: SizedBox()),
                    Container(
                      height: 45,
                      width: 45,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        color: const Color(0xffF7F7F9),
                      ),
                      child: const Center(
                        child: Text(
                          "+",
                          style:
                              TextStyle(fontSize: 16, color: Color(0xff33363F)),
                        ),
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                RichText(
                  text: const TextSpan(
                    children: [
                      TextSpan(
                          text: "Discover the wonders of the ",
                          style: TextStyle(
                              fontSize: 37,
                              fontWeight: FontWeight.bold,
                              color: Color(0xff2E323E))),
                      TextSpan(
                          text: "world!",
                          style: TextStyle(
                              fontSize: 37,
                              fontWeight: FontWeight.bold,
                              color: Color(0xffFF7029)))
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Row(
                  children: [
                    Expanded(
                      child: Text(
                        'Best Destination',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Color(0xff1B1E28),
                            fontSize: 20),
                      ),
                    ),
                    Text(
                      'View all',
                      style: TextStyle(color: Color(0xffFF6421), fontSize: 14),
                    ),
                    SizedBox(
                      width: 10,
                    )
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                  height: 500,
                  child: ListView.separated(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    separatorBuilder: (context, index) => const SizedBox(
                      width: 20,
                    ),
                    itemCount: travelPlaces.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (BuildContext context) =>
                                DetailScreen(place: travelPlaces[index]),
                          ));
                        },
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Stack(
                              alignment: Alignment.topRight,
                              children: [
                                SizedBox(
                                  height: 400,
                                  width: 280,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(20),
                                    child: Image.asset(
                                      travelPlaces[index].image,
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                ),
                                IconButton(
                                  iconSize: 30,
                                  onPressed: () {},
                                  icon: const Icon(
                                    Icons.bookmark_outline_rounded,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: [
                                Text(
                                  travelPlaces[index].name,
                                  style: const TextStyle(
                                      color: Color(0xff1B1E28),
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold),
                                ),
                                const SizedBox(width: 20),
                                const Icon(
                                  Icons.star,
                                  color: Colors.amber,
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  travelPlaces[index].rating.toString(),
                                  style: const TextStyle(fontSize: 12),
                                )
                              ],
                            ),
                            Row(
                              children: [
                                const Icon(
                                  Icons.location_on_outlined,
                                  color: Color(0xff7D848D),
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  travelPlaces[index].location,
                                  style: const TextStyle(
                                      color: Color(0xff7D848D), fontSize: 12),
                                ),
                                const SizedBox(
                                  width: 20,
                                ),
                                Image.asset(
                                    'assets/Images/group professors.png')
                              ],
                            )
                          ],
                        ),
                      );
                    },
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
