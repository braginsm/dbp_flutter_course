import 'package:dash_kit_core/dash_kit_core.dart';
import 'package:dbp_flutter_course/app/app_state.dart';
import 'package:dbp_flutter_course/core/app_store_connector.dart';
import 'package:dbp_flutter_course/features/weather/actions/clean_weather_search_history_action.dart';
import 'package:dbp_flutter_course/features/weather/actions/get_weather_by_city_name_action.dart';
import 'package:dbp_flutter_course/fixtures/city_items.dart';
import 'package:dbp_flutter_course/navigation/app_router.dart';
import 'package:dbp_flutter_course/presentation/home/widgets/current_location_widget.dart';
import 'package:dbp_flutter_course/presentation/search/widgets/cities_list_item_widget.dart';
import 'package:dbp_flutter_course/presentation/search/widgets/past_search_block.dart';
import 'package:dbp_flutter_course/presentation/search/widgets/search_text_field.dart';
import 'package:dbp_flutter_course/resources/images.dart';
import 'package:dbp_flutter_course/resources/strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/svg.dart';

class SearchPage extends HookWidget {
  const SearchPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = useTextEditingController();
    final focusNode = useFocusNode();
    final hasFocus = useState(false);

    focusNode.addListener(() => hasFocus.value = focusNode.hasFocus);

    void onEditingComplete({
      required BuildContext context,
      required String cityName,
    }) {
      if (cityName.isNotEmpty) {
        context.dispatch(GetWeatherByCityNameAction(cityName: cityName));
        appRouter.goBack(context);
      }
    }

    void onCityItemTap(String city) {
      focusNode.unfocus();

      appRouter.goBack(context);
    }

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: SvgPicture.asset(Images.icClose),
          onPressed: () => appRouter.goBack(context),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: AppStateConnector<AppState>(
          converter: (state) => state,
          builder: (context, state) => Column(
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
                controller: controller,
                focusNode: focusNode,
                onTap: () {},
                onCloseTap: () {
                  controller.clear();
                  focusNode.unfocus();
                },
                onEditingComplete: (value) => onEditingComplete(
                  context: context,
                  cityName: value,
                ),
              ),
              const SizedBox(height: 24),
              if (!focusNode.hasFocus) ...[
                CurrentLocationWidget(
                  city: state.weather.currentCity?.name ?? '',
                  color: const Color(0xFF010E82),
                  onTap: () => appRouter.goBack(context),
                ),
                const SizedBox(height: 24),
                const Divider(),
                const SizedBox(height: 16),
                PastSearchBlock(
                  pastSearchCities: state.weather.searchHistory.toList(),
                  onClearAllTap: () =>
                      context.dispatch(CleanWeatherSearchHistoryAction()),
                ),
              ] else
                Expanded(
                  child: ListView.separated(
                    itemCount: testCities.length,
                    itemBuilder: (_, index) {
                      final item = testCities[index];

                      return CitiesListItemWidget(
                        city: item,
                        onTap: () {
                          context.dispatch(
                            GetWeatherByCityNameAction(cityName: item.name),
                          );
                          onCityItemTap(item.name);
                        },
                      );
                    },
                    separatorBuilder: (_, __) => const Divider(),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
