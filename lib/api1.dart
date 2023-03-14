import 'dart:convert';
import 'package:api/democlass.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class welcome extends StatefulWidget {
  const welcome({Key? key}) : super(key: key);

  @override
  State<welcome> createState() => _welcomeState();
}

class _welcomeState extends State<welcome> {
  List<Sandy> list = [];
  void initState() {
    FetchSandy();
  }

  Future<List<Sandy>> FetchSandy() async {
    final resp =
        await http.get(Uri.parse("https://jsonplaceholder.typicode.com/todos"));
    //print(resp.statusCode);
    if (resp.statusCode == 200) {
      //print(jsonDecode(resp.body));
      (jsonDecode(resp.body) as List).forEach((s) {
        list.add(Sandy.fromMap(s));
        //print(list.length);
      });
    }
    return list;
    //throw Exception("Faild to load");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        child: FutureBuilder<List<Sandy>>(
          future: FetchSandy(),
          builder: (context, projectSnap) {
            if (projectSnap.hasData) {
              return ListView.builder(
                itemCount: projectSnap.data!.length,
                itemBuilder: (context, index) {
                  //Sandy project = projectSnap.data![index];

                  return Card(
                      child: Row(children: [
                    GestureDetector(
                      behavior: HitTestBehavior.opaque,
                      onTap: () {
                        /*   Navigator.of(context)
                            .push(MaterialPageRoute(builder: (context) => user(
                                //projectSnap.data![index].userId,
                                //projectSnap.data![index].id,
                                projectSnap.data![index].title)));*/
                        showModalBottomSheet(
                            context: context,
                            builder: (context) {
                              return Column(
                                children: [
                                  Text(projectSnap.data![index].title),
                                  Text(projectSnap.data![index].userId
                                      .toString()),
                                ],
                              );
                            });
                      },
                      child: Container(
                          height: 100,
                          width: 200,
                          color: Colors.cyanAccent,
                          child: Text(projectSnap.data![index].title)),
                    ),
                    // ElevatedButton(
                    //     child: const Text("Buttom sheet"),
                    //     onPressed: () {
                    //       showModalBottomSheet(
                    //           context: context,
                    //           builder: (context) {
                    //             return Column(
                    //               children: [
                    //                 Text(projectSnap.data![index].title),
                    //                 Text(projectSnap.data![index].userId
                    //                     .toString()),
                    //               ],
                    //             );
                    //           });
                    //     }),
                  ]));

                  // return Container(
                  //   height: 50,
                  //   width: 200,
                  //   //color: Colors.cyanAccent,
                  //   child: Center(child: Text(projectSnap.data![index].title)),
                  // );
                },
              );
            }
            return CircularProgressIndicator();
          },
        ),
      ),
    );
  }
}
