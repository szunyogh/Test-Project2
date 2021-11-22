import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:test_project/src/models/album_model.dart';
import 'package:test_project/src/models/artist_model.dart';
import 'package:test_project/src/theme/custom_theme.dart';
import 'package:test_project/src/ui/widgets/details/webview_widget.dart';
import 'package:url_launcher/url_launcher.dart';

class DetailsBody extends StatelessWidget {
  final String title;
  final String subtitle;
  final String url;
  const DetailsBody(
      {Key? key,
      required this.title,
      required this.subtitle,
      required this.url})
      : super(key: key);

  Future<void> _launchInBrowser(String url) async {
    if (await canLaunch(url)) {
      await launch(
        url,
        forceSafariVC: false,
        forceWebView: false,
        headers: <String, String>{'my_header_key': 'my_header_value'},
      );
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: AppTheme.textTheme.bodyText1,
            ),
            const SizedBox(height: 10),
            Text(subtitle),
            const SizedBox(height: 10),
            Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    child: Text(
                      'Link: $url',
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        color: Colors.blue,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                    onTap: () {
                      _launchInBrowser(url);
                    },
                  ),
                ),
                const SizedBox(width: 10),
                TextButton(
                  onPressed: () {
                    Clipboard.setData(ClipboardData(text: url)).then((_) {
                      Scaffold.of(context).showSnackBar(const SnackBar(
                          content: Text("Successfully copied to clipboard!")));
                    });
                  },
                  child: const Text("copy"),
                )
              ],
            ),
            const SizedBox(height: 20),
            WebViewWidget(url: url),
          ],
        ),
      ),
    );
  }
}
