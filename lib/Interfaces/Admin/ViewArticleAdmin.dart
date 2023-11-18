import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ViewArticleAdmin extends StatefulWidget {
  final String? id;
  const ViewArticleAdmin({super.key, required this.id});

  @override
  State<ViewArticleAdmin> createState() => _ViewArticleAdminState();
}

class _ViewArticleAdminState extends State<ViewArticleAdmin> {
  String? id;

  @override
  void initState() {
    super.initState();

    id = widget.id;
    getData(id!);
  }

  String? topic;
  String? description;
  String? imageUrl;
  String? tag01;
  List<String> _tagsList = [];

  void getData(String uId) async {
    final DocumentSnapshot articleDoc =
        await FirebaseFirestore.instance.collection("Articles").doc(uId).get();

    setState(() {
      topic = articleDoc.get('Topic');
      description = articleDoc.get('Description');
      imageUrl = articleDoc.get('Image');
      _tagsList = List<String>.from(articleDoc.get('Tags') ?? []);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Article",
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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 150,
                decoration: BoxDecoration(
                  border: Border.all(
                    width: 2,
                    color: const Color.fromARGB(255, 0, 74, 173),
                  ),
                  borderRadius: BorderRadius.circular(10.0),
                  image: DecorationImage(
                    image: NetworkImage('$imageUrl'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                '$topic',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Text('$description'),
              const SizedBox(
                height: 20,
              ),
              Text(
                "Tags:",
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Wrap(
                children: [
                  Container(
                    padding: EdgeInsets.all(10),
                    margin: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 0, 74, 173),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: _tagsList.isEmpty
                        ? Text(
                            "No Tags",
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          )
                        : Text(
                            _tagsList[0],
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                  ),
                  Container(
                    padding: EdgeInsets.all(10),
                    margin: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 0, 74, 173),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: _tagsList.isEmpty
                        ? Text(
                            "No Tags",
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          )
                        : Text(
                            _tagsList[1],
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                  ),
                  Container(
                    padding: EdgeInsets.all(10),
                    margin: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 0, 74, 173),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: _tagsList.isEmpty
                        ? Text(
                            "No Tags",
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          )
                        : Text(
                            _tagsList[2],
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                  ),
                  Container(
                    padding: EdgeInsets.all(10),
                    margin: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 0, 74, 173),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: _tagsList.isEmpty
                        ? Text(
                            "No Tags",
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          )
                        : Text(
                            _tagsList[3],
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                  ),
                  Container(
                    padding: EdgeInsets.all(10),
                    margin: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 0, 74, 173),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: _tagsList.isEmpty
                        ? Text(
                            "No Tags",
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          )
                        : Text(
                            _tagsList[4],
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                  ),
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              Container(
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
                  child: Text(
                    'Edit',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                height: 55,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.redAccent,
                  boxShadow: const [
                    BoxShadow(
                      offset: Offset(0, 4.0),
                      blurRadius: 4.0,
                      color: Color.fromARGB(63, 0, 0, 0),
                    ),
                  ],
                ),
                child: Center(
                  child: Text(
                    'Delete',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
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
