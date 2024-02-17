part of 'listbarang_bloc.dart';

@immutable
sealed class ListbarangState extends Equatable{}

final class ListbarangInitial extends ListbarangState {
  final List barang;
  final String searchText;
  
  ListbarangInitial({required this.barang, this.searchText = ""});
  @override
  List<Object> get props => [barang, searchText];
}

final class LoadingListBarang extends ListbarangState{
  @override
  List<Object> get props => [];
}
