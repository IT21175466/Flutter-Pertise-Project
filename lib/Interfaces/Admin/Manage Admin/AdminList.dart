import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:sexpertise/Interfaces/Admin/Manage%20Admin/AddAAdmin.dart';

class AdminList extends StatefulWidget {
  final String? adminID;
  const AdminList({super.key, required this.adminID});

  @override
  State<AdminList> createState() => _AdminListState();
}

class _AdminListState extends State<AdminList> {
  String? id;
  @override
  void initState() {
    id = widget.adminID;
    super.initState();
  }

  final _admins = FirebaseFirestore.instance
      .collection('Users')
      .where('Role', isEqualTo: 'Admin')
      .snapshots();

  String selectedIndex = '';

  TextEditingController _search = TextEditingController();
  String search = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Admins",
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
        child: Column(
          children: [
            Row(
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const AddAAdmin(),
                      ),
                    );
                  },
                  child: const Icon(
                    Icons.add_circle,
                    color: Color.fromARGB(255, 0, 74, 173),
                    size: 40,
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: SizedBox(
                    width: 100,
                    height: 45,
                    child: TextField(
                      controller: _search,
                      decoration: InputDecoration(
                        suffixIcon: const Icon(
                          Icons.search,
                          color: Color.fromARGB(255, 0, 74, 173),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(50.0),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(50.0),
                          borderSide: const BorderSide(
                            color: Color.fromARGB(255, 0, 74, 173),
                            width: 2.0,
                          ),
                        ),
                        labelText: 'Search',
                      ),
                      onChanged: (value) {
                        print(value);
                        setState(() {
                          search = value.toString();
                        });
                      },
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 25,
            ),
            Expanded(
              child: StreamBuilder(
                stream: _admins,
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    return const Text("Connection Error");
                  }

                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Text("Loading......");
                  }
                  var docs = snapshot.data!.docs;
                  return ListView.builder(
                    itemCount: docs.length,
                    itemBuilder: (context, index) {
                      if (docs[index]['User_ID'].toString() == id) {
                        // Return an empty container to effectively hide the item
                        return Container();
                      }
                      if (_search.text.toString().isEmpty) {
                        return Container(
                          padding: const EdgeInsets.symmetric(
                              vertical: 5, horizontal: 5),
                          margin: const EdgeInsets.symmetric(vertical: 5),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.white,
                          ),
                          child: Center(
                            child: GestureDetector(
                              onTap: () {
                                setState(() {
                                  selectedIndex =
                                      docs[index]['User_ID'].toString();
                                  print(selectedIndex);

                                  // Navigator.of(context).push(
                                  //   MaterialPageRoute(
                                  //     builder: (context) =>
                                  //        ViewArticleAdmin(id: selectedIndex),
                                  //   ),
                                  // );
                                });
                              },
                              child: Container(
                                padding: EdgeInsets.all(10),
                                height: 80,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(
                                    color:
                                        const Color.fromARGB(255, 0, 74, 173),
                                  ),
                                ),
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: Container(
                                        padding: const EdgeInsets.only(top: 5),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              docs[index]['Name'],
                                              style: const TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w700,
                                              ),
                                            ),
                                            SizedBox(
                                              height: 5,
                                            ),
                                            Text(
                                              docs[index]['User_ID'],
                                              style: const TextStyle(
                                                fontSize: 12,
                                                fontWeight: FontWeight.w400,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Column(
                                      children: [
                                        Icon(
                                          Icons.edit,
                                          color: const Color.fromARGB(
                                              255, 0, 74, 173),
                                        ),
                                        Spacer(),
                                        Icon(
                                          Icons.delete,
                                          color: Colors.red,
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        );
                      } else if (docs[index]['Name']
                          .toLowerCase()
                          .contains(_search.text.toString())) {
                        return Container(
                          padding: const EdgeInsets.symmetric(
                              vertical: 5, horizontal: 5),
                          margin: const EdgeInsets.symmetric(vertical: 5),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.white,
                          ),
                          child: Center(
                            child: GestureDetector(
                              onTap: () {
                                setState(() {
                                  selectedIndex =
                                      docs[index]['User_ID'].toString();
                                  print(selectedIndex);

                                  // Navigator.of(context).push(
                                  //   MaterialPageRoute(
                                  //     builder: (context) =>
                                  //         ViewArticleAdmin(id: selectedIndex),
                                  //   ),
                                  // );
                                });
                              },
                              child: Container(
                                padding: EdgeInsets.all(10),
                                height: 80,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(
                                    color:
                                        const Color.fromARGB(255, 0, 74, 173),
                                  ),
                                ),
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: Container(
                                        padding: const EdgeInsets.only(top: 5),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              docs[index]['Name'],
                                              style: const TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w700,
                                              ),
                                            ),
                                            SizedBox(
                                              height: 5,
                                            ),
                                            Text(
                                              docs[index]['User_ID'],
                                              style: const TextStyle(
                                                fontSize: 12,
                                                fontWeight: FontWeight.w400,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Column(
                                      children: [
                                        Icon(
                                          Icons.edit,
                                          color: const Color.fromARGB(
                                              255, 0, 74, 173),
                                        ),
                                        Spacer(),
                                        Icon(
                                          Icons.delete,
                                          color: Colors.red,
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        );
                      } else {
                        return Container();
                      }
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
