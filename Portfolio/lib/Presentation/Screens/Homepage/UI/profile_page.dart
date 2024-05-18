import 'package:flutter/material.dart';
import '../Widgets/profilePage/sliver_backgroundImage.dart';
import '../Widgets/profilePage/sliver_content.dart';
import '../Widgets/profilePage/sliver_list.dart';
import '../Widgets/profilePage/sliver_profile.dart';
import 'content_details.dart';


class profilePage extends StatelessWidget {
  const profilePage({super.key,});

  @override
  Widget build(BuildContext context) {
  /*return Scaffold(
    body: Column(
      children: [
        Expanded(
          child: CustomScrollView(
            slivers: [
              SliverAppBarBuilder(),
              SliverProfile(),
            ],
          ),
        ),
        Expanded(
          child: CustomScrollView(
            slivers: [
              SliverPadding(
                padding: EdgeInsets.symmetric(vertical: 20),
                sliver: SliverListBldr(),
              ),
            ],
          ),
        ),
      ],
    ),
  );*/

  return const Scaffold(
    body: CustomScrollView(
      slivers:[
        SliverBackgroundImage(),
        SliverProfile(),
        //SliverPadding(
          //padding: EdgeInsets.symmetric(vertical: 20),
          //sliver: 
        
        SliverPadding(
          padding: EdgeInsets.only(top: 5,left: 0,right: 0,bottom: 10),  
          sliver: sliverContent()
        ),
        //),
        SliverPadding(
          
          padding: EdgeInsets.symmetric(vertical: 0),   
          sliver : SliverListBldr()//contentDetails(),
                  //sliverInfo()
        ),

        /*SliverToBoxAdapter(
          child: const DecoratedBox(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.vertical()
            ),  
            child: SliverListBldr(),
          ),
        ),*/
        /*SliverList(
          delegate: DecoratedBox(
            decoration: BoxDecoration(),
            child: SliverChildListDelegate([
                      Column(
                    // Your Column content here
                      )
                    ]),
          )
          ,
        ),*/

      ],
    ),
  );
}
}
