import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget{
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeActivity(

      ),
    );
  }

}

class HomeActivity extends StatelessWidget{
  const HomeActivity({super.key});

  MySnackbar(message,context){
    return ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(message)),
    );
  }

  MyAlertDialog(context){
    return showDialog(
        context: context,
        builder: (BuildContext context){
          return Expanded(
              child: AlertDialog(
                title: Text("Alert!"),
                content: Text("Do you want to delete?"),
                actions: [
                  TextButton(onPressed: (){MySnackbar("Delete Success", context);Navigator.of(context).pop();}, child: Text("Yes")),
                  TextButton(onPressed: (){Navigator.of(context).pop();}, child: Text("No")),
                ],
              )
          );
        }
    );
  }

  @override
  Widget build(BuildContext context) {

    
    final ButtonStyle buttonStyle = ElevatedButton.styleFrom(
      backgroundColor: Colors.green,
      foregroundColor: Colors.white,
      padding: EdgeInsets.all(25),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(40)),
      ),
    );

    
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 10,
        toolbarHeight: 60, //Ideal Height
        toolbarOpacity: 1,
        elevation: 0,
        title: Text("SmartbookHub"),
        backgroundColor: Colors.blue,
        actions: [
          IconButton(onPressed: (){MySnackbar("I'm notofication",context);}, icon: Icon(Icons.notifications)),
          IconButton(onPressed: (){MySnackbar("I'm message",context);}, icon: Icon(Icons.message)),
          IconButton(onPressed: (){MySnackbar("I'm search",context);}, icon: Icon(Icons.search)),
        ],
      ),


      body: Text("Hi Girls!"),
      

      floatingActionButton: FloatingActionButton(
        elevation: 10,
        backgroundColor: Colors.green,
          child: Icon(Icons.add),
          onPressed: (){MySnackbar("I'm Floating Action Button", context);}
      
      ),


      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.blue,
        currentIndex: 1,

        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home),label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.message),label: "Contact"),
          BottomNavigationBarItem(icon: Icon(Icons.person),label: "Profile"),
        ],

        onTap: (int index){
          if(index==0){
            MySnackbar("I'm Home Button", context);
          }else if(index==1){
            MySnackbar("I'm Contact Button", context);
          }else{
            MySnackbar("I'm Profile Button", context);
          }
        },

      ),


      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
              padding: EdgeInsets.all(0),
                  child: UserAccountsDrawerHeader(
                      accountName: Text("Jahin Tasnia",style: TextStyle(color: Colors.black),),
                      accountEmail: Text("jahin@gmail.com",style: TextStyle(color: Colors.black),),
                      currentAccountPicture: Image.network("https://media.licdn.com/dms/image/v2/D5603AQHiHspJ_hZEOw/profile-displayphoto-shrink_200_200/profile-displayphoto-shrink_200_200/0/1730772826375?e=2147483647&v=beta&t=pmotjUZF0jvBwV6Je_3hYt2BGR9N6ob-1wx86813OJ4"),
                    arrowColor: Colors.deepOrange,
              ),

            ),

            ListTile(title: Text("Home"),iconColor: Colors.amber,leading: Icon(Icons.home),onTap: (){MySnackbar("I'm Home Button", context);},),
            ListTile(title: Text("Contact"),iconColor: Colors.amber,leading: Icon(Icons.message),onTap: (){MySnackbar("I'm Contact Button", context);},),
            ListTile(title: Text("Email"),iconColor: Colors.amber,leading: Icon(Icons.email),onTap: (){MySnackbar("I'm Email Button", context);},),
            ListTile(title: Text("Settings"),iconColor: Colors.amber,leading: Icon(Icons.settings),onTap: (){MySnackbar("I'm Settings Button", context);},),
            ListTile(title: Text("Logout"),iconColor: Colors.amber,leading: Icon(Icons.logout),onTap: (){MySnackbar("I'm Logout Button", context);},),
          ],
        ),
      ),
    );
  }

}
