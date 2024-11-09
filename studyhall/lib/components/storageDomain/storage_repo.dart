import 'dart:typed_data';

abstract class StorageRepo {
  //mobile -- perfil
  Future<String?> uploadProfileImageMobile(String path, String fileName);

  //mobile -- web
  Future<String?> uploadProfileImageWeb(Uint8List fileBytes, String fileName);
}