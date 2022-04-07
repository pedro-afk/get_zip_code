import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:mobx/mobx.dart';
import 'package:my_location_by_postalcode/model/zip_data.dart';
import 'package:my_location_by_postalcode/repositorie/request_api_viacep.dart';
part 'search_zip_code_controller.g.dart';

class SearchZipCodeController = _SearchZipCodeControllerBase
    with _$SearchZipCodeController;

abstract class _SearchZipCodeControllerBase with Store {
  late ViaCEP repository;

  @observable
  ZipData zipData = ZipData(
    bairro: "empty",
    cep: "empty",
    complemento: "empty",
    ddd: "empty",
    gia: "empty",
    ibge: "empty",
    localidade: "empty",
    logradouro: "empty",
    siafi: "empty",
    uf: "empty",
  );

  @observable
  bool loadingGet = false;

  @observable
  bool hasError = false;
  @observable
  String messageError = "";

  @observable
  TextEditingController zipController = TextEditingController();

  @action
  setLoadingGet(bool value) {
    loadingGet = value;
  }

  @action
  setHasError(bool hasErr, String messageErr) {
    hasError = hasErr;
    messageError = messageErr;
  }

  @action
  getAddressByZipCode() async {
    if (zipController.text.length < 8 || zipController.text.isEmpty) return;

    try {
      setLoadingGet(true);

      zipData =
          await repository.getAddressByZipCode(zipcode: zipController.text);

      log("response >>>>>>>> ${zipData.toJson()}");

      setLoadingGet(false);
      setHasError(false, "");
      zipController.clear();
    } catch (e) {
      setLoadingGet(false);
      setHasError(true, "Ops! An error ocurred!");
      throw Exception("An error execute getAddByZipCode controller $e");
    }
  }

  _SearchZipCodeControllerBase({required this.repository});
}
