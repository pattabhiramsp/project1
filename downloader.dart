import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
// import 'package:image_gallery_saver/image_gallery_saver.dart';
// import 'package:permission_handler/permission_handler.dart';

class Download extends StatelessWidget {
  const Download({Key? key}) : super(key: key);
  final uri =
      "https://www.drivespark.com/images/2017-01/kawasaki-ninja-h2-r-13.jpg";
  //   var response = await Dio().get(
  //       "https://ss0.baidu.com/94o3dSag_xI4khGko9WTAnF6hhy/image/h%3D300/sign=a62e824376d98d1069d40a31113eb807/838ba61ea8d3fd1fc9c7b6853a4e251f94ca5f46.jpg",
  //       options: Options(responseType: ResponseType.bytes));
  //   final result = await ImageGallerySaver.saveImage(
  //       Uint8List.fromList(response.data),
  //       quality: 60,
  //       name: "hello");
  //   print(result);
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Download Image"),
      ),
      body: Column(
        children: [
          Image.network(
            uri,
            height: 400,
            fit: BoxFit.fitHeight,
          )
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            //_save();
          },
          label: Icon(Icons.download)),
    );
  }
}
