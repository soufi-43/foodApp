import 'package:flutter/material.dart';
import 'package:food_review/foodList.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  TabController tabController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    tabController = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: ListView(
        children: <Widget>[
          Stack(
            children: <Widget>[
              Container(
                height: 300.0,
              ),
              Container(
                height: 200.0,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/counter.jpg'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Positioned(
                top: 150.0,
                left: 25.0,
                child: Container(
                  height: 140.0,
                  width: 140.0,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.white,
                      width: 2.0,
                    ),
                    borderRadius: BorderRadius.circular(70.0),
                    image: DecorationImage(
                        image: AssetImage('assets/model.jpg'),
                        fit: BoxFit.cover),
                  ),
                ),
              ),
              Positioned(
                top: 225.0,
                left: 175.0,
                child: Row(
                  children: <Widget>[
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          'Elisabeth',
                          style: TextStyle(
                            fontFamily: 'Quicksand',
                            fontSize: 15.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          "1947 Followers",
                          style: TextStyle(
                            fontFamily: 'Quicksand',
                            fontSize: 12.0,
                            color: Colors.grey,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      width: 15.0,
                    ),
                    Container(
                      height: 30.0,
                      width: 75.0,
                      decoration: BoxDecoration(
                        color: Color(0xFFEAF4EF),
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      child: Center(
                        child: Text(
                          'Follow',
                          style: TextStyle(
                            fontFamily: 'Quicksand',
                            fontSize: 11.0,
                            color: Color(0x0FF5A9776),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.only(top: 20.0),
            child: TabBar(
              controller: tabController,
              indicatorColor: Color(0xFF469469),
              labelColor: Colors.black,
              indicatorSize: TabBarIndicatorSize.label,
              unselectedLabelColor: Colors.grey.withOpacity(0.6),
              isScrollable: true,
              tabs: <Widget>[
                Tab(
                  child: Text(
                    'Recipes',
                    style: TextStyle(
                        fontFamily: 'Montserrat', fontWeight: FontWeight.bold),
                  ),
                ),
                Tab(
                  child: Text(
                    'Gallery',
                    style: TextStyle(
                        fontFamily: 'Montserrat', fontWeight: FontWeight.bold),
                  ),
                ),
                Tab(
                  child: Text(
                    'Story',
                    style: TextStyle(
                        fontFamily: 'Montserrat', fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height * 325.0,
            child: TabBarView(
              controller: tabController,
              children: <Widget>[
                new FoodList(),
                new FoodList(),
                new FoodList(),


              ],
            ),
          ),
        ],
      ),
    );
  }
}
