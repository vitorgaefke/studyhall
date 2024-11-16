import 'dart:io';

import 'package:flutter/material.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';

class StorageService with ChangeNotifier {
  // storage
  final firebaseStorage = FirebaseStorage.instance;
  
  List<String> _imageUrls = [];

  // status carregando
  bool _isLoading = false;  //read

  // status upload
  bool _isUploading = false;

  // GETTERS

  List<String> get imageUrls => _imageUrls;
  bool get isLoading => _isLoading;
  bool get isUploading => _isUploading;

  // READ

  Future<void> fetchImages() async {
    _isLoading = true;

    final ListResult result =
      await firebaseStorage.ref('galeria/').listAll();

    final urls =
      await Future.wait(result.items.map((ref) => ref.getDownloadURL()));
    
    _imageUrls = urls;

    _isLoading = false;

    notifyListeners();
  }

  // DELETE

  Future<void> deleteImages(String imageUrl) async {
    try {
      _imageUrls.remove(imageUrl);

      final String path = extractPathFromUrl(imageUrl);
      await firebaseStorage.ref(path).delete();
    }
    catch (e) {
      print("Erro ao excluir: $e");
    }

    notifyListeners();
  }

  String extractPathFromUrl(String url) {
    Uri uri = Uri.parse(url);

    String encodedPath = uri.pathSegments.last;

    return Uri.decodeComponent(encodedPath);
  }

  // UPLOAD

  Future<void> uploadImage() async {
    _isUploading = true;
    notifyListeners();

    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);

    if (image == null) return;

    File file = File(image.path);

    try {
      String filePath = 'galeria/${DateTime.now()}.png';

      await firebaseStorage.ref(filePath).putFile(file);

      String downloadUrl = await firebaseStorage.ref(filePath).getDownloadURL();

      _imageUrls.add(downloadUrl);
      notifyListeners();
    }

    catch (e) {
      print("Erro: $e");
    } finally {
      _isUploading = false;
      notifyListeners();
    }
  }
}