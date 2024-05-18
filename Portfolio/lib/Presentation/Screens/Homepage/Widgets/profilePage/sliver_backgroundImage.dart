
import 'package:flutter/material.dart';

class SliverBackgroundImage extends StatelessWidget {
  const SliverBackgroundImage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      elevation: 0,
      pinned: false,
      centerTitle: false,
      stretch: true,
      expandedHeight: 150.0,
      toolbarHeight: 170,
      flexibleSpace: const FlexibleSpaceBar(
        
        centerTitle: true,
        stretchModes: [StretchMode.zoomBackground],
        collapseMode: CollapseMode.parallax,
        background: Image(
          image: AssetImage('assets/Images/profileBack.png'),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
