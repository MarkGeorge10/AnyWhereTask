import 'package:anywheretask/data/response/status.dart';
import 'package:anywheretask/models/topic_model.dart';
import 'package:anywheretask/res/colors.dart';
import 'package:anywheretask/view/widgets/loading/LoadingWidget.dart';
import 'package:anywheretask/view_models/search_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';




class CategoriesBarWidget extends StatelessWidget {

  List<RelatedTopics> specificTopic;
   CategoriesBarWidget({
    Key? key,
    required this.specificTopic
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final searchViewModel = context.watch<SearchViewModel>();

    return Consumer<SearchViewModel>(
      builder: (context,value,_){
        return Container(
          height: 60,
          margin: const EdgeInsets.symmetric(vertical: 15),
          child: ListView.builder(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            shrinkWrap: true,
            itemCount: value.searchData.data!.specificTopics!.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {

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
      return

        CategoryCard(
          onPressed: () {
            print(index);
            searchViewModel.changeSelectedCollection(index);
          },
          text: value.searchData.data!.specificTopics![index].name! ?? "",
          isSelected: searchViewModel.selectedTopic == index,
        );
    }
            },
          ),
        );

      },

    );
  }
}


class CategoryCard extends StatelessWidget {
  final String text;
  final bool isSelected;
  final void Function()? onPressed;
  const CategoryCard(
      {Key? key,
        required this.text,
        required this.isSelected,
        required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: AnimatedContainer(
        margin: const EdgeInsets.only(left: 15),
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        duration: const Duration(milliseconds: 250),
        decoration: BoxDecoration(
            color: isSelected ? kPrimaryColor : Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: <BoxShadow>[
              if (isSelected)
                BoxShadow(
                    color: kPrimaryColor.withAlpha(100),
                    blurRadius: 0.5,
                    offset: const Offset(4, 4),
                    spreadRadius: 0.3)
            ]),
        child: Text(
          text,
          style: TextStyle(
              color: isSelected ? Colors.white : kPrimaryColor,
              fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
              fontSize: 18),
        ),
      ),
    );
  }
}
