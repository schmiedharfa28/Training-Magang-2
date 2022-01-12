import 'package:flutter/material.dart';

class DetailGridView extends StatefulWidget {
  // String? dataList;
  // String? nama, gambar, deskripsi;
  // DetailGridView({this.nama, this.gambar, this.deskripsi});
  Map<dynamic, String?>? listData;

  DetailGridView({this.listData});
  @override
  _DetailGridViewState createState() => _DetailGridViewState();
}

class _DetailGridViewState extends State<DetailGridView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${widget.listData?['nama']}'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView( // singlescrollview
          children: [
            Column(
              children: [
                Card(
                  child: Image.asset('assets/${widget.listData?['gambar']}',
                      fit: BoxFit.fitWidth),
                ),
                SizedBox(
                  height: 8,
                ),
                Text(
                  '${widget.listData?['nama']}'.toUpperCase(),
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                Text(
                  '${widget.listData?['deskripsi']}'.toUpperCase(),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
