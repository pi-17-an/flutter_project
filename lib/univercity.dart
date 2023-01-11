import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:url_launcher/url_launcher.dart';
// ignore: unused_import
import 'package:univercity_api/us.dart';
import 'package:flutter/gestures.dart';

// ignore: prefer_typing_uninitialized_variables
var stringResponse;
// ignore: prefer_typing_uninitialized_variables
List allData = [];
List filteredData = [];

// class Categories extends StatefulWidget {
//   const Categories({super.key});

//   @override
//   State<Categories> createState() => _CategoriesState();
// }

// class _CategoriesState extends State<Categories> {
//   List<String> categories = [
//     "Name",
//     "Country",
//     "alpha two code",
//     "State province"
//   ];
//   // ignore: non_constant_identifier_names
//   int SelectedIndex = 0;
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(vertical: 10.0),
//       child: SizedBox(
//         height: 25,
//         child: ListView.builder(
//           scrollDirection: Axis.horizontal,
//           itemCount: categories.length,
//           itemBuilder: (context, index) => buildCategory(index),
//         ),
//       ),
//     );
//   }

//   Widget buildCategory(int index) => GestureDetector(
//         onTap: () {
//           setState(() {
//             SelectedIndex = index;
//           });
//         },
//         child: Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 15.0),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: <Widget>[
//               Text(
//                 categories[index],
//                 style: TextStyle(
//                   fontWeight: FontWeight.bold,
//                   color: SelectedIndex == index ? Colors.black : Colors.black26,
//                 ),
//               ),
//               Container(
//                 margin: const EdgeInsets.only(top: 10 / 4),
//                 height: 2,
//                 width: 30,
//                 color:
//                     SelectedIndex == index ? Colors.black : Colors.transparent,
//               )
//             ],
//           ),
//         ),
//       );
// }
// ignore: camel_case_types
class univercity extends StatefulWidget {
  const univercity({super.key});

  @override
  State<univercity> createState() => _univercityState();
}

// ignore: camel_case_types
class _univercityState extends State<univercity> {
// ignore: non_constant_identifier_names
  web_pages(String url) async {
    // const url= "http://www.marywood.edu";
    // ignore: deprecated_member_use
    if (await canLaunch(url)) {
      // ignore: deprecated_member_use
      await launch(url);
    } else {
      throw "Could not launch the url";
    }
  }

  @override
  void initState() {
    apicall();
    super.initState();
  }

  Future apicall() async {
    var response = await http.get(Uri.parse(
        'http://universities.hipolabs.com/search?country=United+States'));
    if (response.statusCode == 200) {
      setState(() {
        stringResponse = response.body;
        allData = json.decode(response.body);
        filteredData = json.decode(response.body);
      });
    }
  }

  search(String value) {
    // print(value);
    if (value.isEmpty) {
      setState(() {
        filteredData = allData;
      });
    } else {
      // print("value222222222222222");
      setState(() {
        filteredData = allData
            .where((element) => (element["name"]
                .toString()
                .toLowerCase()
                .contains(value.toLowerCase())))
            .toList();
      });
    }
  }

