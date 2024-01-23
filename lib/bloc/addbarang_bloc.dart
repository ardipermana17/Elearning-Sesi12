import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';
import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:thrift_store/repository/barang_repository.dart';

part 'addbarang_event.dart';
part 'addbarang_state.dart';

class AddbarangBloc extends Bloc<AddbarangEvent, AddbarangState> {
  final BarangRepository barangRepository;

  AddbarangBloc({required this.barangRepository})
      : super(AddBarangInitialState()) {
    on<AddbarangInitial>(_addbarang);
  }
  _addbarang(AddbarangInitial event, Emitter emit) async {
    try {
      // state 1
      emit(AddBarangLoadingState());

      // state 2
      final result = await barangRepository.addBarang(
        namabarang: event.namabarang,
        merk: event.merk,
        harga: event.harga,
        stok: event.stok,
        date: event.date,
        image: event.image,
      );

      // state 3 if success
      emit(AddBarangSuccessState(message: result));

      await Future.delayed(Duration(seconds: 3));

      emit(AddBarangInitialState());
    } catch (error) {
      //state 3 if error
      emit(AddBarangErrorState(error: 'Error: $error'));
    }
  }
}
