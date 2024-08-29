import 'package:flutter/material.dart';
import 'package:test_task/models/news_model/news_model.dart';
import 'package:test_task/pages/news_page/news_detail_page.dart';
import 'package:test_task/widgets/news_widgets/news_card_widget.dart';

@override
Widget newsCompliteUI(BuildContext context, List<NewsModel> newsList) {
  return ListView.builder(
    itemBuilder: ((context, index) => Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18.0),
          child: Column(
            children: [
              GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => NewsDetailPage(
                          model: newsList[index],
                        ),
                      ),
                    );
                  },
                  child: NewsCardWidget(model: newsList[index])),
              const SizedBox(
                height: 12,
              )
            ],
          ),
        )),
    itemCount: newsList.length,
  );
}
