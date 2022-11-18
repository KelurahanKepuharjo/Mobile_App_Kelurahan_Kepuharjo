import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kepuharjo_app/Shared/shared.dart';

class AppearanceStatus extends StatefulWidget {
  const AppearanceStatus();

  @override
  State<AppearanceStatus> createState() => _AppearanceStatusStatus();
}

List<String> _list = [
  'Achmad Fawaid',
];

class _AppearanceStatusStatus extends State<AppearanceStatus> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      appBar: AppBar(
        centerTitle: true,
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
        title: Text(
          'Status Surat',
          style: GoogleFonts.poppins(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        flexibleSpace: Container(
            decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20)),
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    lightGreen,
                    midGreen,
                  ],
                ))),
      ),
      body: RefreshIndicator(
        onRefresh: () {},
        child: _list == null
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : ListView.builder(
                itemCount: _list.length,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    padding: EdgeInsets.all(5.0),
                    margin: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: greyColor,
                    ),
                    child: Column(
                      children: [
                        GestureDetector(
                          onTap: () {},
                          child: Padding(
                            padding: EdgeInsets.all(16),
                            child: Row(
                              children: [
                                ClipRRect(
                                  child: Image.asset("images/email3.png"),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Column(
                                  children: [
                                    Text("kontol"),
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
                  );
                }),
      ),
    );
  }
}
