import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:my_location_by_postalcode/model/zip_data.dart';
import 'package:my_location_by_postalcode/page/search_zip_code_controller.dart';
import 'package:my_location_by_postalcode/repositorie/request_api_viacep.dart';
import 'package:my_location_by_postalcode/widgets/custom_text.dart';

class SearchZipCodePage extends StatefulWidget {
  const SearchZipCodePage({Key? key}) : super(key: key);

  @override
  State<SearchZipCodePage> createState() => _SearchZipCodePageState();
}

class _SearchZipCodePageState extends State<SearchZipCodePage> {
  late SearchZipCodeController _controller;
  final ViaCEP _repository = ViaCEP();

  @override
  void initState() {
    _controller = SearchZipCodeController(repository: _repository);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      body: _body(),
    );
  }

  _appBar() {
    return AppBar(
      title: const Text('Search Zip Code'),
    );
  }

  Widget _body() {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomText(
              text: 'Search zip codes all over Brazil',
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
            const SizedBox(height: 5),
            Observer(builder: (_) {
              return TextFormField(
                controller: _controller.zipController,
                maxLength: 8,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  hintText: "Zip code here",
                  labelText: "Zip Code",
                ),
              );
            }),
            const SizedBox(height: 5),
            Center(child: _buttonSearch()),
            const SizedBox(height: 50),
            Observer(builder: (_) {
              return _controller.hasError
                  ? _buildErrorPage(errorMessage: _controller.messageError)
                  : _controller.loadingGet
                      ? _buildLoading()
                      : _buildDataAddress(zipData: _controller.zipData);
            }),
          ],
        ),
      ),
    );
  }

  Widget _buttonSearch() {
    return ElevatedButton(
      onPressed: () {
        _controller.getAddressByZipCode();
      },
      child: const Icon(Icons.search),
    );
  }

  Widget _buildLoading() {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }

  Widget _buildErrorPage({required String errorMessage}) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(height: 100),
          const Icon(Icons.error_outline, color: Colors.red, size: 70),
          const SizedBox(height: 20),
          CustomText(
            text: errorMessage,
            fontSize: 20,
          ),
        ],
      ),
    );
  }

  _buildDataAddress({required ZipData zipData}) {
    return Center(
      child: Container(
        width: MediaQuery.of(context).size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildDataAddressComponent(label: "Zipcode", data: zipData.cep!),
            _buildDataAddressComponent(label: "UF", data: zipData.uf!),
            _buildDataAddressComponent(
                label: "Complemento", data: zipData.complemento!),
            _buildDataAddressComponent(label: "Bairro", data: zipData.bairro!),
            _buildDataAddressComponent(
                label: "Localidade", data: zipData.localidade!),
            _buildDataAddressComponent(
                label: "Logradouro", data: zipData.logradouro!),
            _buildDataAddressComponent(label: "DDD", data: zipData.ddd!),
            _buildDataAddressComponent(label: "GIA", data: zipData.gia!),
            _buildDataAddressComponent(label: "SIAFI", data: zipData.siafi!),
            _buildDataAddressComponent(label: "IBGE", data: zipData.ibge!),
          ],
        ),
      ),
    );
  }

  _buildDataAddressComponent({required String label, required String data}) {
    return Container(
      child: Row(
        children: [
          CustomText(
            text: "$label ->",
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
          const SizedBox(width: 10),
          CustomText(
            text: data,
            fontSize: 16,
          ),
        ],
      ),
    );
  }
}
