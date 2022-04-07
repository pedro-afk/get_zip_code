// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_zip_code_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$SearchZipCodeController on _SearchZipCodeControllerBase, Store {
  final _$zipDataAtom = Atom(name: '_SearchZipCodeControllerBase.zipData');

  @override
  ZipData get zipData {
    _$zipDataAtom.reportRead();
    return super.zipData;
  }

  @override
  set zipData(ZipData value) {
    _$zipDataAtom.reportWrite(value, super.zipData, () {
      super.zipData = value;
    });
  }

  final _$loadingGetAtom =
      Atom(name: '_SearchZipCodeControllerBase.loadingGet');

  @override
  bool get loadingGet {
    _$loadingGetAtom.reportRead();
    return super.loadingGet;
  }

  @override
  set loadingGet(bool value) {
    _$loadingGetAtom.reportWrite(value, super.loadingGet, () {
      super.loadingGet = value;
    });
  }

  final _$hasErrorAtom = Atom(name: '_SearchZipCodeControllerBase.hasError');

  @override
  bool get hasError {
    _$hasErrorAtom.reportRead();
    return super.hasError;
  }

  @override
  set hasError(bool value) {
    _$hasErrorAtom.reportWrite(value, super.hasError, () {
      super.hasError = value;
    });
  }

  final _$messageErrorAtom =
      Atom(name: '_SearchZipCodeControllerBase.messageError');

  @override
  String get messageError {
    _$messageErrorAtom.reportRead();
    return super.messageError;
  }

  @override
  set messageError(String value) {
    _$messageErrorAtom.reportWrite(value, super.messageError, () {
      super.messageError = value;
    });
  }

  final _$zipControllerAtom =
      Atom(name: '_SearchZipCodeControllerBase.zipController');

  @override
  TextEditingController get zipController {
    _$zipControllerAtom.reportRead();
    return super.zipController;
  }

  @override
  set zipController(TextEditingController value) {
    _$zipControllerAtom.reportWrite(value, super.zipController, () {
      super.zipController = value;
    });
  }

  final _$getAddressByZipCodeAsyncAction =
      AsyncAction('_SearchZipCodeControllerBase.getAddressByZipCode');

  @override
  Future getAddressByZipCode() {
    return _$getAddressByZipCodeAsyncAction
        .run(() => super.getAddressByZipCode());
  }

  final _$_SearchZipCodeControllerBaseActionController =
      ActionController(name: '_SearchZipCodeControllerBase');

  @override
  dynamic setLoadingGet(bool value) {
    final _$actionInfo = _$_SearchZipCodeControllerBaseActionController
        .startAction(name: '_SearchZipCodeControllerBase.setLoadingGet');
    try {
      return super.setLoadingGet(value);
    } finally {
      _$_SearchZipCodeControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setHasError(bool hasErr, String messageErr) {
    final _$actionInfo = _$_SearchZipCodeControllerBaseActionController
        .startAction(name: '_SearchZipCodeControllerBase.setHasError');
    try {
      return super.setHasError(hasErr, messageErr);
    } finally {
      _$_SearchZipCodeControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
zipData: ${zipData},
loadingGet: ${loadingGet},
hasError: ${hasError},
messageError: ${messageError},
zipController: ${zipController}
    ''';
  }
}
