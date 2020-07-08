
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'pointer_tracker.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
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

class _MyHomePageState extends State<MyHomePage> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      body: RawGestureDetector(
        child: Center(
          child: Container(
            width: 300.0,
            height: 200.0,
            child: CustomScrollView(
              scrollDirection: Axis.horizontal,
              slivers: <Widget>[
                SliverAppBar(
                  pinned: true,
                  expandedHeight: 250,
                  flexibleSpace: FlexibleSpaceBar(
                    title: Text('Demo'),
                    background: Image.asset(
                      'images/task_bg_dart.png', fit: BoxFit.cover,
                    ),
                  ),
                ),
                SliverPadding(
                  padding: EdgeInsets.all(18),
                  sliver: SliverGrid(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 10.0,
                        crossAxisSpacing: 10.0,
                        childAspectRatio: 4.0
                    ),
                    delegate: SliverChildBuilderDelegate(
                            (context, index) {
                          return Container(
                            alignment: Alignment.center,
                            color: Colors.cyan[100 * (index % 9)],
                            child: Text('grid item $index'),
                          );
                        },
                        childCount: 20
                    ),
                  ),
                ),
                SliverFixedExtentList(
                  itemExtent: 50,
                  delegate: SliverChildBuilderDelegate(
                          (context, index) {
                        return Container(
                          alignment: Alignment.center,
                          color: Colors.lightBlue[100 * (index % 9)],
                          child: new Text('list item $index'),
                        );
                      },
                      childCount: 50
                  ),
                )
              ],
            ),
          ),
        ),
        behavior: HitTestBehavior.translucent,
        gestures: {
          PointerTracker: GestureRecognizerFactoryWithHandlers<PointerTracker>(
              () => PointerTracker(),
              (PointerTracker instance) {
//                instance.onUpdate = (det) => print('********* : ${det.delta}');
                instance.onStart = (det) {


                };
                instance.onUpdate = (det) {
//                  print('localPosition********* : ${det.localPosition}');
//                  print('globalPosition************: ${det.globalPosition}')
                };
              }
          )
        },
      )// This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
