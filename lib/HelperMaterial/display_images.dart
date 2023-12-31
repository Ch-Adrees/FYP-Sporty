// import 'package:flutter/material.dart';
// import 'package:image_picker_plus/image_picker_plus.dart';
//
// class DisplayImages extends StatefulWidget {
//   final List<SelectedByte> selectedBytes;
//   final double aspectRatio;
//   final SelectedImagesDetails details;
//   const DisplayImages({
//     Key? key,
//     required this.details,
//     required this.selectedBytes,
//     required this.aspectRatio,
//   }) : super(key: key);
//
//   @override
//   State<DisplayImages> createState() => _DisplayImagesState();
// }
//
// class _DisplayImagesState extends State<DisplayImages> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(title: const Text('Selected images/videos')),
//         body: ListView.builder(
//         itemBuilder: (context, index) {
//       SelectedByte selectedByte = widget.selectedBytes[index];
//       if (!selectedByte.isThatImage) {
//        // return _DisplayVideo(selectedByte: selectedByte);
//       } else {
//         return SizedBox(
//           width: double.infinity,
//           child: Image.file(selectedByte.selectedFile),
//         );
//       }
//     },
//           itemCount: widget.selectedBytes.length,
//         ),
//     );
//   }
// }