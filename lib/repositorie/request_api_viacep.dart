import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:my_location_by_postalcode/model/zip_data.dart';

class ViaCEP {
  Future<ZipData> getAddressByZipCode({required String zipcode}) async {
    try {
      final response = await http.get(
        Uri.parse("https://viacep.com.br/ws/$zipcode/json/"),
      );

      if (response.statusCode != 200) {
        throw Exception(
            "An error ocurred status code -> ${response.statusCode}");
      }

      Map<String, dynamic> responseToMap = jsonDecode(response.body);

      return ZipData.fromJson(responseToMap);
    } catch (e) {
      throw Exception("An error ocurred get AddressByZipCode $e");
    }
  }
}
