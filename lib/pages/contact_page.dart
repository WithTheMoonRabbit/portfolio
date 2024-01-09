import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactPage extends StatelessWidget {
  const ContactPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        SizedBox(height: 70),
        CustomContainer(
          height: 180,
          url: 'https://github.com/WithTheMoonRabbit',
          text: 'Github',
          child: Lottie.network(
            'https://lottie.host/1b6a6102-2a08-4eb7-9df9-0778ab4b0ab7/O6v0xH7ypw.json',
          ),
        ),
        SizedBox(height: 20),
        CustomContainer(
          height: 180,
          url: 'https://withthemoonrabbit.notion.site/14695055007148639d0d0d63a0d801c7?pvs=4',
          text: 'Notion',
          child: Image.asset('assets/images/notion_logo.png'),
        ),
        SizedBox(height: 20),
        CustomContainer(
          height: 180,
          url: 'mailto:201844087@itc.ac.kr',
          text: 'Email',
          child: Lottie.network(
            'https://lottie.host/01746263-6188-4fac-afc0-82e1439c4bfa/M4iYe5TSli.json',
          ),
        )
      ],
    );
  }
}


class CustomContainer extends StatelessWidget {
  final double height;
  final Widget child;
  final String url;
  final String text;

  CustomContainer({required this.height, required this.child, required this.url, required this.text});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        if (!await launchUrl(Uri.parse(url))) {
          throw Exception('Could not launch $url');
        }
      },
      child: Card(
        elevation: 0,
        color: Colors.white, // 흰색 배경 적용
        child: Row(
          children: <Widget>[
            SizedBox(
              height: height,
              child: child,
            ),
            SizedBox(width: 25), // 이미지와 텍스트 사이 간격 조정
            Text(
              text,
              style: TextStyle(
                color: Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
