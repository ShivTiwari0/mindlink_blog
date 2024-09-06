import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';
import 'package:mindlink_blog/core/ui.dart';
import 'package:mindlink_blog/data/model/text_news_model.dart';

class TextDetails extends StatelessWidget {
  final TextNewsModel textNewsModel;

  const TextDetails({super.key, required this.textNewsModel});

  static const routeName = "TextDetails";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(textNewsModel.author ?? "Not Reaveled"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              textNewsModel.title,
              style: TextStyles.heading2,
            ),
            const SizedBox(
              height: 16,
            ),
            Text(
              textNewsModel.description ?? "",
              style: TextStyles.heading3,
            ),
            const SizedBox(
              height: 16,
            ),
            // CachedNetworkImage(
            //           width: context.width() * 0.9,
            //           imageUrl: textNewsModel.urlToImage!,
            //         ),
            Text(
              textNewsModel.content ?? "",
              style: TextStyles.body1,
            ),
          ],
        ),
      ),
    );
  }
}