  var linkText = const TextStyle(color: Colors.black, fontSize: 20);
  // ignore: non_constant_identifier_names
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    // var height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: Row(
          children: [
            IconButton(
              icon: const Icon(
                Icons.arrow_back,
                color: Colors.black,
                size: 30,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
        title: Row(
          children: const [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 50.0),
              child: Text(
                "Universitys",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 28,
                    color: Colors.black),
              ),
            ),
          ],
        ),
        actions: <Widget>[
          IconButton(
            icon: const Icon(
              Icons.search,
              color: Colors.black,
              size: 30,
            ),
            onPressed: () async {
              showSearch(context: context, delegate: CustomSearchDelegate());
            },
          ),
        ],
      ),
      body: Stack(
        children: [
          Column(
            children: <Widget>[
              Container(
                width: 500,
                child: TextField(
                  onChanged: (value) {
                    search(value);
                  },
                  style: TextStyle(color: Colors.black),
                  decoration: InputDecoration(
                      filled: true,
                      fillColor: Color.fromARGB(204, 37, 129, 101),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(0),
                        borderSide: BorderSide.none,
                      ),
                      hintText: "Search",
                      prefixIcon: Icon(Icons.search),
                      prefixIconColor: Colors.black),
                ),
              ),
              // const Categories(),

              Expanded(
                  child: ListView.builder(
                itemCount: filteredData == null ? 0 : filteredData.length,
                itemBuilder: (context, index) {
                  var childContent = filteredData[index];
                  return ExpansionTile(
                    title: Text(
                      childContent['name'].toString(),
                      style: const TextStyle(
                        color: Color.fromARGB(255, 4, 34, 25),
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    children: [
                      Column(
                        children: [
                          Container(
                            width: width,
                            decoration: const BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(0)),
                                color: Color.fromARGB(204, 37, 129, 101)),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      const Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 1.0),
                                        child: Text(
                                          'Name',
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 18,
                                            color: Colors.black,
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 19.0),
                                        child: Text(
                                          childContent['name'].toString(),
                                          style: const TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 18,
                                            color: Colors.black,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),

                                  // IconButton(
                                  //   icon: const Icon(Icons.arrow_forward),
                                  //   onPressed: () {
                                  //     web_pages(childContent['web_pages'][0]
                                  //         .toString());
                                  //     //   Navigator.push(
                                  //     // context,
                                  //     // MaterialPageRoute(
                                  //     //     builder: (context) => web_pages()));
                                  //   },
                                  // ),
                                  //   ],
                                  // ),
                                  Row(
                                    children: [
                                      const Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 1.0),
                                        child: Text(
                                          'country',
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 18,
                                            color: Colors.black,
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 8.0),
                                        child: Text(
                                          childContent['country'].toString(),
                                          style: const TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 18,
                                            color: Colors.black,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      const Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 1.0),
                                        child: Text(
                                          'Take to',
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 18,
                                            color: Colors.black,
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 11.0),
                                        child: RichText(
                                            text: TextSpan(children: [
                                          TextSpan(
                                              style: const TextStyle(
                                                  decoration:
                                                      TextDecoration.underline),
                                              text:
                                                  'https//Home_Page.universitis',
                                              recognizer: TapGestureRecognizer()
                                                ..onTap = () async {
                                                  web_pages(
                                                      childContent['web_pages']
                                                              [0]
                                                          .toString());
                                                })
                                        ])),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  );
                },
              )),
              const Center(
                child: CircularProgressIndicator(),
              )
            ],
          )
        ],
      ),
    );
  }
}

class CustomSearchDelegate extends SearchDelegate {
  search(String value) {
    // print(value);
    if (value.isEmpty) {
      filteredData = allData;
    } else {
      // print("value222222222222222");

      filteredData = allData
          .where((element) => (element["name"]
              .toString()
              .toLowerCase()
              .contains(value.toLowerCase())))
          .toList();
    }
  }

  @override
  List<Widget>? buildActions(BuildContext context) {
    // TODO: implement buildActions
    // throw UnimplementedError();
    return [
      IconButton(
          onPressed: () {
            query = '';
          },
          icon: Icon(Icons.clear))
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    // TODO: implement buildLeading
    // throw UnimplementedError();r
    return IconButton(
        onPressed: () {
          close(context, null);
        },
        icon: Icon(Icons.arrow_back));
  }

  @override
  Widget buildResults(BuildContext context) {
    // TODO: implement buildResults
    // throw UnimplementedError();

    return Container(
      child: TextField(
        onChanged: (value) {
          search(value);
        },
      ),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // TODO: implement buildSuggestions
    // throw UnimplementedError();

    return Container(
      child: TextField(
        onChanged: (value) {
          search(value);
        },
      ),
    );

    // return Center(
    //   child: Text('Search Users'),
    // );
    // List<String> matchQuery = [];
    // for (var data in searchItems) {
    //   if (data.toLowerCase().contains(query.toLowerCase())) {
    //     matchQuery.add(data);
    //   }
    // }
    // return ListView.builder(itemCount: matchQuery.length,
    // itemBuilder: (context,index) {
    //   var result = matchQuery[index].toString();
    //   return ListTile(
    //     title: Text(result),
    //   );
    // },
    // );
  }
}
