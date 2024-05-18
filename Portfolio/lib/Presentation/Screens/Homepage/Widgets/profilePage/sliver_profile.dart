// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class SliverProfile extends StatelessWidget {
  const SliverProfile({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      elevation: 0,
      pinned: true,
      expandedHeight: 200,
      toolbarHeight: 200,  
      flexibleSpace: FlexibleSpaceBar(
        background: Padding(
          padding: EdgeInsets.only(bottom: 5),
          child: Container(
              color: Colors.blue.withOpacity(0.9),
            //color: Colors.red,
            child: //const Center(child: Text('Profile')),
                  Stack(
                    children: [
                      Positioned(
                        top: 45,
                        left: 10,
                        child: Container(
                          height: 140,
                          width: 140,
                          decoration: BoxDecoration(
                            color: Colors.blue,
                            borderRadius: BorderRadius.all(Radius.circular(200)),
                            boxShadow: [BoxShadow(
                              color:// Color.fromARGB(170, 247, 59, 45),
                                    Colors.white.withOpacity(0.7),
                              spreadRadius: 3.5,
                              offset: Offset(0,0),
                              blurStyle: BlurStyle.outer
                            )],
                          ),
                          child: //ClipOval(child: Image(image: AssetImage('assets/Images/Profesional.jpg'),fit: BoxFit.fitHeight,)) ,
                                //ClipOval(child: Image(image: AssetImage('assets/Images/Profile.png'),fit: BoxFit.fill,))) ,
                                ClipOval(child: Image(image: AssetImage('assets/Images/Profile2.jpg'),fit: BoxFit.fill,))
                        ) ,
                        
                      ),

                      Positioned(
                        top: 50,
                        left: 155,
                        child: Text("SAGAR CHAUDHARI",
                          style:TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold
                          ),
                        )
                      ),

                      
                      Positioned(
                        top: 84,
                        left: 180,
                        child: Row(
                          children :[
                            Icon(Icons.location_on,size: 18,), 
                            Text("Pune Maharashtra",
                              style:TextStyle(
                                color: Colors.black,
                                fontSize: 14,
                                fontWeight: FontWeight.bold
                              ),
                            )
                          ],
                        )
                      ),

                      Positioned(
                        top: 96,
                        left: 175,
                        child: TextButton(
                          onPressed: () => {
                                print("call button ")
                          },      
                          child:Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(Icons.call,size: 18,color: Colors.black,),
                              SizedBox(width:2,),
                              Text("9561900127",style:TextStyle(color: Colors.black,fontSize: 14,fontWeight: FontWeight.bold))
                            ]
                          ),
                        )
                      ),
                    
                      Positioned(
                        top: 120,
                        left: 175,
                        child: TextButton(
                          onPressed: () => {
                                print("Email button ")
                          },      
                          child:Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(Icons.email,size: 18,color: Colors.black,),
                              SizedBox(width:2,),
                              Text("sagarchaudhari2202",style:TextStyle(color: Colors.black,fontSize: 14,fontWeight: FontWeight.bold))
                            ]
                          ),
                        )
                      ),

                      Positioned(
                        top: 147,
                        left: 175,
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children:[ 
                            TextButton(
                              onPressed: () => {
                                    print("GitHub button ")
                              },      
                              child:Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Icon(Icons.gite,size: 18,color: Colors.black,),
                                  SizedBox(width:2,),
                                  Text("Git Hub",style:TextStyle(color: Colors.black,fontSize: 14,fontWeight: FontWeight.bold))
                                ]
                              ),
                            ),
                            
                          ]
                        )
                      ),
                        
                      Positioned(
                        top: 147,
                        left: 260,
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children:[ 
                            TextButton(
                              onPressed: () => {
                                    print("LinkedIn button ")
                              },      
                              child:Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Icon(Icons.gite,size: 18,color: Colors.black,),
                                  SizedBox(width:2,),
                                  Text("LinkedIn",style:TextStyle(color: Colors.black,fontSize: 14,fontWeight: FontWeight.bold))
                                ]
                              ),
                            ),
                            
                          ]
                        )
                      ), 
                    ],
                  )
          ),
        ),
      ),
    );
  }
}
/*class ProfileBuilder extends StatelessWidget{
  
  const ProfileBuilder({
    Key? key,
  }) : super(key: key);

  Widget build(BuildContext context){

    return SliverToBoxAdapter(
      child: Container(
        height: 300,
        color: Colors.blue,
        child: Center(child: Text('Fixed Container')),
      ),
    );
  }
}*/