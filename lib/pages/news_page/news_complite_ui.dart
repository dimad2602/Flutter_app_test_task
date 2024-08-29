import 'package:flutter/material.dart';
import 'package:test_task/models/news_model/news_model.dart';
import 'package:test_task/widgets/news_widgets/news_card_widget.dart';

@override
Widget newsCompliteUI(BuildContext context, List<NewsModel> newsList) {
  return ListView.builder(
    itemBuilder: ((context, index) => Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18.0),
          child: Column(
            children: [
              NewsCardWidget(model: newsList[index]),
              const SizedBox(
                height: 12,
              )
            ],
          ),
        )),
    itemCount: newsList.length,
  );
}
