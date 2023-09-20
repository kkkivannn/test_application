import 'package:flutter/material.dart';
import 'package:test_app/presentation/widget/news_page.dart';

class NewsCardWidget extends StatelessWidget {
  const NewsCardWidget({
    required this.image,
    required this.title,
    required this.nameCompany,
    required this.description,
    super.key,
  });
  final String image;
  final String title;
  final String nameCompany;
  final String description;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => NewsPage(
            nameCompany: nameCompany,
            title: title,
            description: description,
            image: image,
          ),
        ),
      ),
      child: Container(
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(
            width: 2,
            color: const Color(0xffE6E6E6),
          ),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(13),
              child: Image.asset(
                image,
                height: 200,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
              // child: CachedNetworkImage(
              //   height: 200,
              //   width: double.infinity,
              //   fit: BoxFit.cover,
              //   imageUrl: image,
              //   progressIndicatorBuilder: (context, url, downloadProgress) => Center(
              //     child: CircularProgressIndicator(
              //       value: downloadProgress.progress,
              //       valueColor: const AlwaysStoppedAnimation(Color(0xffE6E6E6)),
              //     ),
              //   ),
              //   errorWidget: (context, url, error) => const Icon(Icons.error),
              // ),
            ),
            const SizedBox(
              height: 14,
            ),
            Text(
              title,
              style: const TextStyle(
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
