import 'package:youtube_explode_dart/youtube_explode_dart.dart';
import 'dart:io';
import 'package:path_provider/path_provider.dart';

class DownloadUtil {
  static Future<void> downloadVideo(String videoId, String resolution) async {
    var yt = YoutubeExplode();

    try {
      // Get the video metadata.
      var video = await yt.videos.get('https://www.youtube.com/watch?v=$videoId');

      // Get the stream manifest.
      var manifest = await yt.videos.streamsClient.getManifest(video.id);

      // Get the audio and video streams based on the resolution.
      var streams = manifest.muxed;
      var streamInfo = streams.firstWhere((element) => element.videoQualityLabel == resolution);

      // Get the directory to save the video.
      var directory = await getApplicationDocumentsDirectory();
      var savePath = '${directory.path}/${video.title}.mp4';

      // Open a file to write the video.
      var file = File(savePath);
      var fileStream = file.openWrite();

      // Download the video.
      var videoStream = yt.videos.streamsClient.get(streamInfo);
      await videoStream.pipe(fileStream);

      // Close the file.
      await fileStream.flush();
      await fileStream.close();

      print('Download completed: $savePath');
    } catch (e) {
      print('An error occurred: $e');
    } finally {
      // Close the YoutubeExplode's http client.
      yt.close();
    }
  }
}
