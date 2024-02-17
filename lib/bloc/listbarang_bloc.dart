import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';
import 'package:thrift_store/repository/barang_repository.dart'; 

part 'listbarang_event.dart';
part 'listbarang_state.dart';

class ListbarangBloc extends Bloc<ListbarangEvent, ListbarangState> {
  BarangRepository barangRepository;
  ListbarangBloc({required this.barangRepository}) : super(LoadingListBarang()) {
    on<TampilList>(_tampilList);
  }

  _tampilList(TampilList event, Emitter emit)async{
    String key = event.keyword;
    emit(LoadingListBarang());
    List res = await barangRepository.getlistBarang(key);
    emit(ListbarangInitial(barang: res, searchText: key));
  }
}
