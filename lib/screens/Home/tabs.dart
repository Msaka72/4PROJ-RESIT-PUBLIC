import 'package:flutter/material.dart';
import 'package:flutter_4proj_resit/screens/Home/Tabs_screens/home_screen.dart';
import 'package:flutter_4proj_resit/screens/Home/Tabs_screens/list_screen.dart';
import 'package:flutter_4proj_resit/screens/Home/Tabs_screens/map_screen.dart';
import 'package:flutter_4proj_resit/screens/Home/Tabs_screens/profil_screen.dart';
import 'package:flutter_4proj_resit/screens/Login/components/provider/google_sign_in.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with TickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Logged In"),
        centerTitle: true,
        actions: [
          TextButton(
            child: Text(
              "Logout",
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            onPressed: () {
              final provider =
                  Provider.of<GoogleSignInProvider>(context, listen: false);
              provider.logout();
            },
          )
        ],
      ),
      bottomNavigationBar: TabBar(
        controller: _tabController,
        labelColor: Colors.black,
        labelStyle: TextStyle(
          fontSize: 12,
        ),
        tabs: const <Widget>[
          Tab(
            text: "Home",
            icon: Icon(Icons.home),
          ),
          Tab(
            text: "Map",
            icon: Icon(Icons.map),
          ),
          Tab(
            text: "Liste",
            icon: Icon(Icons.list_alt),
          ),
          Tab(
            text: "Profil",
            icon: Icon(Icons.person),
          ),
        ],
      ),
      body: TabBarView(
        physics: new NeverScrollableScrollPhysics(),
        controller: _tabController,
        children: <Widget>[
          Center(
            child: HomeScreen(),
          ),
          Center(
            child: MapScreen(),
          ),
          Center(
            child: ListScreen(),
          ),
          Center(
            child: ProfilScreen(),
          ),
        ],
      ),
    );
  }
}
