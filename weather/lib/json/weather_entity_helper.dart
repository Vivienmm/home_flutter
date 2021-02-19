

import 'package:weather/data/weather_entity.dart';

weatherEntityFromJson(WeatherEntity data, Map<String, dynamic> json) {
	if (json['city'] != null) {
		data.city = json['city'].toString();
	}
	if (json['weathercode'] != null) {
		data.weathercode = json['weathercode'].toString();
	}
	if (json['real'] != null) {
		data.real = new WeatherReal().fromJson(json['real']);
	}
	if (json['aqiInfo'] != null) {
		data.aqiInfo = new WeatherAqiInfo().fromJson(json['aqiInfo']);
	}
	return data;
}

Map<String, dynamic> weatherEntityToJson(WeatherEntity entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['city'] = entity.city;
	data['weathercode'] = entity.weathercode;
	if (entity.real != null) {
		data['real'] = entity.real.toJson();
	}
	if (entity.aqiInfo != null) {
		data['aqiInfo'] = entity.aqiInfo.toJson();
	}
	return data;
}

weatherRealFromJson(WeatherReal data, Map<String, dynamic> json) {
	if (json['temper'] != null) {
		data.temper = json['temper'].toString();
	}
	if (json['humidity'] != null) {
		data.humidity = json['humidity'].toString();
	}
	if (json['wind_power'] != null) {
		data.windPower = json['wind_power'].toString();
	}
	if (json['wind_direction'] != null) {
		data.windDirection = json['wind_direction'].toString();
	}
	if (json['weather'] != null) {
		data.weather = json['weather'].toString();
	}
	if (json['weather_icon'] != null) {
		data.weatherIcon = json['weather_icon']?.map((v) => v.toString())?.toList()?.cast<String>();
	}
	if (json['rainfall'] != null) {
		data.rainfall = json['rainfall'].toString();
	}
	if (json['updatetime'] != null) {
		data.updatetime = json['updatetime'].toString();
	}
	if (json['value'] != null) {
		data.value = json['value'].toString();
	}
	return data;
}

Map<String, dynamic> weatherRealToJson(WeatherReal entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['temper'] = entity.temper;
	data['humidity'] = entity.humidity;
	data['wind_power'] = entity.windPower;
	data['wind_direction'] = entity.windDirection;
	data['weather'] = entity.weather;
	data['weather_icon'] = entity.weatherIcon;
	data['rainfall'] = entity.rainfall;
	data['updatetime'] = entity.updatetime;
	data['value'] = entity.value;
	return data;
}

weatherAqiInfoFromJson(WeatherAqiInfo data, Map<String, dynamic> json) {
	if (json['value'] != null) {
		data.value = json['value'].toString();
	}
	if (json['quality'] != null) {
		data.quality = json['quality'].toString();
	}
	return data;
}

Map<String, dynamic> weatherAqiInfoToJson(WeatherAqiInfo entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['value'] = entity.value;
	data['quality'] = entity.quality;
	return data;
}