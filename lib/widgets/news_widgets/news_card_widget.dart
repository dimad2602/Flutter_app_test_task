import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:test_task/components/small_text_widget.dart';
import 'package:test_task/models/news_model/news_model.dart';
import 'package:test_task/utils/app_colors.dart';

class NewsCardWidget extends StatelessWidget {
  final NewsModel model;
  final int? maxLinesForName;

  const NewsCardWidget({
    super.key,
    required this.model,
    this.maxLinesForName = 2,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 8),
          child: SmallText(text: model.date, color: AppColors.newsDataColor),
        ),
        const SizedBox(
          height: 8,
        ),
        model.image != null
            ? CachedNetworkImage(
                imageUrl: model.image!,
                height: 150,
                fit: BoxFit.cover,
                imageBuilder: (context, imageProvider) => Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: imageProvider,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                placeholder: (context, url) => Container(
                  alignment: Alignment.center,
                  child: SvgPicture.asset(
                    "lib/assets/images/news_place_holder.svg",
                    height: 150,
                    width: 150,
                  ),
                ),
                errorWidget: (context, url, error) => SvgPicture.asset(
                  "lib/assets/images/news_place_holder.svg",
                  height: 150,
                  width: 150,
                ),
              )
            : const SizedBox.shrink(),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: SmallText(
            text: model.name,
            maxLines: maxLinesForName,
          ),
        ),
      ],
    );
  }
}
