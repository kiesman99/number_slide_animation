import 'package:flutter/material.dart';

/// Each [NumberCol] has the numbers 0-9 stacked inside of a [SingleChildScrollView]
/// via a [ScrollController] the position will be animated to the requested number
class NumberCol extends StatefulWidget {
  /// The number the col should animate to
  final int animateTo;

  /// The [TextStyle] of the number
  final TextStyle textStyle;
  // The [Duration] the animation will take to slide the number into place
  final Duration duration;
  // The curve that is used during the animation
  final Curve curve;

  NumberCol({
    required this.animateTo,
    required this.textStyle,
    required this.duration,
    required this.curve,
  }) : assert(animateTo >= 0 && animateTo < 10);

  @override
  _NumberColState createState() => _NumberColState();
}

class _NumberColState extends State<NumberCol>
    with SingleTickerProviderStateMixin {
  ScrollController? _scrollController;

  double _elementSize = 0.0;

  @override
  void initState() {
    _scrollController = new ScrollController();

    super.initState();

    WidgetsBinding.instance!.addPostFrameCallback((_) {
      _elementSize = _scrollController!.position.maxScrollExtent / 10;
      setState(() {});

      _scrollController!.animateTo(_elementSize * widget.animateTo,
          duration: widget.duration, curve: widget.curve);
    });
  }

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      child: ConstrainedBox(
        constraints: BoxConstraints(maxHeight: _elementSize),
        child: SingleChildScrollView(
          controller: _scrollController,
          child: Column(
            children: List.generate(10, (position) {
              return Text(position.toString(), style: widget.textStyle);
            }),
          ),
        ),
      ),
    );
  }
}
