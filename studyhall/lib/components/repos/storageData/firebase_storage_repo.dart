import 'dart:io';
import 'dart:typed_data';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:studyhall/components/storageDomain/storage_repo.dart';

class FirebaseStorageRepo implements StorageRepo {
  final FirebaseStorage storage = FirebaseStorage.instance;

  @override
  Future<String?> uploadProfileImageMobile(String path, String fileName) {
    return _uploadFile(path, fileName, 'profile_images');
  }

  @override
  Future<String?> uploadProfileImageWeb(Uint8List fileBytes, String fileName) {
    return _uploadFileBytes(fileBytes, fileName, 'profile_images');
  }

  //helpers para upload storage

  //mobile file
  Future<String?> _uploadFile(
      String path, String fileName, String folder) async {
    try {
      //get
      final file = File(path);

      //guarda
      final storageRef = storage.ref().child('$folder/$fileName');

      //upload
      final uploadTask = await storageRef.putFile(file);

      //download url
      final downloadUrl = await uploadTask.ref.getDownloadURL();

      return downloadUrl;
    }  catch (e) {
       return null;
    }
  }

  //web bytes
  Future<String?> _uploadFileBytes(
      Uint8List fileBytes, String fileName, String folder) async {
    try {
      //guarda
      final storageRef = storage.ref().child('$folder/$fileName');

      //upload
      final uploadTask = await storageRef.putData(fileBytes);

      //download url
      final downloadUrl = await uploadTask.ref.getDownloadURL();

      return downloadUrl;
    } catch (e) {
      return null;
    }
  }
}