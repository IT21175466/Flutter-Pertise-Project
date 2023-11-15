import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chip_tags/flutter_chip_tags.dart';
import 'package:image_picker/image_picker.dart';
import 'package:uuid/uuid.dart';

class AddArticle extends StatefulWidget {
  const AddArticle({super.key});

  @override
  State<AddArticle> createState() => _AddArticleState();
}

class _AddArticleState extends State<AddArticle> {
  bool isClicked = false;
  String docID = '';
  String imageUrl = '';

  //Generate ID
  String generateRandomId() {
    var uuid = Uuid();
    return uuid.v4();
  }

  @override
  void initState() {
    super.initState();
    generateRandomId();
  }

  TextEditingController _topicController = TextEditingController();
  TextEditingController _descriptionController = TextEditingController();

  //Tags
  List<String> _myList = [];

  void checkTagsLimit() {
    if (_myList.length == 5) {
      print('The list has exactly 5 elements.');
    } else {
      print('The list does not have 5 elements.');
    }
  }

  //Image
  File? _selectedImage;

  Future _getImageFromGallery() async {
    final imagePicker = ImagePicker();
    final pickedImage = await imagePicker.pickImage(
        source: ImageSource.gallery, imageQuality: 60);
    if (pickedImage != null) {
      setState(() {
        _selectedImage = File(pickedImage.path);
      });
    }
  }

  //Upload Image
  Future<void> _uploadImage() async {
    if (_selectedImage == null) {
      print('No image selected.');
      return;
    }

    try {
      final FirebaseStorage storage = FirebaseStorage.instance;
      final Reference storageRef = storage
          .ref()
          .child('images/${DateTime.now().millisecondsSinceEpoch}.png');

      UploadTask uploadTask = storageRef.putFile(_selectedImage!);

      // Wait for the upload to complete
      await uploadTask;

      // Retrieve the download URL
      String downloadURL = await storageRef.getDownloadURL();

      // Store the download URL in the imageUrl variable
      setState(() {
        imageUrl = downloadURL;
      });

      print('Image uploaded to Firebase Storage.');
    } catch (e) {
      print('Error uploading image: $e');
    }
  }

  //Check Credentials
  void _wrongCredentials() {
    if (Platform.isIOS) {
      showCupertinoDialog(
        context: context,
        builder: (BuildContext dialogContext) {
          return CupertinoAlertDialog(
            title: Text("Credential Error"),
            content: Text("Please fill all the required fields."),
            actions: <Widget>[
              CupertinoDialogAction(
                child: Text("OK"),
                onPressed: () {
                  Navigator.of(dialogContext).pop();
                },
              ),
            ],
          );
        },
      );
    } else {
      showDialog(
        context: context,
        builder: (BuildContext dialogContext) {
          return AlertDialog(
            title: Text("Credential Error"),
            content: Text("Please fill all the required fields."),
            actions: <Widget>[
              TextButton(
                child: Text("OK"),
                onPressed: () {
                  Navigator.of(dialogContext).pop();
                },
              ),
            ],
          );
        },
      );
    }
  }

  //Check Length
  void chechTagsLength() {
    showDialog(
      context: context,
      builder: (BuildContext dialogContext) {
        return AlertDialog(
          title: Text("Tags Error"),
          content: Text("Please add only 5 Tags."),
          actions: <Widget>[
            TextButton(
              child: Text("OK"),
              onPressed: () {
                Navigator.of(dialogContext).pop();
              },
            ),
          ],
        );
      },
    );
  }

  //Enter Tags
  void enterTags() {
    showDialog(
      context: context,
      builder: (BuildContext dialogContext) {
        return AlertDialog(
          title: Text("Empty Tags"),
          content: Text("Please Enter 5 Tags."),
          actions: <Widget>[
            TextButton(
              child: Text("OK"),
              onPressed: () {
                Navigator.of(dialogContext).pop();
              },
            ),
          ],
        );
      },
    );
  }

  //Enter Image
  void addImage() {
    showDialog(
      context: context,
      builder: (BuildContext dialogContext) {
        return AlertDialog(
          title: Text("Empty Image"),
          content: Text("Please Add a Image."),
          actions: <Widget>[
            TextButton(
              child: Text("OK"),
              onPressed: () {
                Navigator.of(dialogContext).pop();
              },
            ),
          ],
        );
      },
    );
  }

