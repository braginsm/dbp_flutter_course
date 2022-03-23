import 'package:dbp_flutter_course/fixtures/city_items.dart';
import 'package:dbp_flutter_course/navigation/app_router.dart';
import 'package:dbp_flutter_course/presentation/home/widgets/current_location_widget.dart';
import 'package:dbp_flutter_course/presentation/search/widgets/cities_list_item_widget.dart';
import 'package:dbp_flutter_course/presentation/search/widgets/past_search_block.dart';
import 'package:dbp_flutter_course/presentation/search/widgets/search_text_field.dart';
import 'package:dbp_flutter_course/resources/images.dart';
import 'package:dbp_flutter_course/resources/strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({
    required this.chosenCity,
    required this.onCityChosen,
    required this.pastSearchCities,
    Key? key,
  }) : super(key: key);

  final ValueNotifier<String> chosenCity;
  final VoidCallback onCityChosen;
  final List<String> pastSearchCities;

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final _controller = TextEditingController();
  final _focusNode = FocusNode();

  void onCityItemTap(String city) {
    setState(() {
      widget.pastSearchCities.add(city);
      widget.chosenCity.value = city;
      _focusNode.unfocus();
    });
    widget.onCityChosen.call();
    appRouter.goBack(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: SvgPicture.asset(Images.icClose),
          onPressed: () => appRouter.goBack(context),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              Strings.getWeather,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 32),
            SearchTextField(
              controller: _controller,
              focusNode: _focusNode,
              onTap: () => setState(() {}),
              onCloseTap: () => setState(() {
                _controller.clear();
                _focusNode.unfocus();
              }),
            ),
            const SizedBox(height: 24),
            if (!_focusNode.hasFocus) ...[
              CurrentLocationWidget(
                city: widget.chosenCity.value,
                color: const Color(0xFF010E82),
                onTap: () => appRouter.goBack(context),
              ),
              const SizedBox(height: 24),
              const Divider(),
              const SizedBox(height: 16),
              PastSearchBlock(
                pastSearchCities: widget.pastSearchCities,
                onClearAllTap: () {
                  setState(() {
                    widget.pastSearchCities.clear();
                  });
                },
              ),
            ] else
              Expanded(
                child: ListView.separated(
                  itemCount: testCities.length,
                  itemBuilder: (context, index) {
                    final item = testCities[index];

                    return CitiesListItemWidget(
                      city: item,
                      onTap: () => onCityItemTap(item.name),
                    );
                  },
                  separatorBuilder: (_, __) => const Divider(),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
