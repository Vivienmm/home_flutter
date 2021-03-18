import 'package:home_flutter/entity/media_news_entity.dart';

mediaNewsEntityFromJson(MediaNewsEntity data, Map<String, dynamic> json) {
	if (json['status'] != null) {
		data.status = json['status'] is String
				? int.tryParse(json['status'])
				: json['status'].toInt();
	}
	if (json['msg'] != null) {
		data.msg = json['msg'].toString();
	}
	if (json['data'] != null) {
		data.data = new MediaNewsData().fromJson(json['data']);
	}
	return data;
}

Map<String, dynamic> mediaNewsEntityToJson(MediaNewsEntity entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['status'] = entity.status;
	data['msg'] = entity.msg;
	if (entity.data != null) {
		data['data'] = entity.data.toJson();
	}
	return data;
}

mediaNewsDataFromJson(MediaNewsData data, Map<String, dynamic> json) {
	if (json['display_result_count'] != null) {
		data.displayResultCount = json['display_result_count'] is String
				? int.tryParse(json['display_result_count'])
				: json['display_result_count'].toInt();
	}
	if (json['total'] != null) {
		data.total = json['total'] is String
				? int.tryParse(json['total'])
				: json['total'].toInt();
	}
	if (json['loadMore'] != null) {
		data.loadMore = json['loadMore'];
	}
	if (json['nextIndex'] != null) {
		data.nextIndex = json['nextIndex'] is String
				? int.tryParse(json['nextIndex'])
				: json['nextIndex'].toInt();
	}
	if (json['correctionResults'] != null) {
		data.correctionResults = new List<dynamic>();
		data.correctionResults.addAll(json['correctionResults']);
	}
	if (json['advLeftHtml'] != null) {
		data.advLeftHtml = json['advLeftHtml'].toString();
	}
	if (json['hasAdvInfo'] != null) {
		data.hasAdvInfo = json['hasAdvInfo'];
	}
	if (json['data'] != null) {
		data.data = new List<MediaNewsDataData>();
		(json['data'] as List).forEach((v) {
			data.data.add(new MediaNewsDataData().fromJson(v));
		});
	}
	if (json['related'] != null) {
		data.related = new MediaNewsDataRelated().fromJson(json['related']);
	}
	return data;
}

Map<String, dynamic> mediaNewsDataToJson(MediaNewsData entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['display_result_count'] = entity.displayResultCount;
	data['total'] = entity.total;
	data['loadMore'] = entity.loadMore;
	data['nextIndex'] = entity.nextIndex;
	if (entity.correctionResults != null) {
		data['correctionResults'] =  [];
	}
	data['advLeftHtml'] = entity.advLeftHtml;
	data['hasAdvInfo'] = entity.hasAdvInfo;
	if (entity.data != null) {
		data['data'] =  entity.data.map((v) => v.toJson()).toList();
	}
	if (entity.related != null) {
		data['related'] = entity.related.toJson();
	}
	return data;
}

mediaNewsDataDataFromJson(MediaNewsDataData data, Map<String, dynamic> json) {
	if (json['snippet'] != null) {
		data.snippet = json['snippet'].toString();
	}
	if (json['title'] != null) {
		data.title = json['title'].toString();
	}
	if (json['reporter'] != null) {
		data.reporter = new List<dynamic>();
		data.reporter.addAll(json['reporter']);
	}
	if (json['url'] != null) {
		data.url = json['url'].toString();
	}
	if (json['timestamp'] != null) {
		data.timestamp = json['timestamp'] is String
				? int.tryParse(json['timestamp'])
				: json['timestamp'].toInt();
	}
	if (json['source'] != null) {
		data.source = json['source'].toString();
	}
	if (json['resultType'] != null) {
		data.resultType = json['resultType'] is String
				? int.tryParse(json['resultType'])
				: json['resultType'].toInt();
	}
	if (json['image_list'] != null) {
		data.imageList = json['image_list']?.map((v) => v.toString())?.toList()?.cast<String>();
	}
	if (json['video_list'] != null) {
		data.videoList = new List<dynamic>();
		data.videoList.addAll(json['video_list']);
	}
	if (json['radio_list'] != null) {
		data.radioList = new List<dynamic>();
		data.radioList.addAll(json['radio_list']);
	}
	if (json['content_sign'] != null) {
		data.contentSign = json['content_sign'].toString();
	}
	if (json['same_news_num'] != null) {
		data.sameNewsNum = json['same_news_num'].toString();
	}
	if (json['extend'] != null) {
		data.extend = json['extend'].toString();
	}
	if (json['username'] != null) {
		data.username = json['username'].toString();
	}
	if (json['edition'] != null) {
		data.edition = json['edition'].toString();
	}
	if (json['icon'] != null) {
		data.icon = json['icon'].toString();
	}
	return data;
}

Map<String, dynamic> mediaNewsDataDataToJson(MediaNewsDataData entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['snippet'] = entity.snippet;
	data['title'] = entity.title;
	if (entity.reporter != null) {
		data['reporter'] =  [];
	}
	data['url'] = entity.url;
	data['timestamp'] = entity.timestamp;
	data['source'] = entity.source;
	data['resultType'] = entity.resultType;
	data['image_list'] = entity.imageList;
	if (entity.videoList != null) {
		data['video_list'] =  [];
	}
	if (entity.radioList != null) {
		data['radio_list'] =  [];
	}
	data['content_sign'] = entity.contentSign;
	data['same_news_num'] = entity.sameNewsNum;
	data['extend'] = entity.extend;
	data['username'] = entity.username;
	data['edition'] = entity.edition;
	data['icon'] = entity.icon;
	return data;
}

mediaNewsDataRelatedFromJson(MediaNewsDataRelated data, Map<String, dynamic> json) {
	if (json['result'] != null) {
		data.result = new List<dynamic>();
		data.result.addAll(json['result']);
	}
	if (json['correction'] != null) {
		data.correction = new List<dynamic>();
		data.correction.addAll(json['correction']);
	}
	return data;
}

Map<String, dynamic> mediaNewsDataRelatedToJson(MediaNewsDataRelated entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	if (entity.result != null) {
		data['result'] =  [];
	}
	if (entity.correction != null) {
		data['correction'] =  [];
	}
	return data;
}