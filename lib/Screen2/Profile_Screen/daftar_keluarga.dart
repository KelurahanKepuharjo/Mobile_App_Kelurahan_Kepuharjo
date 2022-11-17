import 'package:flutter/material.dart';

class Keluarga extends StatefulWidget {
  const Keluarga({key});

  @override
  State<Keluarga> createState() => _KeluargaState();
}

List data;

class _KeluargaState extends State<Keluarga> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RefreshIndicator(
          onRefresh: () {},
          child: data == null
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : Container(
                  padding: EdgeInsets.all(5.0),
                  child: Column(
                    children: [
                      GestureDetector(
                        onTap: () {},
                        child: Padding(
                          padding: EdgeInsets.all(16),
                          child: Row(
                            children: [
                              ClipRRect(
                                child: Image.asset(
                                  "images/email3.png",
                                  height: 80,
                                  width: 80,
                                ),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Column(
                                children: [
                                  Text("nama" + " " + "gatau"),
                                  Text("nik"),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                      const Divider()
                    ],
                  ),
                )),
    );
  }
}
