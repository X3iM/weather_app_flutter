import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:weather_app/features/weather/display/controllers/weather_controller.dart';

const UNIT_BOX = 'unit_box';
const UNIT_KEY = 'unit_key';

class UnitsController extends GetxController {
  static const unitsUpdate = 'units_update';

  late Box<String> _unitBox;

  String? _currentUnit;
  String? get currentUnit => _currentUnit;

  @override
  void onInit() {
    super.onInit();

    initStorage();
  }

  Future<UnitsController> initStorage() async {
    _unitBox = await Hive.openBox<String>(UNIT_BOX);
    getUnitFromStorage();
    _getWeatherData();

    return this;
  }

  void getUnitFromStorage() {
    _currentUnit = _unitBox.get(UNIT_KEY) ?? 'metric';
  }

  void _getWeatherData() {
    Get.find<WeatherController>().getWeatherData();
  }

  void setUnit(String? unit) {
    _currentUnit = unit ?? 'metric';
    _unitBox.put(UNIT_KEY, _currentUnit!);

    Get.find<WeatherController>().getWeatherData();
    update([unitsUpdate]);
  }

  @override
  void dispose() {
    super.dispose();

    _unitBox.close();
  }

}