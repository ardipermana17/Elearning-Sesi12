import 'package:thrift_store/bloc/addbarang_bloc.dart';
import 'package:thrift_store/repository/barang_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:thrift_store/repository/login_repository.dart';
import 'package:thrift_store/bloc/login_bloc.dart';
import 'package:thrift_store/layout/homepage.dart';
import 'bloc/listbarang_bloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MultiRepositoryProvider(
        providers: [
          RepositoryProvider(
            create: (context) => LoginRepository(),
          ),
          RepositoryProvider(
            create: (context) => BarangRepository(),
          ),
        ],
        child: MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (context) =>
                  LoginBloc(loginRepository: context.read<LoginRepository>())
                    ..add(const InitLogin()),
            ),
            BlocProvider(
                create: (context) => AddbarangBloc(
                    barangRepository: context.read<BarangRepository>())),
              BlocProvider(
                create: (context) => ListbarangBloc(
                    barangRepository: context.read<BarangRepository>())..add(TampilList()))
          ],
          child: MaterialApp(
            title: "Home",
            home: HomePage(),
          ),
        ));
  }
}
