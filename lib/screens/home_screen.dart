import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:tourista_app/data/database.dart';
import 'package:tourista_app/firebase/place_firebase_service.dart';
import 'package:tourista_app/firebase/travel_places_model.dart';
import 'package:tourista_app/riverpod/detail_notifier.dart';
import 'package:tourista_app/riverpod/home_notifier.dart';
import 'package:tourista_app/screens/add_place.dart';
import 'package:tourista_app/screens/detail_screen.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final homeNotifier =
        ref.watch(homeStateNotifierProvider.select((value) => value.places));
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
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (BuildContext context) => const AddPlace(),
                        ));
                      },
                      child: Container(
                        height: 45,
                        width: 45,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          color: const Color(0xffF7F7F9),
                        ),
                        child: const Center(
                          child: Text(
                            "+",
                            style: TextStyle(
                                fontSize: 16, color: Color(0xff33363F)),
                          ),
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
                  child: StreamBuilder<List<TravelPlacesModel>>(
                      stream: TravelPlaceFirebaseService.travelPlaceStream,
                      builder: (context, snapshot) {
                        //TODO: chi can them dieu kien cac dia diem co fav la duoc man hinh favorite
                        final places = snapshot.data ?? [];

                        ///
                        if (places.isEmpty) {
                          return Center(
                            child: Text(
                              "Loading Places....",
                              style: TextStyle(
                                  fontSize: 16, color: Colors.grey[600]),
                            ),
                          );
                        }
                        // print(places.first.name);
                        return ListView.separated(
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          separatorBuilder: (context, index) => const SizedBox(
                            width: 20,
                          ),
                          itemCount: places.length,
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              onTap: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                  builder: (BuildContext context) =>
                                      DetailScreen(
                                    place: places[index],
                                    // STT: places
                                    //     .indexOf(places[index]),
                                  ),
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
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          child: Image.asset(
                                            places[index].image,
                                            fit: BoxFit.fill,
                                          ),
                                        ),
                                      ),
                                      IconButton(
                                          iconSize: 30,
                                          onPressed: () {
                                            // ref
                                            //     .read(homeStateNotifierProvider
                                            //         .notifier)
                                            //     .onClickToChangeTheBookMark(
                                            //         index);
                                            TravelPlaceFirebaseService
                                                .onChangeFavorite(
                                                    places: places[index],
                                                    isFavorite: !places[index]
                                                        .favorite);
                                          },
                                          icon: (places[index].favorite)
                                              ? Icon(
                                                  Icons.bookmark,
                                                  size: 35,
                                                  color: Colors.amber[700],
                                                )
                                              : const Icon(
                                                  Icons
                                                      .bookmark_border_outlined,
                                                  size: 35,
                                                  color: Colors.white,
                                                )),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        places[index].name,
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
                                        places[index].rating.toString(),
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
                                        places[index].location,
                                        style: const TextStyle(
                                            color: Color(0xff7D848D),
                                            fontSize: 12),
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
                        );
                      }),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
