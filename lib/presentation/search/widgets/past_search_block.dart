import 'package:dbp_flutter_course/presentation/search/widgets/past_search_item_widget.dart';
import 'package:dbp_flutter_course/resources/strings.dart';
import 'package:dbp_flutter_course/widgets/link_text.dart';
import 'package:flutter/material.dart';

class PastSearchBlock extends StatefulWidget {
  const PastSearchBlock({
    required this.pastSearchCities,
    required this.onClearAllTap,
    Key? key,
  }) : super(key: key);

  final List<String> pastSearchCities;
  final VoidCallback onClearAllTap;

  @override
  State<PastSearchBlock> createState() => _PastSearchBlockState();
}

class _PastSearchBlockState extends State<PastSearchBlock> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(
              child: Text(
                Strings.pastSearch,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
                maxLines: 2,
              ),
            ),
            LinkText(
              text: Strings.clearAll,
              onTap: widget.onClearAllTap,
            ),
          ],
        ),
        const SizedBox(height: 16),
        ListView.separated(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: widget.pastSearchCities.length,
          itemBuilder: (context, index) {
            final item = widget.pastSearchCities[index];

            return PastSearchItemWidget(
              city: item,
              onTap: () {},
              onClose: () {},
            );
          },
          separatorBuilder: (_, __) => const SizedBox(height: 8),
        ),
      ],
    );
  }
}
