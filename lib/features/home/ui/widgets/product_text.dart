import 'package:bloc_sqflite_caching_data/core/helper/extension.dart';
import 'package:bloc_sqflite_caching_data/core/theming/styles.dart';
import 'package:bloc_sqflite_caching_data/features/home/data/models/products_response.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';

class ProductText extends StatelessWidget {
  final ProductsResponse productsResponse;
  final int index;

  const ProductText(
      {super.key, required this.productsResponse, required this.index});

  @override
  Widget build(BuildContext context) {
    String createAt =
        formatDateString(productsResponse.products[index].createdAt);
    String updateAt =
        formatDateString(productsResponse.products[index].updatedAt);
    final Color textMediumColor = Theme.of(context).textTheme.bodyMedium!.color!;

    return Expanded(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: context.w * 0.04),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(productsResponse.products[index].name,
                style: TextStyles.fontBlackMedium(context,textMediumColor)),
            Text(
              productsResponse.products[index].description,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: TextStyles.fontGreyMedium(context),
            ),
            Gap(context.h * 0.008),
            _dateText(
              context: context,
              created: 'Created',
              date: createAt,
            ),
            Gap(context.h * 0.008),
            _dateText(
              context: context,
              created: 'Last Update',
              date: updateAt,
            ),
            Gap(context.h * 0.009),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: context.w * 0.25,
                  height: context.h * 0.03,
                  decoration: BoxDecoration(
                    color: const Color(0xff375778),
                    borderRadius: BorderRadius.circular(context.w * 0.0100),
                  ),
                  child: Center(
                    child: Text(
                      productsResponse.products[index].category.toUpperCase(),
                      style: TextStyles.fontWhiteMedium(context),
                    ),
                  ),
                ),
                Text(
                  '\$${productsResponse.products[index].price}',
                  style: TextStyles.fontBlackMedium(context,textMediumColor).copyWith(
                    fontSize: context.w * 0.032,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget _dateText({
    required BuildContext context,
    required String created,
    required String date,
  }) {
    final Color textMediumColor = Theme.of(context).textTheme.bodyMedium!.color!;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          created,
          style: TextStyles.fontBlackMedium(context,textMediumColor).copyWith(
            fontSize: context.w * 0.032,
          ),
        ),
        Text(
          date,
          style: TextStyles.fontBlackMedium(context,textMediumColor).copyWith(
            fontSize: context.w * 0.032,
          ),
        ),
      ],
    );
  }
}

String formatDateString(String dateString) {
  // Parse the string into a DateTime object
  DateTime dateTime = DateTime.parse(dateString);

  // Format the DateTime object as desired
  String formattedDateTime = DateFormat('MMMM d, y').format(dateTime);

  return formattedDateTime;
}
