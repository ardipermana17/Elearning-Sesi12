import 'dart:developer';
import 'dart:io';
import 'package:dio/dio.dart';

class BarangRepository {
  final Dio _dio = Dio();

  Future addBarang(
      {required String namabarang,
      required String merk,
      required String harga,
      required String stok,
      required String date,
      required File image}) async {
    try {
      FormData formData = FormData.fromMap({
        'nama': namabarang,
        'merk': merk,
        'harga': harga,
        'stok': stok,
        'tanggal': date,
        'url_image':
            await MultipartFile.fromFile(image.path, filename: 'image.jpg'),
      });

      Response response = await _dio.post(
        'https://thriftstore1.000webhostapp.com/add_barang.php',
        data: formData,
      );

      log(response.data);

      if (response.statusCode == 200) {
        return response.data;
      } else {
        throw Exception('Failed to add barang');
      }
    } catch (error) {
      throw Exception('Error: $error');
    }
  }

  Future getlistBarang (String keyword) async{
    FormData formData = FormData.fromMap({
        'key': keyword,
      });
      try{
      log("AMBIL LIST");
      var response = await _dio.post('https://thriftstore1.000webhostapp.com/list_barang.php', data: formData);
      log("list $response");

      if (response.statusCode == 200) {
        List newList = response.data;
        return newList;
      } else {
        log("Error" + response.statusCode.toString());
      return[];
      }

    }catch(error){
      log("Error $error");
      return[];
    }
  }
}
