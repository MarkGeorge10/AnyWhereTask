import 'package:anywheretask/data/network/endpoints/AppUrl.dart';
import 'package:anywheretask/data/network/network_api_services.dart';
import 'package:anywheretask/data/response/status.dart';
import 'package:anywheretask/models/topic_model.dart';
import 'package:anywheretask/view/widgets/categories_bar_widget.dart';
import 'package:anywheretask/view/widgets/loading/LoadingWidget.dart';
import 'package:anywheretask/view_models/search_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyHomePage extends StatefulWidget {
  static const routeName = '/home';
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {


  // @override
  // Future<void> initState() async {
  //   // TODO: implement initState
  //   super.initState();
  //   final NetworkApiServices _apiServices = NetworkApiServices();
  //   Map<String,String> q = {
  //   "q":"mark",
  //   "format":"json"
  //   };
  //   dynamic response =
  //   await _apiServices.getGetApiParamResponse(AppUrl.loginEndPoint(),q);
  //
  //
  //   response = Autogenerated.fromJson(response);
  // }


  @override
  Widget build(BuildContext context) {

    try{
      final searchVM = context.watch<SearchViewModel>();

      Map<String,String> q = {
            "q":"mark",
            "format":"json"
            };
      searchVM.getSearchApi(q);
    }
    catch(w){
      print(w);
    }




    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Demo Home Page'),
      ),
      body:
      Consumer<SearchViewModel>(
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
            return const SizedBox(

              child: SingleChildScrollView(
                child: Column(
                  children: [
                    CategoriesBarWidget(),

                    // Padding(
                    //   padding: const EdgeInsets.all(10.0),
                    //   child:
                    //   SizedBox(
                    //     height: MediaQuery.of(context).size.height,
                    //     child: GridView.count(
                    //         crossAxisCount: 2,
                    //         childAspectRatio: 10/16,
                    //         mainAxisSpacing: 10,
                    //         crossAxisSpacing: 20,
                    //
                    //
                    //         children: List.generate(productValue
                    //             .searchData.data!.relatedTopics!
                    //             .length, (index) {
                    //           ProductItemModel product = productValue
                    //               .allProductsInSpecificCollection
                    //               .data!
                    //               .edges![index]
                    //               .node!;
                    //           return ProductCard(
                    //             product: product,
                    //             color: getBackgroundColor(index),
                    //             index: index,
                    //           );
                    //         },
                    //         )
                    //
                    //       // GridView.builder(
                    //       //   itemCount: productValue
                    //       //       .allProductsInSpecificCollection.data!.edges!
                    //       //       .length,
                    //       //   shrinkWrap: true,
                    //       //   physics: const ScrollPhysics(),
                    //       //   gridDelegate:
                    //       //   const SliverGridDelegateWithFixedCrossAxisCount(
                    //       //     childAspectRatio: 0.825,
                    //       //     crossAxisCount: 2,
                    //       //     mainAxisSpacing: 10,
                    //       //     crossAxisSpacing: 10,
                    //       //   ),
                    //       //   itemBuilder: (_, index) {
                    //       //     ProductItemModel product = productValue
                    //       //         .allProductsInSpecificCollection
                    //       //         .data!
                    //       //         .edges![index]
                    //       //         .node!;
                    //       //     return
                    //       //   },
                    //       // ),
                    //     ),
                    //   ),
                    // )
                  ],
                ),
              ),
            );
          }
        },
      ),

    );
  }
}
