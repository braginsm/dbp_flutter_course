import 'package:dash_kit_core/dash_kit_core.dart';
import 'package:dbp_flutter_course/features/geolocation/actions/get_geolocation_action.dart';
import 'package:dbp_flutter_course/models/weather_day.dart';
import 'package:dbp_flutter_course/navigation/app_router.dart';
import 'package:dbp_flutter_course/presentation/home/widgets/weather_days_list.dart';
import 'package:dbp_flutter_course/presentation/home/widgets/weather_today.dart';
import 'package:dbp_flutter_course/presentation/search/search_page.dart';
import 'package:dbp_flutter_course/resources/images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    Key? key,
  }) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  final _chosenCity = ValueNotifier('Cupertino');
  late WeatherDay currentWeatherDay;
  final weatherDays = [
    WeatherDay(
      locationName: 'Cupertino',
      degrees: '10',
      weatherDescription: '',
      icon: Images.ic01d,
      dayName: 'Monday',
    ),
    WeatherDay(
      locationName: 'Cupertino',
      degrees: '15',
      weatherDescription: '',
      icon: Images.ic01d,
      dayName: 'Tuesday',
    ),
    WeatherDay(
      locationName: 'Cupertino',
      degrees: '14',
      weatherDescription: '',
      icon: Images.ic02d,
      dayName: 'Wednesday',
    ),
    WeatherDay(
      locationName: 'Cupertino',
      degrees: '14',
      weatherDescription: '40%',
      icon: Images.ic09d,
      dayName: 'Thursday',
    ),
  ];

  List<String> pastSearchCities = ['Moscow', 'New York City'];

  late AnimationController _animationController;
  late Animation<double> _curve;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    currentWeatherDay = WeatherDay(
      locationName: _chosenCity.value,
      degrees: '12',
      weatherDescription: 'Sunny and bright',
      icon: Images.ic01d,
      dayName: '',
    );

    _initAnimation();
  }

  void _initAnimation() {
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1200),
    );
    _curve = CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeOut,
    );
    _animation = Tween<double>(begin: 0, end: 8).animate(_curve)
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          _animationController.reverse();
        } else if (status == AnimationStatus.dismissed) {
          _animationController.forward();
        }
      });
    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  Future<void> _getGeolocation() async {
    context.dispatch(GetGeolocationAction()).then((_) {
      showSimpleDialog(
        context: context,
        title: 'Success!',
        text: 'Geolocation received',
      );
    }).catchError((error) {
      showSimpleDialog(
        context: context,
        title: 'Oops!',
        text: error.toString(),
      );
    });
  }

  Future<void> showSimpleDialog({
    required BuildContext context,
    required String title,
    required String text,
  }) async {
    showDialog(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        title: Text(
          title,
          style: const TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        content: Text(
          text,
          style: const TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.w300,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: SvgPicture.asset(Images.icLocation),
          onPressed: _getGeolocation,
        ),
        actions: [
          IconButton(
            onPressed: () => appRouter.goTo(
              context: context,
              route: SearchPage(
                pastSearchCities: pastSearchCities,
                chosenCity: _chosenCity,
                onCityChosen: () => setState(() {}),
              ),
            ),
            icon: SvgPicture.asset(Images.icSearch),
          ),
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const SizedBox.shrink(),
          WeatherToday(
            weatherDay: currentWeatherDay,
            animation: _animation,
          ),
          SafeArea(child: WeatherDaysList(weatherDays: weatherDays)),
        ],
      ),
    );
  }
}
