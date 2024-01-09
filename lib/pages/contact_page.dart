import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactPage extends StatelessWidget {
  const ContactPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        const SizedBox(height: 70),
        CustomContainer(
          height: 180,
          url: 'https://github.com/WithTheMoonRabbit',
          text: 'Github',
          child: Lottie.asset('assets/images/logo_img/github_logo.json'),
        ),
        const SizedBox(height: 20),
        CustomContainer(
          height: 180,
          url: 'https://withthemoonrabbit.notion.site/14695055007148639d0d0d63a0d801c7?pvs=4',
          text: 'Notion',
          child: Image.asset('assets/images/logo_img/notion_logo.png'),
        ),
        const SizedBox(height: 20),
        CustomContainer(
          height: 180,
          url: 'mailto:201844087@itc.ac.kr',
          text: 'Email',
          child: Lottie.asset('assets/images/logo_img/email_logo.json'),
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

  const CustomContainer({super.key, required this.height, required this.child, required this.url, required this.text});

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
            const SizedBox(width: 25), // 이미지와 텍스트 사이 간격 조정
            Text(
              text,
              style: const TextStyle(
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
