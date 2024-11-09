import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:studyhall/services/storage/storage_service.dart';

class GalleryPage extends StatefulWidget {
  const GalleryPage({super.key});

  @override
  State<GalleryPage> createState() => _GalleryPageState();
}

class _GalleryPageState extends State<GalleryPage> {
  @override
  void initState() {
    super.initState();

    fetchImages();
  }

  // fetch
  Future<void> fetchImages() async {
    await Provider.of<StorageService>(context, listen: false).fetchImages();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<StorageService>(
      builder: (context, storageService, child) {
        //lista de urls
        final List<String> imageUrls = storageService.imageUrls;

        return Scaffold(
          floatingActionButton: FloatingActionButton(
            onPressed: () => storageService.uploadImage(),
            child: const Icon(Icons.add),
          ),
          body: ListView.builder(
            itemCount: imageUrls.length,
            itemBuilder: (context, index) {
              // imagem especifica
              final String imageUrl = imageUrls[index];

              // post da imagem
              return Image.network(imageUrl);
            },
          ),
        );
      },
    );
  }
}