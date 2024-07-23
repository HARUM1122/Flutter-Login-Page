// import 'package:flutter/material.dart';


// class CustomButton extends StatelessWidget {
//   final Function() onPressed;
//   const CustomButton({required this.onPressed, super.key});

//   @override
//   Widget build(BuildContext context) {
//     return ElevatedButton(
//       style: ElevatedButton.styleFrom(
//         shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.circular(14)
//         ),
//         backgroundColor: const Color(0xFF000000)
//       ),
//       onPressed: onPressed,
//       child: const Padding(
//         padding: EdgeInsets.all(8),
//         child: Text(
//           "Let's go",
//           style: TextStyle(
//             color: Color(0xFFFFFFFF),
//             fontSize: 26,
//             fontWeight: FontWeight.bold
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';

class CustomButton extends StatefulWidget {
  final double? width;
  final double? height;
  final Color backgroundColor;
  final Color? onPressedColor;
  final Function() onPressed;
  final Widget child;

  const CustomButton({
    this.width,
    this.height,
    required this.backgroundColor,
    this.onPressedColor,
    required this.onPressed,
    required this.child,
    super.key
  });

  @override
  State<CustomButton> createState() => CustomButtonState();
}

class CustomButtonState extends State<CustomButton> with TickerProviderStateMixin{
  double _buttonScale = 1;
  AnimationController? _controller;
  @override
  void initState() {
    _controller = AnimationController(
        vsync: this,
        duration: const Duration(milliseconds: 100),
        lowerBound: 0.0,
        upperBound: 0.04
      )..addListener(() => setState(() {}));
    super.initState();
  }
  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    _buttonScale  = 1 - (_controller?.value ?? 0);
    return Transform.scale(
      scale: _buttonScale,
      child: SizedBox(
        width: widget.width,
        height: widget.height,
        child: Material(
          color: widget.backgroundColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12)
          ),
          child: InkWell(
            borderRadius: BorderRadius.circular(12),
            overlayColor: WidgetStatePropertyAll(widget.onPressedColor ?? widget.backgroundColor),
            splashFactory: NoSplash.splashFactory,
            onTapUp: (_) {
              _controller?.reverse();
              widget.onPressed();
            },
            onTapDown: (_) =>  _controller?.forward(),
            onTapCancel: _controller?.reverse,
            child: widget.child
          ),
        ),
      ),
    );
  }
}