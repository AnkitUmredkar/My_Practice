import 'package:flutter/material.dart';
import 'package:marquee/marquee.dart';

class AnimationExample extends StatefulWidget {
  const AnimationExample({super.key});

  @override
  State<AnimationExample> createState() => _AnimationExampleState();
}

class _AnimationExampleState extends State<AnimationExample>
    with TickerProviderStateMixin {
  late final AnimationController _controller =
      AnimationController(duration: const Duration(seconds: 6), vsync: this)
        ..repeat(reverse: false);

  @override
  void dispose() {
    // TODO: implement dispose
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Animated Builder"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            AnimatedBuilder(
              animation: _controller,
              child: const FlutterLogo(
                size: 100,
              ),
              builder: (context, child) {
                return Transform.translate(
                  offset: Offset(100 * _controller.value, 0),
                  child: child,
                );
              },
            ),
            const SizedBox(height: 60),
            const Draggable(
              feedback: FlutterLogo(size: 100),
              child: FlutterLogo(size: 70),
            ),
            InteractiveViewer(
              maxScale: 500,
              child: const FlutterLogo(size: 100),
            ),
            const SizedBox(height: 30),
            //todo animated scrolling text
            NewsTicker(),
            const SizedBox(height: 30),
            // LogoDragDrop(),//todo imp
            const AnimatedSwitcher(duration: Duration(seconds: 1),)
          ],
        ),
      ),
    );
  }
}

class NewsTicker extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Left-side gradient for fade-in effect
        Align(
          alignment: Alignment.centerLeft,
          child: Container(
            width: 30, // Adjust to control the gradient width
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: [Colors.white, Colors.white.withOpacity(0.0)],
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30.0),
          child: Container(
            width: double.infinity,
            height: 50,
            child: Marquee(
              text:
                  "Breaking News: Flutter makes app development easier than ever!",
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              scrollAxis: Axis.horizontal,
              blankSpace: 50.0,
              // Space between the text repeat
              velocity: 50.0,
              // Control the scrolling speed
              startPadding: 10.0,
              // Padding at start of scroll
              pauseAfterRound: const Duration(seconds: 1),
              // Pause between loops
              accelerationDuration: const Duration(seconds: 1),
              decelerationDuration: const Duration(milliseconds: 500),
              accelerationCurve: Curves.linear,
              decelerationCurve: Curves.easeOut,
            ),
          ),
        ),

        // Right-side gradient for fade-out effect
        Align(
          alignment: Alignment.centerRight,
          child: Container(
            width: 30, // Adjust to control the gradient width
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.centerRight,
                end: Alignment.centerLeft,
                colors: [Colors.white, Colors.white.withOpacity(0.0)],
              ),
            ),
          ),
        ),
      ],
    );
  }
}


class LogoDragDrop extends StatefulWidget {
  @override
  _LogoDragDropState createState() => _LogoDragDropState();
}

class _LogoDragDropState extends State<LogoDragDrop> {
  bool isDropped = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Draggable<String>(
          data: 'Flutter Logo',
          feedback: const FlutterLogo(size: 80),
          childWhenDragging: Container(
            height: 80,
            width: 80,
            color: Colors.grey.shade300,
            child: const Center(child: Text('Dragging...')),
          ),
          child: const FlutterLogo(size: 80),
        ),
        const SizedBox(height: 50),
        DragTarget<String>(
          onMove: (data) {
            setState(() {
              isDropped = true;
            });
          },
          builder: (context, candidateData, rejectedData) {
            return Container(
              height: 150,
              width: 150,
              color: candidateData.isNotEmpty
                  ? Colors.blue.shade100
                  : Colors.grey.shade300,
              child: Center(
                child: isDropped
                    ? const FlutterLogo(size: 80)
                    : const Text('Drop Here', style: TextStyle(fontSize: 18)),
              ),
            );
          },
        ),
      ],
    );
  }
}
