import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => MyAppState();
}

class MyAppState extends State<MyApp> with TickerProviderStateMixin<MyApp> {
  GlobalKey<State> key = GlobalKey();

  bool fabShowing = false;

  // non-state-managed variables
  late AnimationController _controller;
  RenderObject? _prevRenderObject;
  double _offsetToRevealBottom = double.infinity;
  double _offsetToRevealTop = double.negativeInfinity;

  @override
  void initState() {
    super.initState();
    // fabShowing = false;
    _controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 300));
    _controller.addStatusListener((val) {
      if (val == AnimationStatus.dismissed) {
        setState(() => fabShowing = false);
      }
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Scrolling."),
        ),
        body: NotificationListener<ScrollNotification>(
          child: ListView(
            shrinkWrap: true,
            itemExtent: 100.0,
            children: [
              ContainerWithBorder(),
              ContainerWithBorder(),
              ContainerWithBorder(),
              ContainerWithBorder(),
              ContainerWithBorder(),
              ContainerWithBorder(),
              ContainerWithBorder(),
              ContainerWithBorder(),
              ContainerWithBorder(),
              ContainerWithBorder(),
              ContainerWithBorder(),
              MyObservableWidget(key: key),
              ContainerWithBorder(),
              ContainerWithBorder(),
              ContainerWithBorder(),
              ContainerWithBorder(),
              ContainerWithBorder(),
              ContainerWithBorder(),
              ContainerWithBorder(),
              ContainerWithBorder()
            ],
          ),
          onNotification: (ScrollNotification scroll) {
            print(scroll.metrics.pixels);
            var currentContext = key.currentContext;
            if (currentContext == null) return false;

            var renderObject = currentContext.findRenderObject();

            if (renderObject != _prevRenderObject) {
              RenderAbstractViewport? viewport =
                  RenderAbstractViewport.of(renderObject);
              _offsetToRevealBottom = viewport!
                  .getOffsetToReveal(renderObject as RenderObject, 1.0)
                  .offset;
              _offsetToRevealTop =
                  viewport.getOffsetToReveal(renderObject, 0.0).offset;
            }

            print("_bottom : $_offsetToRevealBottom");
            print("_top : $_offsetToRevealTop");

            final offset = scroll.metrics.pixels;

            if (!(_offsetToRevealBottom < offset &&
                offset < _offsetToRevealTop)) {
              if (!fabShowing) setState(() => fabShowing = true);
              // if (offset > _offsetToRevealBottom) {
              //   setState(() {
              //     fabShowing = false;
              //     return;
              //   });
              // }

              if (_controller.status != AnimationStatus.forward) {
                _controller.forward();
              }
            } else {
              if (_controller.status != AnimationStatus.reverse) {
                _controller.reverse();
              }
            }
            if (offset > _offsetToRevealBottom - 100) {
              setState(() {
                fabShowing = false;
              });
            }
            return false;
          },
        ),
        bottomNavigationBar: fabShowing
            ? AnimatedBuilder(
                child: BottomAppBar(
                    child: Container(height: 100.0, color: Colors.green)),
                builder: (BuildContext context, child) =>
                    Opacity(opacity: _controller.value, child: child),
                animation: this._controller,
              )
            : null,
      ),
    );
  }
}

class MyObservableWidget extends StatefulWidget {
  MyObservableWidget({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => MyObservableWidgetState();
}

class MyObservableWidgetState extends State<MyObservableWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(height: 100.0, color: Colors.green);
  }
}

class ContainerWithBorder extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(border: Border.all(), color: Colors.white),
    );
  }
}
