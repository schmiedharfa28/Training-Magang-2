import 'package:flutter/material.dart';
import 'package:training_2/detail_gridview.dart';

class CustomeGridView extends StatefulWidget {
  @override
  _CustomeGridViewState createState() => _CustomeGridViewState();
}

class _CustomeGridViewState extends State<CustomeGridView> {
  //untuk search gridview
  TextEditingController cari = TextEditingController();
  String query = "";
  bool isCari = true;
  List<Map<dynamic, String>> dataFilter = [];

  _CustomeGridViewState() {
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

  List<Map<dynamic, String>> dataList = [
    {
      "nama": "Satu",
      "gambar": "satu.png",
      "deskripsi":
          "Wikipedia bahasa Inggris adalah edisi bahasa Inggris dari ensiklopedia bebas yang bernama Wikipedia. Wikipedia bahasa Inggris didirikan tanggal 15 Januari 2001 dan mencapai artikel ke-4.000.000 pada Juli 2012."
    },
    {
      "nama": "Dua",
      "gambar": "dua.png",
      "deskripsi":
          "Wikipedia bahasa Inggris adalah edisi bahasa Inggris dari ensiklopedia bebas yang bernama Wikipedia. Wikipedia bahasa Inggris didirikan tanggal 15 Januari 2001 dan mencapai artikel ke-4.000.000 pada Juli 2012."
    },
    {
      "nama": "Tiga",
      "gambar": "tiga.png",
      "deskripsi":
          "Wikipedia bahasa Inggris adalah edisi bahasa Inggris dari ensiklopedia bebas yang bernama Wikipedia. Wikipedia bahasa Inggris didirikan tanggal 15 Januari 2001 dan mencapai artikel ke-4.000.000 pada Juli 2012."
    },
    {
      "nama": "Empat",
      "gambar": "empat.png",
      "deskripsi":
          "Wikipedia bahasa Inggris adalah edisi bahasa Inggris dari ensiklopedia bebas yang bernama Wikipedia. Wikipedia bahasa Inggris didirikan tanggal 15 Januari 2001 dan mencapai artikel ke-4.000.000 pada Juli 2012."
    },
    {
      "nama": "Lima",
      "gambar": "lima.JPG",
      "deskripsi":
          "Wikipedia bahasa Inggris adalah edisi bahasa Inggris dari ensiklopedia bebas yang bernama Wikipedia. Wikipedia bahasa Inggris didirikan tanggal 15 Januari 2001 dan mencapai artikel ke-4.000.000 pada Juli 2012."
    },
    {
      "nama": "Enam",
      "gambar": "enam.jpeg",
      "deskripsi":
          "Wikipedia bahasa Inggris adalah edisi bahasa Inggris dari ensiklopedia bebas yang bernama Wikipedia. Wikipedia bahasa Inggris didirikan tanggal 15 Januari 2001 dan mencapai artikel ke-4.000.000 pada Juli 2012."
    },
    {
      "nama": "Tujuh",
      "gambar": "tujuh.jpeg",
      "deskripsi":
          "Wikipedia bahasa Inggris adalah edisi bahasa Inggris dari ensiklopedia bebas yang bernama Wikipedia. Wikipedia bahasa Inggris didirikan tanggal 15 Januari 2001 dan mencapai artikel ke-4.000.000 pada Juli 2012."
    },
    {
      "nama": "Delapan",
      "gambar": "delapan.jpeg",
      "deskripsi":
          "Wikipedia bahasa Inggris adalah edisi bahasa Inggris dari ensiklopedia bebas yang bernama Wikipedia. Wikipedia bahasa Inggris didirikan tanggal 15 Januari 2001 dan mencapai artikel ke-4.000.000 pada Juli 2012."
    },
    {
      "nama": "Sembilan",
      "gambar": "sembilan.JPG",
      "deskripsi":
          "Wikipedia bahasa Inggris adalah edisi bahasa Inggris dari ensiklopedia bebas yang bernama Wikipedia. Wikipedia bahasa Inggris didirikan tanggal 15 Januari 2001 dan mencapai artikel ke-4.000.000 pada Juli 2012."
    },
    {
      "nama": "Sepuluh",
      "gambar": "sepuluh.jpg",
      "deskripsi":
          "Wikipedia bahasa Inggris adalah edisi bahasa Inggris dari ensiklopedia bebas yang bernama Wikipedia. Wikipedia bahasa Inggris didirikan tanggal 15 Januari 2001 dan mencapai artikel ke-4.000.000 pada Juli 2012."
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.amberAccent,
          title: Text("Custome Grid View"),
        ),
        body: Column(
          children: [
            searchView(),
            isCari
                ? Flexible(
                    child: GridView.builder(
                        // shrinkWrap: true, //fungsinya sama dengan flexible
                        itemCount: dataList.length,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2),
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => DetailGridView(
                                          listData: dataList[index]
                                          // nama: dataList[index]['nama'],
                                          // gambar: dataList[index]['gambar'],
                                          // deskripsi: dataList[index]['deskripsi'],
                                          )));
                            },
                            child: Card(
                              color: Colors.white,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: 
                                GridTile(
                                  footer: Container(
                                    alignment: Alignment.center,
                                    height: 35,
                                    color: Colors.white.withOpacity(0.5),
                                    child: Text("${dataList[index]['nama']}"),
                                  ),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(15),
                                    child: Image.asset(
                                      'assets/${dataList[index]['gambar']}',
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          );
                        }),
                  )
                : performDataFilter(),
          ],
        ));
  }

  Widget searchView() {
    return Container(
      margin: EdgeInsets.only(left: 10, top: 10, right: 10),
      child: TextFormField(
        textAlign: TextAlign.center,
        controller: cari,
        decoration: InputDecoration(
          hintText: 'cari',
          hintStyle: TextStyle(color: Colors.green),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
    );
  }

  Widget performDataFilter() {
    dataFilter = [];
    for (int i = 0; i < dataList.length; i++) {
      var item = dataList[i];
      if (item['nama']!.toLowerCase().contains(query.toLowerCase())) {
        dataFilter.add(item);
      }
    }
    return showResultFilter();
  }

  Widget showResultFilter() {
    return Flexible(
      child: GridView.builder(
          itemCount: dataFilter.length,
          gridDelegate:
              SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
          itemBuilder: (context, index) {
            return Card(
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: GridTile(
                  footer: Container(
                    alignment: Alignment.center,
                    height: 35,
                    color: Colors.white.withOpacity(0.5),
                    child: Text("${dataFilter[index]['nama']}"),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: Image.asset(
                      'assets/${dataFilter[index]['gambar']}',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            );
          }),
    );
  }
}
