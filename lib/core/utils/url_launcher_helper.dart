import 'package:url_launcher/url_launcher.dart';

abstract final class UrlLauncherHelper {
  static Future<void> launch(String url) async {
    final uri = Uri.parse(url);

    if (!await launchUrl(uri, mode: LaunchMode.platformDefault)) {
      throw Exception('Could not launch $url');
    }
  }
}
