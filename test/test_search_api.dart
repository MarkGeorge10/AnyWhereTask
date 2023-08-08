import 'package:anywheretask/models/search_model.dart';
import 'package:anywheretask/repository/search_repository.dart';
import 'package:anywheretask/view_models/search_view_model.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:mockito/mockito.dart';

void main() {
  group('DataProvider', () {
    late SearchRepository repository;
    late SearchViewModel searchViewModel;

    setUp(() {
      repository = SearchRepository();
      searchViewModel = SearchViewModel();
    });

    test('fetchData success', () async {
      final searchModel = SearchModel();

      Map<String,String> q = {"q":"mark","format":"json"};
      when(repository.getDuckData(q)).thenAnswer((v)async=> searchModel);

      await searchViewModel.getSearchApi(q);

      expect(searchViewModel.searchData.data, "Mock API Data");
    });

    test('fetchData failure', () async {
      Map<String,String> q = {"q":"","format":"json"};

      when(repository.getDuckData(q)).thenThrow(Exception("API Error"));

      await searchViewModel.getSearchApi(q);

      expect(searchViewModel.searchData.data, ""); // Data should remain empty due to the error
    });
  });
}
