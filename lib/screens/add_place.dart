import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tourista_app/firebase/place_firebase_service.dart';

class AddPlace extends StatefulWidget {
  const AddPlace({super.key});

  @override
  State<AddPlace> createState() => _AddPlaceState();
}

class _AddPlaceState extends State<AddPlace> {
  File? selectedImage;
  Future<void> pickImageFromGallery() async {
    final returnImage =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (returnImage == null) {
      return;
    }
    setState(() {
      selectedImage = File(returnImage.path);
    });
  }

  TextEditingController placeIDController = TextEditingController();
  TextEditingController placeNameController = TextEditingController();
  TextEditingController placeAddressController = TextEditingController();
  TextEditingController placeDescriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back)),
        title: const Text(
          "Add Place",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 10,
              ),
              const Text(
                "Hotel Name",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
              ),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                height: 55,
                width: 350,
                child: TextField(
                  controller: placeNameController,
                  style: const TextStyle(fontSize: 13),
                  decoration: InputDecoration(
                      hintText: 'Input for hotel name',
                      hintStyle: const TextStyle(
                          fontSize: 14, color: Color(0xff9a9a9a)),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: const BorderSide(color: Colors.black))),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                'Do not exceed 40 characters when entering.',
                style: TextStyle(color: Color(0xff9a9a9a), fontSize: 12),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                "Address",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
              ),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                height: 55,
                width: 350,
                child: TextField(
                  controller: placeAddressController,
                  style: const TextStyle(fontSize: 13),
                  decoration: InputDecoration(
                      hintText: 'Input for address',
                      hintStyle: const TextStyle(
                          fontSize: 14, color: Color(0xff9a9a9a)),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: const BorderSide(color: Colors.black))),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                "Description",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
              ),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                width: 350,
                child: TextField(
                  controller: placeDescriptionController,
                  style: const TextStyle(fontSize: 13),
                  minLines: 1,
                  maxLines: 20,
                  decoration: InputDecoration(
                      hintText: 'Input for description',
                      hintStyle: const TextStyle(
                          fontSize: 14, color: Color(0xff9a9a9a)),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: const BorderSide(color: Colors.black))),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                "Hotel Image",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
              ),
              const SizedBox(
                height: 10,
              ),
              selectedImage != null
                  ? Stack(
                      alignment: Alignment.topRight,
                      children: [
                        SizedBox(
                          width: 350,
                          height: 165,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Image.file(
                              selectedImage!,
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                        IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.delete_outline_outlined,
                              size: 30,
                              color: Colors.white,
                            ))
                      ],
                    )
                  : Container(
                      height: 139,
                      width: 139,
                      decoration:
                          BoxDecoration(borderRadius: BorderRadius.circular(8)),
                      child: GestureDetector(
                        onTap: () {
                          pickImageFromGallery();
                        },
                        child: DottedBorder(
                          radius: const Radius.circular(8),
                          borderType: BorderType.RRect,
                          dashPattern: const [8, 8],
                          child: const Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.image_outlined,
                                  color: Color(0xff9a9a9a),
                                  size: 30,
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  'Add Image',
                                  style: TextStyle(
                                      fontSize: 13,
                                      color: Color(0xff9a9a9a),
                                      decoration: TextDecoration.underline),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
              const SizedBox(
                height: 80,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                      width: 111,
                      height: 53,
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.black),
                          borderRadius: BorderRadius.circular(8)),
                      child: const Center(
                        child: Text(
                          "Cancel",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Color(0xff9a9a9a),
                              fontSize: 14),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  GestureDetector(
                    onTap: () {
                      TravelPlaceFirebaseService.addTravelPlace(
                        name: placeNameController.text,
                        address: placeAddressController.text,
                        description: placeDescriptionController.text,
                      );
                      Navigator.pop(context);
                    },
                    child: Container(
                      height: 53,
                      width: 230,
                      decoration: BoxDecoration(
                          color: const Color(0xffFF6421),
                          borderRadius: BorderRadius.circular(8)),
                      child: const Center(
                        child: Text(
                          "Done",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              fontSize: 14),
                        ),
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
