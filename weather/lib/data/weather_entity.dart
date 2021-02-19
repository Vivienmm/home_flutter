

import 'package:weather/json/base/json_convert_content.dart';
import 'package:weather/json/base/json_filed.dart';

class WeatherEntity with JsonConvert<WeatherEntity> {
	String city;
	String weathercode;
	WeatherReal real;
	WeatherAqiInfo aqiInfo;
}

class WeatherReal with JsonConvert<WeatherReal> {
	String temper;
	String humidity;
	@JSONField(name: "wind_power")
	String windPower;
	@JSONField(name: "wind_direction")
	String windDirection;
	String weather;
	@JSONField(name: "weather_icon")
	List<String> weatherIcon;
	String rainfall;
	String updatetime;
	String value;
}

class WeatherAqiInfo with JsonConvert<WeatherAqiInfo> {
	String value;
	String quality;
}
