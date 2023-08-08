
import 'package:anywheretask/models/topic_model.dart';
import 'package:anywheretask/res/styles.dart';
import 'package:anywheretask/view/widgets/cloudinary.dart';
import 'package:flutter/material.dart';

class TopicCard extends StatelessWidget {

  Topics item;
   TopicCard({Key? key,required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        await Navigator.pushNamed(context, '/topic_details',arguments:{'selectedUrl': item.firstURL} );

      },
      child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width * 0.05, vertical: MediaQuery.of(context).size.height * 0.01),
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
                    child: Cloudinary(
                      image: "https://duckduckgo.com${item.icon!.uRL!}",
                    )

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
                        item.text!,
                        style: kContentBoldLargeStyle,
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
