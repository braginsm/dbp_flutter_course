import 'package:dbp_flutter_course/fixtures/city_items.dart';
import 'package:dbp_flutter_course/models/weather_day.dart';
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
  const SearchPage({required this.weatherDay, Key? key}) : super(key: key);

  final WeatherDay weatherDay;

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final _controller = TextEditingController();
  final _focusNode = FocusNode();
  List<String> pastSearchCities = ['Moscow', 'New York City'];
  String? chosenCity;

  void onCityItemTap(String city) {
    setState(() {
      pastSearchCities.add(city);
      chosenCity = city;
      _focusNode.unfocus();
    });
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
                weatherDay: widget.weatherDay,
                color: const Color(0xFF010E82),
              ),
              const SizedBox(height: 24),
              const Divider(),
              const SizedBox(height: 16),
              PastSearchBlock(
                pastSearchCities: pastSearchCities,
                onClearAllTap: () {
                  setState(() {
                    pastSearchCities.clear();
                  });
                },
              ),
            ] else ...[
              for (var item in testCities) ...[
                CitiesListItemWidget(
                  city: item,
                  onTap: () => onCityItemTap(item.city),
                ),
                const Divider(),
              ]
            ],
          ],
        ),
      ),
    );
  }
}
