import 'package:home_flutter/http/hotevent_entity.dart';

hoteventEntityFromJson(HoteventEntity data, Map<String, dynamic> json) {
	if (json['event_id'] != null) {
		data.eventId = json['event_id'].toString();
	}
	if (json['event_name'] != null) {
		data.eventName = json['event_name'].toString();
	}
	if (json['event_query'] != null) {
		data.eventQuery = json['event_query'];
	}
	if (json['cover_image'] != null) {
		data.coverImage = json['cover_image'].toString();
	}
	if (json['hot_value'] != null) {
		data.hotValue = json['hot_value'].toString();
	}
	if (json['tvinfo'] != null) {
		data.tvinfo = new List<HoteventTvinfo>();
		(json['tvinfo'] as List).forEach((v) {
			data.tvinfo.add(new HoteventTvinfo().fromJson(v));
		});
	}
	return data;
}

Map<String, dynamic> hoteventEntityToJson(HoteventEntity entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['event_id'] = entity.eventId;
	data['event_name'] = entity.eventName;
	data['event_query'] = entity.eventQuery;
	data['cover_image'] = entity.coverImage;
	data['hot_value'] = entity.hotValue;
	if (entity.tvinfo != null) {
		data['tvinfo'] =  entity.tvinfo.map((v) => v.toJson()).toList();
	}
	return data;
}

hoteventTvinfoFromJson(HoteventTvinfo data, Map<String, dynamic> json) {
	if (json['title'] != null) {
		data.title = json['title'].toString();
	}
	if (json['url'] != null) {
		data.url = json['url'].toString();
	}
	if (json['image_url'] != null) {
		data.imageUrl = json['image_url']?.map((v) => v.toString())?.toList()?.cast<String>();
	}
	if (json['source'] != null) {
		data.source = json['source'];
	}
	if (json['short_video_url'] != null) {
		data.shortVideoUrl = json['short_video_url'].toString();
	}
	if (json['video_url'] != null) {
		data.videoUrl = json['video_url'].toString();
	}
	return data;
}

Map<String, dynamic> hoteventTvinfoToJson(HoteventTvinfo entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['title'] = entity.title;
	data['url'] = entity.url;
	data['image_url'] = entity.imageUrl;
	data['source'] = entity.source;
	data['short_video_url'] = entity.shortVideoUrl;
	data['video_url'] = entity.videoUrl;
	return data;
}