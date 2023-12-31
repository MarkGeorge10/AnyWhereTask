import 'package:anywheretask/data/response/ApiResponse.dart';
import 'package:anywheretask/models/search_model.dart';
import 'package:anywheretask/models/topic_model.dart';
import 'package:anywheretask/repository/search_repository.dart';
import 'package:flutter/material.dart';
import 'package:package_info_plus/package_info_plus.dart';

import '../models/app_details/app_details.dart';

class SearchViewModel with ChangeNotifier {
  final SearchRepository searchRepository = SearchRepository();
  int selectedTopic = 0;
  String searchText = "";
  ApiResponse<SearchModel> searchData = ApiResponse.completed(null);
  List<Topics> topicList = [];


  changeSelectedCollection(int i){
    selectedTopic = i;
    topicList.clear();
    topicList.addAll(searchData.data!.specificTopics![selectedTopic].topics!);
    notifyListeners();
  }

  setSearchData(ApiResponse<SearchModel> response) {

    searchData = response;
    topicList.addAll(searchData.data!.specificTopics![selectedTopic].topics!);
    print(searchData);
    notifyListeners();
  }

  getSearchApi(Map<String, String> q) async {
    if(searchData.data !=null){
      searchData.data!.generalTopics!.clear();
      searchData.data!.specificTopics!.clear();
      topicList.clear();
      searchData = ApiResponse.completed(null);
      selectedTopic = 0;
    }
    await searchRepository.getDuckData(q).then((value) {
      setSearchData(ApiResponse.completed(value));
    }).onError((error, stackTrace) =>
        setSearchData(ApiResponse.error(error.toString())));
  }


}
