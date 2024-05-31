import 'package:dio/dio.dart';
import 'package:path_provider/path_provider.dart';

Future<void> downloadVideo(String url, String fileName) async {
  Dio dio = Dio();
  try {
    var dir = await getApplicationDocumentsDirectory();
    await dio.download(url, "${dir.path}/$fileName.mp4", onReceiveProgress: (rec, total) {
      print("Rec: $rec , Total: $total");
    });
    print("Download completed");
  } catch (e) {
    print(e);
  }
}
