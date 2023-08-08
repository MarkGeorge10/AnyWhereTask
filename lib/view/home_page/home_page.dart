import 'package:anywheretask/data/network/endpoints/AppUrl.dart';
import 'package:anywheretask/data/network/network_api_services.dart';
import 'package:anywheretask/data/response/status.dart';
import 'package:anywheretask/models/topic_model.dart';
import 'package:anywheretask/res/Dimensions.dart';
import 'package:anywheretask/res/colors.dart';
import 'package:anywheretask/res/styles.dart';
import 'package:anywheretask/view/home_page/component/topic_card.dart';
import 'package:anywheretask/view/widgets/appbar.dart';
import 'package:anywheretask/view/widgets/categories_bar_widget.dart';
import 'package:anywheretask/view/widgets/cloudinary.dart';
import 'package:anywheretask/view/widgets/loading/LoadingWidget.dart';
import 'package:anywheretask/view/widgets/text_field/Validation.dart';
import 'package:anywheretask/view/widgets/text_field/text_field.dart';
import 'package:anywheretask/view_models/search_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyHomePage extends StatelessWidget {
  static const routeName = '/home';

  @override
  Widget build(BuildContext context) {
    final ScrollController scrollController = ScrollController();
    TextFields textFields = TextFields();
    Dimensions dimensions = Dimensions.getInstance();
    SearchViewModel searchViewModel = SearchViewModel();
    return Scaffold(
      appBar: CustomAppBar(
        title: "Home Page",
      ),
      body: ListView(
        children: [
          Padding(
            padding: EdgeInsets.only(
              left: dimensions.widthScreen / 20,
              right: dimensions.widthScreen / 20,
              bottom: dimensions.heightScreen / 30,
              top: dimensions.heightScreen / 50,
            ),
            child: TextField(
              cursorColor: Colors.grey,
              onChanged: (value) {
                searchViewModel.searchText = value;
              },
              decoration: InputDecoration(
                  fillColor: Colors.white,
                  filled: true,
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide.none),
                  hintText: "Search",
                  hintStyle: const TextStyle(color: Colors.grey, fontSize: 18),
                  suffixIcon: IconButton(
                    icon: const Icon(Icons.search),
                    onPressed: () {
                      // print(productViewModel.searchedTitle);
                      // collectionViewModel.getSearchProduct(productViewModel.searchedTitle!,languageViewModel.locale!.languageCode);

                      searchViewModel.getSearchApi(
                          {"q": searchViewModel.searchText, "format": "json"});
                    },
                  )),
            ),
          ),
          ChangeNotifierProvider<SearchViewModel>.value(
            value: searchViewModel,
            child: Consumer<SearchViewModel>(
              builder: (context, value, _) {
                if (value.searchData.status == Status.LOADING) {
                  return const SizedBox(
                    height: 50,
                    child: Center(
                      child: LoadingWidget(),
                    ),
                  );
                } else if (value.searchData.status == Status.ERROR) {
                  return Text("${value.searchData} ");
                } else {
                  if(value.searchData.data !=null){
                    return SizedBox(
                      height: MediaQuery.of(context).size.height,
                      child: ListView(
                        children: [
                          Visibility(
                            visible: value
                                .searchData.data!.generalTopics!.isEmpty?false:true,
                            child: const Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text(
                                "General Topics",
                                style: kPostTextStyle,
                              ),
                            ),
                          ),
                          Visibility(
                            visible: value
                              .searchData.data!.generalTopics!.isEmpty?false:true,
                            child: Expanded(

                              child: SizedBox(
                                height: 280,
                                width: 100,
                                child: ListView.builder(
                                    itemCount: value
                                        .searchData.data!.generalTopics!.length,
                                    scrollDirection: Axis.horizontal,
                                    itemBuilder: (context, i) {
                                      return SizedBox(
                                          width: 250,
                                          height: 280,
                                          child: TopicCard(
                                            item: value
                                                .searchData.data!.generalTopics![i],
                                          ));
                                    }),
                              ),
                            ),
                          ),
                           Expanded(child: CategoriesBarWidget(specificTopic: value.searchData.data!.specificTopics!,)),
                          Expanded(
                            flex: 1,
                            child: ListView.separated(
                                separatorBuilder: (context, i) => const Divider(),
                                itemCount: value.topicList.length,
                                shrinkWrap: true,
                                physics: const ClampingScrollPhysics(),
                                itemBuilder: (context, i) {
                                  return TopicCard(
                                    item: value.topicList[i],
                                  );
                                }),
                          )
                        ],
                      ),
                    );
                  }
                  else{
                    return const Center(
                      child: Text("No data available"),
                    );
                  }

                }
              },
            ),
          )
        ],
      ),
    );
  }
}

/*
* Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: MediaQuery.of(context).size.width * 0.02, vertical: MediaQuery.of(context).size.height * 0.01),
                                    child: SingleChildScrollView(
                                      child: Stack(
                                        children: [

                                          Container(
                                            height: MediaQuery.of(context).size.height * 0.32,
                                            width: double.infinity,
                                            color: Colors.black54,


                                            child: ClipRRect(

                                              borderRadius: const BorderRadius.only(
                                                topRight: Radius.circular(8.0),
                                                topLeft: Radius.circular(8.0),
                                                bottomLeft: Radius.circular(8.0),
                                                bottomRight: Radius.circular(8.0),
                                              ),
                                              child: Image.network(

                                                "https://duckduckgo.com${productValue.topicList[i].icon!.uRL!}",
                                                fit: BoxFit.fill,
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.12),
                                            child: Container(
                                              height: MediaQuery.of(context).size.height * 0.2,
                                              decoration: const BoxDecoration(
                                                gradient: LinearGradient(
                                                    begin: Alignment.bottomCenter,
                                                    end: Alignment.topCenter,
                                                    colors: [Colors.black54, Colors.transparent]),
                                                borderRadius: BorderRadius.only(
                                                  bottomLeft: Radius.circular(8.0),
                                                  bottomRight: Radius.circular(8.0),
                                                  topLeft: Radius.circular(8.0),
                                                  topRight: Radius.circular(8.0),
                                                ),
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            height: MediaQuery.of(context).size.height * 0.32,
                                            width: double.infinity,
                                            child: Padding(
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: MediaQuery.of(context).size.width * 0.05, vertical: MediaQuery.of(context).size.height * 0.01),
                                              child: Column(
                                                mainAxisAlignment: MainAxisAlignment.end,
                                                children: [
                                                  Text(
                                                    productValue.topicList[i].text!,
                                                    style: kPostTextStyle,
                                                  )
                                                ],
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  );
                                  * ]*/
