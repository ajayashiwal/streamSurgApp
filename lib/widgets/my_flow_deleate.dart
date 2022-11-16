// // import 'package:flutter/material.dart';
// //
// // class MyFlowDelegate implements FlowDelegate{
// //   @override
// //
// //   void paintChildren(FlowPaintingContext context){}
// //   @override
// //  bool shouldRapint(MyFlowDelegate)
// // }
//
// import 'package:flutter/material.dart';
//
// class FlowDemoDelegate extends FlowDelegate {
//
//   FlowDemoDelegate({this.myAnimation}) : super(repaint: myAnimation);
//
//   final Animation<double>? myAnimation;
//
//   @override
//   bool shouldRepaint(FlowDemoDelegate oldDelegate) {
//     return myAnimation != oldDelegate.myAnimation;
//   }
//
//   @override
//   void paintChildren(FlowPaintingContext context) {
//     for (int i = context.childCount - 1; i >= 0; i--) {
//       double dx = (context.getChildSize(i)!.height + 10) * i;
//       context.paintChild(
//         i,
//         transform: Matrix4.translationValues(0, dx * myAnimation!.value + 10, 0),
//       );
//     }
//   }
//
//   @override
//   Size getSize(BoxConstraints constraints) {
//     return const Size(70.0, double.infinity);
//   }
//
//   @override
//   BoxConstraints getConstraintsForChild(int i, BoxConstraints constraints) {
//     return i == 0 ? constraints : BoxConstraints.tight(const Size(50.0, 50.0));
//   }
// }

// import 'package:flutter/material.dart';
//
// class LinearFlowWidget extends StatefulWidget {
//   const LinearFlowWidget({Key? key}) : super(key: key);
//
//   @override
//   State<LinearFlowWidget> createState() => _LinearFlowWidgetState();
// }
//
// class _LinearFlowWidgetState extends State<LinearFlowWidget> with SingleTickerProviderStateMixin{
//   late AnimationController controller;
//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     controller=AnimationController(vsync: this,
//     duration: const Duration(milliseconds: 300));
//   }
//   @override
//   void dispose() {
//     // TODO: implement dispose
//     super.dispose();
//     controller.dispose();
//   }
//   @override
//   Widget build(BuildContext context) =>Flow(
//       delegate: FlowMenuDelegate(controller:controller),
//       children:[
//         const Text("sfs"),
//         const Text("sfs"),
//         const Text("sfs"),
//         const Text("sfs"),
//       ].map<Widget>(buildItem).toList()
//   );
//   // @override
//   // Widget build(BuildContext context) =>Flow(
//   //   delegate: FlowMenuDelegate(controller:controller),
//   //   children:[
//   //     Text("sfs"),
//   //     Text("sfs"),
//   //     Text("sfs"),
//   //     Text("sfs"),
//   //   ].map<Widget>(buildItem).toList()
//   // );
//   Widget buildItem(text)=>SizedBox(
//     width: 80,
//     height: 80,
//     child: FloatingActionButton(
//       onPressed: (){
//         if(controller.status==AnimationStatus.completed){
//           controller.reverse();
//         }else{
//           controller.forward();
//
//         }
//       },
//       elevation: 0,
//       splashColor: Colors.black,
//       child: const Icon(Icons.menu,color: Colors.white,size: 45),
//     ),
//   );
// }
//
//
// class FlowMenuDelegate extends FlowDelegate{
//   final Animation<double> controller;
//   FlowMenuDelegate({required this.controller}):super (repaint: controller);
//   @override
//   void paintChildren(FlowPaintingContext context){
//     final size=context.size;
//     final xStart=size.width-80;
//     final yStart=size.height-80;
//     for(int i=0; i<context.childCount; i++){
//       final childSize=context.getChildSize(i)!.width;
//       final dx=(childSize +8 )*i;
//       final x=xStart;
//       final y=yStart-dx*controller.value;
//       context.paintChild(
//           i,
//         transform: Matrix4.translationValues(x, y, 0)
//       );
//     }
//
//   }
//   @override
//   bool shouldRepaint(FlowDelegate oldDelegate)=>false;
// }