  //Create Firebase Collection
  Future addAdminArticle(String topic, String description, List<String> myList,
      String imageUrl) async {
    await FirebaseFirestore.instance.collection('Articles').doc(docID).set({
      'User_ID': docID,
      'Topic': topic,
      'Description': description,
      'Tags': myList,
      'Image': imageUrl,
    });
  }

  //Add Article to Firebase
  Future AddArticelToFirebase() async {
    setState(() {
      isClicked = true;
    });
    try {
      addAdminArticle(
        _topicController.text.trim(),
        _descriptionController.text.trim(),
        _myList,
        imageUrl,
      );

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Article Added Sucesss!')),
      );

      setState(() {
        isClicked = false;
      });

      // Future.delayed(const Duration(seconds: 1), () {
      //   Navigator.pushReplacement(
      //     context,
      //     MaterialPageRoute(builder: (context) => AddArticle()),
      //   );
      // });
    } on FirebaseAuthException catch (e) {
      print(e);
      setState(() {
        isClicked = false;
      });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('$e'),
          backgroundColor: Colors.red,
        ),
      );
    }
    setState(() {
      isClicked = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Add Article",
          style: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 24,
            color: Colors.white,
          ),
        ),
        backgroundColor: const Color.fromARGB(255, 0, 74, 173),
      ),
      body: Container(
        padding: const EdgeInsets.all(15),
        child: SingleChildScrollView(
          child: Column(
            children: [
              GestureDetector(
                onTap: () {
                  _getImageFromGallery();
                },
                child: Container(
                  height: 150,
                  decoration: BoxDecoration(
                    border: Border.all(
                      width: 2,
                      color: const Color.fromARGB(255, 0, 74, 173),
                    ),
                    borderRadius: BorderRadius.circular(10.0),
                    image: _selectedImage != null
                        ? DecorationImage(
                            image: FileImage(_selectedImage!),
                            fit: BoxFit.cover,
                          )
                        : const DecorationImage(
                            image: AssetImage('lib/Assets/cover.jpg'),
                            fit: BoxFit.cover,
                          ),
                  ),
                  child: const Center(
                    child: Text(
                      "Add Image Here\n(Tap to add a Image)",
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                height: 55,
                child: TextField(
                  controller: _topicController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: const BorderSide(
                        color: Color.fromARGB(255, 0, 74, 173),
                        width: 2.0,
                      ),
                    ),
                    labelText: 'Add Article Topic',
                    labelStyle: const TextStyle(),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                child: TextField(
                  controller: _descriptionController,
                  maxLines: 10,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: const BorderSide(
                        color: Color.fromARGB(255, 0, 74, 173),
                        width: 2.0,
                      ),
                    ),
                    labelText: 'Add Description',
                    labelStyle: const TextStyle(),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              ChipTags(
                list: _myList,
                createTagOnSubmit: true,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: const BorderSide(
                      color: Color.fromARGB(255, 0, 74, 173),
                      width: 2.0,
                    ),
                  ),
                  labelText: 'Enter Tags (5 tags)',
                  labelStyle: const TextStyle(),
                ),
                chipColor: const Color.fromARGB(255, 0, 74, 173),
              ),
              const SizedBox(
                height: 30,
              ),
              GestureDetector(
                onTap: () {
                  checkTagsLimit();
                },
                child: GestureDetector(
                  onTap: () {
                    String topic = _topicController.text;
                    String description = _descriptionController.text;

                    if (topic.isEmpty || description.isEmpty) {
                      _wrongCredentials();
                    } else if (_myList.isEmpty) {
                      enterTags();
                    } else if (_myList.length > 5) {
                      chechTagsLength();
                      //}
                      // else if (_selectedImage != null) {
                      //   addImage();
                    } else {
                      //_uploadImage();
                      //AddArticelToFirebase();
                    }
                  },
                  child: Container(
                    height: 55,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: const Color.fromARGB(255, 35, 60, 135),
                      boxShadow: const [
                        BoxShadow(
                          offset: Offset(0, 4.0),
                          blurRadius: 4.0,
                          color: Color.fromARGB(63, 0, 0, 0),
                        ),
                      ],
                    ),
                    child: Center(
                      child: isClicked
                          ? CircularProgressIndicator()
                          : Text(
                              'Submit',
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.white,
                              ),
                            ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
