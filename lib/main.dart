import 'package:flutter/material.dart';
import 'package:my_location_by_postalcode/page/search_zip_code.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Zip Code',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: const SearchZipCodePage(),
    );
  }
}
