import 'package:flutter/material.dart';
import 'package:test_task/components/medium_text_widget.dart';
import 'package:test_task/components/small_text_widget.dart';
import 'package:test_task/models/news_model/news_model.dart';
import 'package:test_task/utils/app_colors.dart';
import 'package:test_task/widgets/news_widgets/news_card_widget.dart';

class NewsDetailPage extends StatelessWidget {
  final NewsModel model;
  const NewsDetailPage({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: MediumText(
          text: model.name,
        ),
        backgroundColor: AppColors.appBarColor,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18.0),
          child: Column(
            children: [
              NewsCardWidget(model: model, maxLinesForName: 10),
              const SizedBox(height: 12),
              SmallText(
                text: model.description ?? "",
                maxLines: 1999,
              ),
              const SizedBox(height: 12),
            ],
          ),
        ),
      ),
    );
  }
}
