// import 'dart:typed_data';

// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';

// class UploadPostPage extends StatefulWidget {
//   const UploadPostPage({super.key});

//   @override
//   State<UploadPostPage> createState() => _UploadPostPageState();
// }

// class _UploadPostPageState extends State<UploadPostPage> {
//   // mobile pick
//   // PlatformFile? imagePickedFile;

//   // web pick
//   Uint8List? webImage;

//   // text controller legenda
//   final textController = TextEditingController();

//   // selecionar imagem
//   void pickImage() async {
//     // mobile
//     // imagePickedFile = await FilePicker.platform.pickFiles(
//     //   type: FileType.image,
//     // );

//     // web
//     final bytes = await kIsWeb
//         ? ImagePicker().getImage(source: ImageSource.gallery)
//         : null;

//     // atualiza estado
//     setState(() {
//       webImage = bytes;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold();
//   }
// }