// import 'package:flutter/material.dart';
//
// class LinearFlowWidget extends StatelessWidget {
//   const LinearFlowWidget({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return  Scaffold(
//       appBar: AppBar(title: Text('Flow Layout Flutter')),
//       body: Center(
//         child: Container(
//           color: Colors.teal,
//           child: Flow(
//             delegate: SampleFlowDelegate(),
//             children: <Widget>[
//               buildItem(0,context),
//               buildItem(1,context),
//               buildItem(2,context),
//               buildItem(3,context),
//               buildItem(4,context),
//               buildItem(5,context),
//               buildItem(6,context),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
//   Widget buildItem(int i,context) {
//     return Container(
//       width: MediaQuery.of(context).size.width,
//       height: 100,
//       decoration: BoxDecoration(
//         color: Colors.deepOrangeAccent,
//         border: Border.all(color: Colors.black, width: 1),
//         boxShadow: [BoxShadow(blurRadius: 2)],
//       ),
//       child: FittedBox(
//         child: Center(
//           child: Text('$i'),
//         ),
//       ),
//     );
//   }
// }
//
// class SampleFlowDelegate extends FlowDelegate {
//   SampleFlowDelegate({this.openAnimation}) : super(repaint: openAnimation);
//
//   Animation<double>? openAnimation;
//   @override
//   void initState() {
//     super.initState();
//     openAnimation = AnimationController(
//       lowerBound: 1,
//       upperBound: 10,
//       duration: Duration(seconds: 2),
//       vsync: this,
//     );
//   }
//   @override
//   void paintChildren(FlowPaintingContext context) {
//     double dy = 0.0;
//     for (int i = 0; i < context.childCount; ++i) {
//       dy = context.getChildSize(i)!.height * i;
//       context.paintChild(
//         i,
//         transform: Matrix4.translationValues(
//           0,
//           dy * 0.1,
//           0,
//         ),
//       );
//     }
//   }
//
//   @override
//   bool shouldRepaint(SampleFlowDelegate oldDelegate) {
//
//     // false just for now
//     return openAnimation != oldDelegate.openAnimation;
//   }
//
// }

import 'package:flutter/material.dart';

class FlowExample extends StatefulWidget {
  const FlowExample({Key? key}) : super(key: key);

  // ignore: library_private_types_in_public_api
  @override
  // ignore: library_private_types_in_public_api
  _FlowExampleState createState() => _FlowExampleState();
}

class _FlowExampleState extends State<FlowExample> with SingleTickerProviderStateMixin {
  AnimationController? openAnimation;

  @override
  void initState() {
    super.initState();
    openAnimation = AnimationController(
      lowerBound: 1,
      upperBound: 10,
      duration: const Duration(seconds: 2),
      vsync: this,
    );
  }

  double initial = 0.0;

  final List<String> list = <String>["Home", "Feed", "Chat", "Settings", "About"];

  Widget buildItem(String i) {
    return GestureDetector(
      onTap: () {
        openAnimation!.reverse();
      },
      onDoubleTap: () {
        openAnimation!.forward();
      },
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: 100,
          decoration: BoxDecoration(
            color: Colors.deepOrangeAccent,
            border: Border.all(color: Colors.black, width: 1),
            boxShadow: const [BoxShadow(blurRadius: 2)],
          ),
          child: FittedBox(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Center(
                child: Text(i),
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Container(
            color: Colors.blueGrey,
            child: Flow(
              delegate: SampleFlowDelegate(openAnimation: openAnimation),
              children: list.map<Widget>((i) => buildItem(i)).toList(),
            ),
          ),
        ),
      ),
    );
  }
}

class SampleFlowDelegate extends FlowDelegate {
  SampleFlowDelegate({this.openAnimation}) : super(repaint: openAnimation);

  final Animation<double>? openAnimation;

  @override
  bool shouldRepaint(SampleFlowDelegate oldDelegate) {
    return openAnimation != oldDelegate.openAnimation;
  }

  @override
  void paintChildren(FlowPaintingContext context) {
    double dy = 0.0;
    for (int i = 0; i < context.childCount; ++i) {
      dy = context.getChildSize(i)!.height * i;
      context.paintChild(
        i,
        transform: Matrix4.translationValues(
          0,
          dy * 0.1 * openAnimation!.value,
          0,
        ),
      );
    }
  }
}