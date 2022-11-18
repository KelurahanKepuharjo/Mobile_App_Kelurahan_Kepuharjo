import 'package:flutter/material.dart';
import 'package:kepuharjo_app/Shared/shared.dart';

class WidgetListData extends StatefulWidget {
  const WidgetListData({key});

  @override
  State<WidgetListData> createState() => _WidgetListDataState();
}

List<String> _list = [
  'Achmad Fawaid',
  "Edy Atthoillah",
  "Faisal Oktabrian",
  'Nadia Ayu',
  'Kurrota Akyun'
];

class _WidgetListDataState extends State<WidgetListData> {
  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
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
                    color: greenColor,
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
    );
  }
}
