part of 'addbarang_bloc.dart';

@immutable
sealed class AddbarangEvent extends Equatable {}

final class AddbarangInitial extends AddbarangEvent {
  final String namabarang;
  final String merk;
  final String harga;
  final String stok;
  final String date;
  final File image;

  AddbarangInitial({
    required this.namabarang,
    required this.merk,
    required this.harga,
    required this.stok,
    required this.date,
    required this.image,
  });

  @override
  List<Object?> get props => [namabarang, merk, harga, stok, date, image];
}
