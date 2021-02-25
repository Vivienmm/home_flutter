import 'package:home_flutter/http/hot_news_entity.dart';

hotNewsEntityFromJson(HotNewsEntity data, Map<String, dynamic> json) {
	if (json['event_name'] != null) {
		data.eventName = json['event_name'].toString();
	}
	if (json['event_query'] != null) {
		data.eventQuery = json['event_query'].toString();
	}
	if (json['hot_value'] != null) {
		data.hotValue = json['hot_value'].toString();
	}
	if (json['hot_value_diff_per'] != null) {
		data.hotValueDiffPer = json['hot_value_diff_per'].toString();
	}
	if (json['keyword'] != null) {
		data.keyword = json['keyword'].toString();
	}
	if (json['flag'] != null) {
		data.flag = json['flag'] is String
				? double.tryParse(json['flag'])
				: json['flag'].toDouble();
	}
	return data;
}

Map<String, dynamic> hotNewsEntityToJson(HotNewsEntity entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['event_name'] = entity.eventName;
	data['event_query'] = entity.eventQuery;
	data['hot_value'] = entity.hotValue;
	data['hot_value_diff_per'] = entity.hotValueDiffPer;
	data['keyword'] = entity.keyword;
	data['flag'] = entity.flag;
	return data;
}