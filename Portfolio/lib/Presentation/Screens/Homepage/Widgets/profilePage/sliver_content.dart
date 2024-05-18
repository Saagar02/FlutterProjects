import 'package:flutter/material.dart';

class sliverContent extends StatelessWidget{
  const sliverContent({
    Key ? key}
  ): super(key: key);

  @override
  Widget build(BuildContext context){

    /*return SliverAppBar(
      expandedHeight: 20,
      toolbarHeight: 20,
      pinned: true,
      flexibleSpace: FlexibleSpaceBar(
        background: Padding(
          padding: EdgeInsets.only(top: 20),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.vertical(
                //topLeft: Radius.circular(50),
                top: Radius.circular(20),
                bottom: Radius.elliptical(20,20)//topRight: Radius.circular(50)
              )
            ),
          ),
        ),
      ),
    );*/
    return SliverAppBar(
      elevation: 0,
      pinned: true,
      expandedHeight: 60,
      toolbarHeight: 60,
      
      flexibleSpace: FlexibleSpaceBar(
      background:Container(
        color: const Color.fromARGB(255, 249, 249, 249),
        child: Center(
          child:Container(
            height: 50,
            width: 335,
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
              //Radius.circular(20)
                topLeft: Radius.circular(25),
                topRight: Radius.circular(25)
              ),
              boxShadow: [
                BoxShadow(
                  color: Color.fromARGB(73, 173, 159, 159),
                  spreadRadius: 3,
                  offset: Offset(0, -2.7)
                )
              ]
            ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  TextButton(
                    onPressed: () => {}, 
                    child: Text("Details",style: TextStyle(color: Colors.blue,fontSize: 16,fontWeight: FontWeight.bold),)
                  ),
            
                  TextButton(
                    onPressed: () => {}, 
                    child: Text("Certifications",style: TextStyle(color:Colors.blue,fontSize: 16,fontWeight: FontWeight.bold),)
                  ),
            
                  /*TextButton(
                    onPressed: () => {}, 
                    child: Text("Projects")
                  ),*/
            
                  TextButton(
                    onPressed: () => {}, 
                    child: Text("Experties",style: TextStyle(color: Colors.blue,fontSize: 16,fontWeight: FontWeight.bold),)
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}