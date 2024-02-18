import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thrift_store/layout/listbarangview.dart';
import 'package:thrift_store/layout/loading.dart';
import '../bloc/listbarang_bloc.dart';

class ListBarangState extends StatefulWidget{
  const ListBarangState({super.key});

  @override
  State<ListBarangState> createState() => _ListBarangStateState();
}

class _ListBarangStateState extends State<ListBarangState> {
  @override
  Widget build(BuildContext context){
    return BlocBuilder<ListbarangBloc, ListbarangState>(builder: (context, state){
      if(state is LoadingListBarang) {
         return LoadingIndicator();
      }else 
      if (state is ListbarangInitial) {
        return ListBarangViews(barang: state.barang, searchText: state.searchText);
      }else{
        return Container(
          child: Text("Error State"),
        );
      }
    });
  }
}