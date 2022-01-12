import 'package:flutter/material.dart';

class SearchListView extends StatefulWidget {
  @override
  _SearchListViewState createState() => _SearchListViewState();
}

class _SearchListViewState extends State<SearchListView> {
//untuk searching
  bool isCari = true;
  String query = "";
  TextEditingController cari = TextEditingController();
  List<String> dataFilter = [];

  List<String> dataList = [
    "Macbook",
    "Acer",
    "Samsung",
    "Boomerang",
    "Butterfly",
    "Axio",
    "Iphone",
    "Aqua",
    "Laptop",
    "SmartPhone",
    "Sendok",
    "Program"
  ];

  //search
  _SearchListViewState() {
    cari.addListener(() {
      if (cari.text.isEmpty) {
        setState(() {
          isCari = true;
          query = "";
        });
      } else {
        setState(() {
          isCari = false;
          query = cari.text;
        });
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: Text("Search List View"),
      ),
      body: Column(
        children: [
          searchView(),
          isCari ? listDataView() : performFilter(), // tambah search di is cari
        ],
      ),
    );
  }

  Widget searchView() {
    return Container(
      margin: EdgeInsets.only(top: 10, right: 10, left: 10),
      child: TextFormField(
        controller: cari,
        decoration: InputDecoration(
            hintText: "Search",
            // prefix: Icon(Icons.search),
            hintStyle: TextStyle(
              color: Colors.green,
            ),
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(10))),
      ),
    );
  }

  Widget listDataView() {
    return Flexible(
        child: ListView.builder(
            itemCount: dataList.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text('${dataList[index]}'),
              );
            }));
  }

// search
  Widget performFilter() {
    //untuk search
    dataFilter = [];
    for (int i = 0; i < dataList.length; i++) {
      var item = dataList[i];
      if (item.toLowerCase().contains(query.toLowerCase())) {
        dataFilter.add(item);
      }
    }
    return showDataFilter();
  }

// search
  Widget showDataFilter() {
    return Flexible(
        child: ListView.builder(
            itemCount: dataFilter.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text('${dataFilter[index]}'),
              );
            }));
  }
}
