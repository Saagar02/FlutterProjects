import "package:expense_manager/screens/category_screen.dart";
import "package:expense_manager/screens/home_screen.dart";
import "package:flutter/material.dart";

class Sidebar extends StatefulWidget {
  const Sidebar({super.key});

  @override
  State<Sidebar> createState() => _SidebarState();
}

class _SidebarState extends State<Sidebar> {
  static String  menubarItem = "Transaction";
  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: Padding(
          padding: const EdgeInsets.only(
            right: 32,
          ),
          child: Column(
            children: [
              const SizedBox(height: 16,),
              Column(
                children: [
                  const Text("Expense Manager",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600
                    ),),
                  const Text("Save all you transactions",
                    style: TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.w400
                    ),),
                    const SizedBox(height: 16,),
                    GestureDetector(
                      onTap: (){
                        setState(() {
                          Navigator.of(context).push(
                            MaterialPageRoute(builder: (context)=> const HomeScreen(),
                            )
                          );
                          menubarItem = "Transaction";
                        });
                      },
                      child: Container(
                        height: 40,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          color:  menubarItem == "Transaction" ? 
                                    const Color.fromRGBO(14, 161, 125, 0.15)
                                    : null,
                          borderRadius: const BorderRadius.only(
                            topRight: Radius.circular(20),
                            bottomRight: Radius.circular(20),
                          )
                        ),
                        child: Padding(
                            padding: const EdgeInsets.only(
                              left: 20,
                              top: 8,
                              bottom: 8
                            ),
                            child: Row(
                              children:[
                                const Icon(Icons.double_arrow,color: 
                                  Color.fromRGBO(14, 161, 125, 1)
                                ),
                                const SizedBox(width: 6,),
                                Text("Transaction",
                                  style: TextStyle(
                                    color:  menubarItem == "Transaction" ? 
                                    const Color.fromRGBO(14, 161, 125, 1)
                                    : const Color.fromRGBO(33,33,33, 1),
                                    fontSize: 18,
                                    fontWeight: FontWeight.w400
                                  ),
                                ),
                              ]
                            ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    GestureDetector(
                      onTap: (){
                        setState(() {
                          menubarItem = "Graph";
                        });
                      },
                      child: Container(
                        height: 40,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          color:  menubarItem == "Graph" ? 
                                    const Color.fromRGBO(14, 161, 125, 0.15)
                                    : null,
                          borderRadius: const BorderRadius.only(
                            topRight: Radius.circular(20),
                            bottomRight: Radius.circular(20),
                          )
                        ),
                        child: Padding(
                            padding: const EdgeInsets.only(
                              left: 20,
                              top: 8,
                              bottom: 8
                            ),
                            child: Row(
                              children:[
                                const Icon(Icons.pie_chart,color: 
                                Color.fromRGBO(14, 161, 125, 1)
                                ),
                                const SizedBox(width: 6,),
                                Text("Graph",
                                  style: TextStyle(
                                    color:  menubarItem == "Graph" ? 
                                    const Color.fromRGBO(14, 161, 125, 1)
                                    : const Color.fromRGBO(33,33,33, 1),
                                    fontSize: 18,
                                    fontWeight: FontWeight.w400
                                  ),
                                ),
                              ]
                            ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    GestureDetector(
                      onTap: (){
                        setState(() {
                          menubarItem = "Category";
                          Navigator.push(context,
                            MaterialPageRoute(builder: (context) => const CategoryScreen()),
                          );
                        });
                      },
                      child: Container(
                        height: 40,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          color:  menubarItem == "Category" ? 
                                    const Color.fromRGBO(14, 161, 125, 0.15)
                                    : null,
                          borderRadius: const BorderRadius.only(
                            topRight: Radius.circular(20),
                            bottomRight: Radius.circular(20),
                          )
                        ),
                        child: Padding(
                            padding: const EdgeInsets.only(
                              left: 20,
                              top: 8,
                              bottom: 8
                            ),
                            child: Row(
                              children:[
                                const Icon(Icons.category,color: 
                                  Color.fromRGBO(14, 161, 125, 1)
                                ),
                                const SizedBox(width: 6,),
                                Text("Category",
                                  style: TextStyle(
                                    color:  menubarItem == "Category" ? 
                                    const Color.fromRGBO(14, 161, 125, 1)
                                    : const Color.fromRGBO(33,33,33, 1),
                                    fontSize: 18,
                                    fontWeight: FontWeight.w400
                                  ),
                                ),
                              ]
                            ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    GestureDetector(
                      onTap: (){
                        setState(() {
                          menubarItem = "Trash";
                        });
                      },
                      child: Container(
                        height: 40,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          color:  menubarItem == "Trash" ? 
                                    const Color.fromRGBO(14, 161, 125, 0.15)
                                    : null,
                          borderRadius: const BorderRadius.only(
                            topRight: Radius.circular(20),
                            bottomRight: Radius.circular(20),
                          )
                        ),
                        child: Padding(
                            padding: const EdgeInsets.only(
                              left: 20,
                              top: 8,
                              bottom: 8
                            ),
                            child: Row(
                              children:[
                                const Icon(Icons.delete_forever,color : 
                                  Color.fromRGBO(14, 161, 125, 1)
                                ),
                                const SizedBox(width: 6,),
                                Text("Trash",
                                  style: TextStyle(
                                    color:  menubarItem == "Trash" ? 
                                    const Color.fromRGBO(14, 161, 125, 1)
                                    : const Color.fromRGBO(33,33,33, 1),
                                    fontSize: 18,
                                    fontWeight: FontWeight.w400
                                  ),
                                ),
                              ]
                            ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    GestureDetector(
                      onTap: (){
                        setState(() {
                          menubarItem = "About us";
                        });
                      },
                      child: Container(
                        height: 40,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          color:  menubarItem == "About us" ? 
                                    const Color.fromRGBO(14, 161, 125, 0.15)
                                    : null,
                          borderRadius: const BorderRadius.only(
                            topRight: Radius.circular(20),
                            bottomRight: Radius.circular(20),
                          )
                        ),
                        child: Padding(
                            padding: const EdgeInsets.only(
                              left: 20,
                              top: 8,
                              bottom: 8
                            ),
                            child: Row(
                              children:[
                                const Icon(Icons.person,color: 
                                  Color.fromRGBO(14, 161, 125, 1)
                                ),
                                const SizedBox(width: 6,),
                                Text("About us",
                                  style: TextStyle(
                                    color:  menubarItem == "About us" ? 
                                    const Color.fromRGBO(14, 161, 125, 1)
                                    : const Color.fromRGBO(33,33,33, 1),
                                    fontSize: 18,
                                    fontWeight: FontWeight.w400
                                  ),
                                ),
                              ]
                            ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 24,
                    )
                ],
              ),
            ],
          ),
        ),
      );
  }
}