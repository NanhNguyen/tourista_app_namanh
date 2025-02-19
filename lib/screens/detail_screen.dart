import 'dart:ui';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:tourista_app/data/database.dart';
import 'package:tourista_app/firebase/place_firebase_service.dart';
import 'package:tourista_app/firebase/travel_places_model.dart';
import 'package:tourista_app/riverpod/detail_notifier.dart';
import 'package:tourista_app/riverpod/home_notifier.dart';
import 'package:tourista_app/screens/edit_place.dart';

class DetailScreen extends ConsumerStatefulWidget {
  final TravelPlacesModel place;
  const DetailScreen({
    super.key,
    required this.place,
  });

  @override
  ConsumerState<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends ConsumerState<DetailScreen> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback(
      (timeStamp) {
        ref
            .read(detailStateNotifierProvider.notifier)
            .setPlaceState(widget.place);
      },
    );

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: Stack(
        children: [
          Image.asset(widget.place.image),
          Column(
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 30),
                child: Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(
                        Icons.arrow_back_ios,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(width: 230),
                    IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.ios_share_rounded,
                          size: 30,
                          color: Colors.white,
                        )),
                    IconButton(
                        onPressed: () {
                          // ref
                          //     .read(detailStateNotifierProvider.notifier)
                          //     .onClick();
                          // ref
                          //     .read(homeStateNotifierProvider.notifier)
                          //     .onClickToChangeTheBookMark(widget.STT);
                          TravelPlaceFirebaseService.onChangeFavorite(
                              places: widget.place,
                              isFavorite: !widget.place.favorite);
                        },
                        icon: (widget.place.favorite)
                            ? Icon(
                                Icons.bookmark,
                                size: 35,
                                color: Colors.amber[700],
                              )
                            : const Icon(
                                Icons.bookmark_border_outlined,
                                size: 35,
                                color: Colors.white,
                              ))
                  ],
                ),
              ),
              const SizedBox(height: 120),
              Container(
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                    ),
                    color: Colors.white),
                height: 610,
                width: 410,
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          children: [
                            Row(
                              children: [
                                Expanded(
                                  child: Text(
                                    widget.place.name,
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Color(0xff1A1A1A),
                                        fontSize: 18),
                                  ),
                                ),
                                IconButton(
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => EditPlace(
                                            place: widget.place,
                                          ),
                                        ));
                                  },
                                  icon: const Icon(
                                    Icons.edit_outlined,
                                    size: 30,
                                    color: Color(0xffFF6421),
                                  ),
                                ),
                                IconButton(
                                    onPressed: () {
                                      TravelPlaceFirebaseService.deleteProduct(
                                          id: widget.place.id.toString());
                                    },
                                    icon: const Icon(
                                      Icons.delete_outline_rounded,
                                      color: Color(0xff9a9a9a),
                                    ))
                              ],
                            ),
                            const SizedBox(height: 10),
                            Row(
                              children: [
                                Icon(
                                  Icons.star_rounded,
                                  color: Colors.amber[700],
                                ),
                                Icon(
                                  Icons.star_rounded,
                                  color: Colors.amber[700],
                                ),
                                Icon(
                                  Icons.star_rounded,
                                  color: Colors.amber[700],
                                ),
                                Icon(
                                  Icons.star_rounded,
                                  color: Colors.amber[700],
                                ),
                                Icon(
                                  Icons.star_rounded,
                                  color: Colors.amber[700],
                                ),
                                const SizedBox(width: 10),
                                Text(widget.place.rating.toString()),
                                const SizedBox(width: 10),
                                const Text("(1.2k reviews)"),
                              ],
                            ),
                            const SizedBox(height: 10),
                            Row(
                              children: [
                                const Icon(
                                  Icons.location_on,
                                  color: Color(0xff9A9A9A),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  widget.place.location,
                                  style:
                                      const TextStyle(color: Color(0xff9A9A9A)),
                                ),
                              ],
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        const Text(
                          "Description",
                          style: TextStyle(
                              color: Color(0xff0057FF),
                              fontWeight: FontWeight.bold,
                              fontSize: 16),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          widget.place.description,
                          style: const TextStyle(fontSize: 13),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const Row(
                          children: [
                            Expanded(
                              child: Text(
                                "Reviews",
                                style: TextStyle(
                                    color: Color(0xff0057FF),
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16),
                              ),
                            ),
                            Text(
                              "See more",
                              style: TextStyle(
                                  color: Color(0xff1A1A1A),
                                  decoration: TextDecoration.underline,
                                  fontSize: 14),
                            )
                          ],
                        ),
                        const SizedBox(height: 10),
                        Column(
                          children: [
                            Row(
                              children: [
                                SizedBox(
                                  height: 40,
                                  width: 40,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(100),
                                    child: Image.asset(
                                      "assets/Images/reviewer1.jpg",
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 10),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Text("Sluska. G"),
                                      Row(
                                        children: [
                                          Icon(
                                            Icons.star_rounded,
                                            color: Colors.amber[700],
                                          ),
                                          Icon(
                                            Icons.star_rounded,
                                            color: Colors.amber[700],
                                          ),
                                          Icon(
                                            Icons.star_rounded,
                                            color: Colors.amber[700],
                                          ),
                                          Icon(
                                            Icons.star_rounded,
                                            color: Colors.amber[700],
                                          ),
                                          Icon(
                                            Icons.star_rounded,
                                            color: Colors.amber[700],
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                                const Text(
                                  '12',
                                  style: TextStyle(color: Colors.grey),
                                ),
                                IconButton(
                                    onPressed: () {},
                                    icon: const Icon(
                                      Icons.thumb_up,
                                      color: Colors.grey,
                                    ))
                              ],
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            const Text(
                              "The house was really comfortable. Everything was clean and organized. I do recommended.",
                              style: TextStyle(fontSize: 12),
                            )
                          ],
                        ),
                        const SizedBox(height: 10),
                        Column(
                          children: [
                            Row(
                              children: [
                                SizedBox(
                                  height: 40,
                                  width: 40,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(100),
                                    child: Image.asset(
                                      "assets/Images/reviewer2.jpg",
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 10),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Text("Mark N."),
                                      Row(
                                        children: [
                                          Icon(
                                            Icons.star_rounded,
                                            color: Colors.amber[700],
                                          ),
                                          Icon(
                                            Icons.star_rounded,
                                            color: Colors.amber[700],
                                          ),
                                          Icon(
                                            Icons.star_rounded,
                                            color: Colors.amber[700],
                                          ),
                                          Icon(
                                            Icons.star_rounded,
                                            color: Colors.amber[700],
                                          ),
                                          Icon(
                                            Icons.star_rounded,
                                            color: Colors.amber[700],
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                                const Text(
                                  '9',
                                  style: TextStyle(color: Colors.grey),
                                ),
                                IconButton(
                                    onPressed: () {},
                                    icon: const Icon(
                                      Icons.thumb_up,
                                      color: Colors.grey,
                                    ))
                              ],
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            const Text(
                              "stayed two nights. House was clean and as advertised. Nice property and close to everything we needed. 3 girls under 10yrs and 2 adults.",
                              style: TextStyle(fontSize: 12),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
