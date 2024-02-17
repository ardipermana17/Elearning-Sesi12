import 'package:flutter/material.dart';
import '../bloc/listbarang_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ListBarangViews extends StatefulWidget {
  final List barang;
  String searchText;
  ListBarangViews({required this.barang, required this.searchText});

  @override
  State<ListBarangViews> createState() => _ListBarangViewsState();
}

class _ListBarangViewsState extends State<ListBarangViews> {
  TextEditingController _search = TextEditingController();
  @override
  void initState() {
    super.initState();
    _search = TextEditingController(text: widget.searchText);
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("List Barang"),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(children: <Widget>[
          TextField(
            controller: _search,
            decoration: InputDecoration(labelText: "Search Barang"),
          ),
          ElevatedButton(
              onPressed: () {
                context
                    .read<ListbarangBloc>()
                    .add(TampilList(keyword: _search.text));
              },
              child: Text("Search")),
          Expanded(
              child: ListView.builder(
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            itemCount: widget.barang.length,
            itemBuilder: (context, index) {
              final Map barangItem = widget.barang[index];

              return Card(
                margin: EdgeInsets.all(8),
                child: ListTile(
                  leading: Image.network(
                    barangItem['img'],
                    width: 50.0,
                    height: 50.0,
                    fit: BoxFit.cover,
                  ),
                  title: Text(barangItem['nama_barang']),
                  subtitle: Text(barangItem['merk']),
                ),
              );
            },
          ))
        ]),
      ),
    );
  }
}
