import 'package:anywheretask/data/response/ApiResponse.dart';
import 'package:anywheretask/models/search_model.dart';
import 'package:anywheretask/models/topic_model.dart';
import 'package:anywheretask/repository/search_repository.dart';
import 'package:flutter/material.dart';
import 'package:package_info_plus/package_info_plus.dart';

import '../models/app_details/app_details.dart';

class SearchViewModel with ChangeNotifier {
  final SearchRepository searchRepository = SearchRepository();
  int selectedCollection = 0;
  ApiResponse<SearchModel> searchData = ApiResponse.loading(null);

  setSearchData(ApiResponse<SearchModel> response) {
    searchData = response;
    print(searchData);
    notifyListeners();
  }

  getSearchApi(Map<String, String> q) async {
    await searchRepository.getDuckData(q).then((value) {
      setSearchData(ApiResponse.completed(value));
    }).onError((error, stackTrace) =>
        setSearchData(ApiResponse.error(error.toString())));
  }


}
