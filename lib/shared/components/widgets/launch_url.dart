
import 'package:url_launcher/url_launcher.dart';

Future<void>callingDr({required var tel})async{
  final Uri _url = Uri.parse('tel:${tel}');

  if( !await launchUrl(_url)){

    throw Exception('Could not launch $_url');
  }
}

Future<void>whatsApp({required var whats})async{
  final Uri _url = Uri.parse('whatsapp://send?phone=+2${whats}');

  if( !await launchUrl(_url)){

    throw Exception('Could not launch $_url');
  }
}

String? encodeQueryParameters(Map<String, String> params) {
  return params.entries
      .map((MapEntry<String, String> e) =>
  '${Uri.encodeComponent(e.key)}=${Uri.encodeComponent(e.value)}')
      .join('&');
}

Uri emailLaunchUri ({required var email})=>Uri(
  scheme: 'mailto',
  path: email,
  query: encodeQueryParameters(<String, String>{
    'subject': 'Example Subject & Symbols are allowed!',
  }),
);

