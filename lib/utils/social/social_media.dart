import 'package:url_launcher/url_launcher_string.dart';

class SocialMedia {
  final String? subject;
  final String? text;
  final String? urlShare;
  final SocialType type;
  SocialMedia({required this.type, this.subject, this.text, this.urlShare});

  Future share() async {
    final urls = {
      SocialType.facebook:
          "https://www.facebook.com/sharer/sharer.php?u=${Uri.encodeComponent(urlShare!)}&t=$text",
      SocialType.twitter:
          "https://twitter.com/intent/tweet?text=$text&url=${Uri.encodeComponent(urlShare!)}",
      SocialType.linkedin:
          "https://www.linkedin.com/sharing/share-offsite/?url=${Uri.encodeComponent(urlShare!)}&summary=$text"
    };

    final url = urls[type]!;

    if (await canLaunchUrlString(url)) {
      await launchUrlString(url);
    }
  }
}

enum SocialType { facebook, twitter, linkedin }
