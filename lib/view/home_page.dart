import 'package:anywheretask/data/network/endpoints/AppUrl.dart';
import 'package:anywheretask/data/network/network_api_services.dart';
import 'package:anywheretask/data/response/status.dart';
import 'package:anywheretask/models/topic_model.dart';
import 'package:anywheretask/res/colors.dart';
import 'package:anywheretask/res/styles.dart';
import 'package:anywheretask/view/widgets/categories_bar_widget.dart';
import 'package:anywheretask/view/widgets/loading/LoadingWidget.dart';
import 'package:anywheretask/view_models/search_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyHomePage extends StatelessWidget{

  static const routeName = '/home';


  @override
  Widget build(BuildContext context) {




    final ScrollController scrollController= ScrollController();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Demo Home Page'),
      ),
      body:
      ChangeNotifierProvider<SearchViewModel>(

        create: (context)=>SearchViewModel()..getSearchApi({"q":"mark", "format":"json"}),
        child: Consumer<SearchViewModel>(
          builder: (context, productValue, _) {
            if (productValue
                .searchData.status ==
                Status.LOADING) {
              return const SizedBox(
                height: 50,
                child: Center(
                  child: LoadingWidget(),
                ),
              );
            } else if (productValue
                .searchData.status ==
                Status.ERROR) {
              return Text(
                  "${productValue.searchData} ");
            } else {
              return  ListView(
                children: [

                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("General Topics",style: kPostTextStyle,),
                  ),
                  Expanded(
                    child: SizedBox(
                      height: 100,
                      width: 100,
                      child: ListView.builder(


                          itemCount: productValue.searchData.data!.generalTopics!.length,
                          scrollDirection: Axis.horizontal,

                          itemBuilder:(context, i){
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                color: grey,
                                width: MediaQuery.of(context).size.width*0.7,
                                height: 50,
                                child: Text(
                                  productValue.searchData.data!.generalTopics![i].text!
                                  ,style: kContentBoldLargeStyle,
                                ),
                              ),
                            );
                          } ),
                    ),
                  ),

                  Expanded(child: const CategoriesBarWidget()),


                  Expanded(
                    flex: 1,
                    child: ListView.separated(

                      separatorBuilder: (context, i)=>Divider(),
                        itemCount: productValue.topicList.length,

                        shrinkWrap: true,
                        physics: ClampingScrollPhysics(),
                        itemBuilder:(context, i){
                          return Padding(
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
                                            style: kContentBoldLargeStyle,
                                          )
                                        ],
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          );
                        } ),
                  )

                ],
              );
            }
          },
        ),


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
