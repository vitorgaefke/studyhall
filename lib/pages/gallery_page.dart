// import 'dart:io';

// import 'package:firebase_core/firebase_core.dart';
// import 'package:firebase_storage/firebase_storage.dart';
// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:provider/provider.dart';
// import 'package:studyhall/services/storage/storage_service.dart';

// class GalleryPage extends StatefulWidget {
//   const GalleryPage({super.key});

//   @override
//   State<GalleryPage> createState() => _GalleryPageState();
// }

// class _GalleryPageState extends State<GalleryPage> {
//   final FirebaseStorage storage = FirebaseStorage.instance;
//   // final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
//   List<Reference> refs = [];
//   List<String> arquivos = [];
//   bool loading = true;
//   bool uploading = false;
//   double total = 0;

//   Future<XFile?> getImage() async {
//     final ImagePicker _picker = ImagePicker();
//     XFile? image = await _picker.pickImage(source: ImageSource.gallery);
//     return image;
//   }

//   Future<UploadTask> upload(String path) async {
//     File file = File(path);
//     try {
//       String ref = 'galeria/img-${DateTime.now().toString()}.png';
//       final storageRef = FirebaseStorage.instance.ref();
//       return storageRef.child(ref).putFile(
//             file,
//             SettableMetadata(
//               cacheControl: "public, max-age=300",
//               contentType: "image/png",
//               customMetadata: {
//                 "user": "123",
//               },
//             ),
//           );
//     } on FirebaseException catch (e) {
//       throw Exception('Erro no upload: ${e.code}');
//     }
//   }

//   pickAndUploadImage() async {
//     XFile? file = await getImage();
//     if (file != null) {
//       UploadTask task = await upload(file.path);

//       task.snapshotEvents.listen((TaskSnapshot snapshot) async {
//         if (snapshot.state == TaskState.running) {
//           setState(() {
//             uploading = true;
//             total = (snapshot.bytesTransferred / snapshot.totalBytes) * 100;
//           });
//         } else if (snapshot.state == TaskState.success) {
//           final photoRef = snapshot.ref;

//           // final newMetadata = SettableMetadata(
//           //   cacheControl: "public, max-age=300",
//           //   contentType: "image/jpeg",
//           // );
//           // await photoRef.updateMetadata(newMetadata);

//           arquivos.add(await photoRef.getDownloadURL());
//           refs.add(photoRef);
//           // final SharedPreferences prefs = await _prefs;
//           // prefs.setStringList('images', arquivos);

//           setState(() => uploading = false);
//         }
//       });
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.grey[300],
//       appBar: AppBar(
//         title: const Text('Galeria'),
//         backgroundColor: Colors.yellow[700],
//         actions: [
//           IconButton(
//             icon: const Icon(Icons.add),
//             onPressed: pickAndUploadImage,
//           )
//         ],
//       ),
//     );
//   }
// }

import 'dart:io';
import 'package:flutter/material.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';

class StoragePage extends StatefulWidget {
  const StoragePage({super.key});

  @override
  State<StoragePage> createState() => _StoragePageState();
}

class _StoragePageState extends State<StoragePage> {
  final FirebaseStorage storage = FirebaseStorage.instance;
  // final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  List<Reference> refs = [];
  List<String> arquivos = [];
  bool loading = true;
  bool uploading = false;
  double total = 0;

  Future<XFile?> getImage() async {
    final ImagePicker picker = ImagePicker();
    XFile? image = await picker.pickImage(source: ImageSource.gallery);
    return image;
  }

  Future<void> upload(String path) async {
    File file = File(path);
    try {
      String ref = 'galeria/img-${DateTime.now().toString()}.jpg';
      await storage.ref(ref).putFile(file);
    } on FirebaseException catch (e) {
      throw Exception('Erro no upload: ${e.code}');
    }
  }

  pickAndUploadImage() async {
    XFile? file = await getImage();
    if (file != null) {
      await upload(file.path);
    }
  }

  @override
  void initState() {
    super.initState();
    loadImages();
  }

  loadImages() async {
    // final SharedPreferences prefs = await _prefs;
    // arquivos = prefs.getStringList('images') ?? [];

    // if (arquivos.isEmpty) {
    refs = (await storage.ref('galeria/').listAll()).items;
    for (var ref in refs) {
      final arquivo = await ref.getDownloadURL();
      arquivos.add(arquivo);
    }
    // prefs.setStringList('images', arquivos);
    // }
    setState(() => loading = false);
  }

  deleteImage(int index) async {
    await storage.ref(refs[index].fullPath).delete();
    arquivos.removeAt(index);
    refs.removeAt(index);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: uploading ? Text('${total.round()}% enviado') : const Text('Galeria'),
        backgroundColor: Colors.yellow[700],
        actions: [
          uploading
              ? const Padding(
                  padding: EdgeInsets.only(right: 12.0),
                  child: Center(
                    child: SizedBox(
                      width: 20.0,
                      height: 20.0,
                      child: CircularProgressIndicator(
                        strokeWidth: 3,
                        color: Colors.white,
                      ),
                    ),
                  ),
                )
              : IconButton(
                  icon: const Icon(Icons.upload),
                  onPressed: pickAndUploadImage,
                )
        ],
        elevation: 0,
      ),
      body: loading
          ? const Center(child: CircularProgressIndicator())
          : Padding(
              padding: const EdgeInsets.all(24.0),
              child: arquivos.isEmpty
                  ? const Center(child: Text('Não há imagens ainda.'))
                  : ListView.builder(
                      itemBuilder: (BuildContext context, index) {
                        return ListTile(
                          leading: SizedBox(
                            width: 60,
                            height: 60,
                            child: Image.network(
                              arquivos[index],
                              fit: BoxFit.cover,
                            ),
                          ),
                          title: const Text('Quadro Eng 3 08.11'),
                          trailing: IconButton(
                            icon: const Icon(Icons.delete),
                            onPressed: () => deleteImage(index),
                          ),
                        );
                      },
                      itemCount: arquivos.length,
                    ),
            ),
    );
  }
}