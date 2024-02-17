part of 'listbarang_bloc.dart';

@immutable
sealed class ListbarangEvent extends Equatable {}

final class TampilList extends ListbarangEvent{
  final String keyword;

  TampilList({this.keyword = ""});

  @override
  List<Object> get props => [];
}