class ImageService {
// Future<Image> tinypng() async {
//   final bytes = Uint8List.fromList([
//     137, 80, 78, 71, 13, 10, 26, 10, 0, 0, 0, 13, 73, 72, 68, 82, 0, 0, 0,
//     1, 0, 0, 0, 1, 8, 6, 0, 0, 0, 31, 21, 196, 137, 0, 0, 0, 10, 73, 68, 65,
//     84, 120, 156, 99, 0, 1, 0, 0, 5, 0, 1, 13, 10, 45, 180, 0, 0, 0, 0, 73,
//     69, 78, 68, 174, 66, 96, 130 // prevent dartfmt
//   ]);

//   // copy from decodeImageFromList of package:flutter/painting.dart
//   final codec = await instantiateImageCodec(bytes);
//   final frameInfo = await codec.getNextFrame();
//   return frameInfo.image;
// }
// void toImageFile(){
//   Uint8List imageInUnit8List = // store unit8List image here ;
// final tempDir = await getTemporaryDirectory();
// File file = await File('${tempDir.path}/image.png').create();
// file.writeAsBytesSync(imageInUnit8List);
// }
}
