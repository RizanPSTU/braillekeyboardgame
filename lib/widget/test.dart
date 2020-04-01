// import 'package:flutter/material.dart';

// Widget test(){
//  return RawGestureDetector(
//               behavior: HitTestBehavior.opaque,
//               gestures: <Type, GestureRecognizerFactory>{
//                 ImmediateMultiDragGestureRecognizer:
//                     GestureRecognizerFactoryWithHandlers<
//                         ImmediateMultiDragGestureRecognizer>(
//                   () => ImmediateMultiDragGestureRecognizer(),
//                   (ImmediateMultiDragGestureRecognizer instance) {
//                     instance..onStart = _handleOnStart;
//                   },
//                 ),
//               },
//     Drag _handleOnStart(Offset position) {
//    if (count < 1) {
//      setState(() {
//        count++;
//      });
//      return _DragHandler(_handleDragUpdate, _handleDragEnd);
// }
// return null;
//   }

//   void _handleDragUpdate(DragUpdateDetails update) {
//     //code is here
//   }

//   void _handleDragEnd(DragEndDetails details) {
//     //code is here
//    }
//    setState(() {
//     count = 0;
//    });
//    }

//    class _DragHandler extends Drag {
//   _DragHandler(this.onUpdate, this.onEnd);

//   final GestureDragUpdateCallback onUpdate;
//   final GestureDragEndCallback onEnd;

//   @override
//   void update(DragUpdateDetails details) {
//    onUpdate(details);
//   }

//   @override
//   void end(DragEndDetails details) {
//     onEnd(details);
// }
// @override
// void cancel(){}
// }
// }
