import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

/// Type for a function that creates video widgets.
typedef VideoBuilder = Widget Function(Uri uri, double? width, double? height);

/// A default video builder handling http/https, resource, and file URLs.
// ignore: prefer_function_declarations_over_variables
final VideoBuilder _kDefaultVideoBuilder = (
  Uri uri,
  double? width,
  double? height,
) {
  return YoutubePlayer(
    controller:
        YoutubePlayerController(initialVideoId: uri.toString().split('=').last),
    showVideoProgressIndicator: true,
  );
};

bool shouldRenderVideo(String path) => path.startsWith('!');

Widget buildVideo(String path, double? width, double? height) {
  path = path.substring(1);
  final Uri uri = Uri.parse(path);
  return _kDefaultVideoBuilder(uri, width, height);
}
