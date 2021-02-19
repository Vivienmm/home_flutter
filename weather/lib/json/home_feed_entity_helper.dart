

import 'package:weather/data/home_feed_entity.dart';

homeFeedEntityFromJson(HomeFeedEntity data, Map<String, dynamic> json) {
	if (json['pageNo'] != null) {
		data.pageNo = json['pageNo'] is String
				? int.tryParse(json['pageNo'])
				: json['pageNo'].toInt();
	}
	if (json['pageSize'] != null) {
		data.pageSize = json['pageSize'].toString();
	}
	if (json['toplist'] != null) {
		data.toplist = new List<HomeFeedEntityInner>();
		(json['toplist'] as List).forEach((v) {
			data.toplist.add(new HomeFeedEntityInner().fromJson(v));
		});
	}
	if (json['totalCount'] != null) {
		data.totalCount = json['totalCount'].toString();
	}
	if (json['results'] != null) {
		data.results = new List<HomeFeedEntityInner>();
		(json['results'] as List).forEach((v) {
			data.results.add(new HomeFeedEntityInner().fromJson(v));
		});
	}
	return data;
}

Map<String, dynamic> homeFeedEntityToJson(HomeFeedEntity entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['pageNo'] = entity.pageNo;
	data['pageSize'] = entity.pageSize;
	if (entity.toplist != null) {
		data['toplist'] =  entity.toplist.map((v) => v.toJson()).toList();
	}
	data['totalCount'] = entity.totalCount;
	if (entity.results != null) {
		data['results'] =  entity.results.map((v) => v.toJson()).toList();
	}
	return data;
}

homeFeedEntityInnerFromJson(HomeFeedEntityInner data, Map<String, dynamic> json) {
	if (json['dataType'] != null) {
		data.dataType = json['dataType'].toString();
	}
	if (json['exType'] != null) {
		data.exType = json['exType'].toString();
	}
	if (json['id'] != null) {
		data.id = json['id'].toString();
	}
	if (json['imageStyle'] != null) {
		data.imageStyle = json['imageStyle'].toString();
	}
	if (json['pictureList'] != null) {
		data.pictureList = json['pictureList']?.map((v) => v.toString())?.toList()?.cast<String>();
	}

	if (json['publishedAt'] != null) {
		data.publishedAt = json['publishedAt'].toString();
	}
	if (json['sourceName'] != null) {
		data.sourceName = json['sourceName'].toString();
	}
	if (json['summary'] != null) {
		data.summary = json['summary'].toString();
	}
	if (json['titleCN'] != null) {
		data.titleCN = json['titleCN'].toString();
	}
	if (json['url'] != null) {
		data.url = json['url'].toString();
	}
	if (json['videoUrl'] != null) {
		data.videoUrl = json['videoUrl'].toString();
	}
	return data;
}

Map<String, dynamic> homeFeedEntityInnerToJson(HomeFeedEntityInner entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['dataType'] = entity.dataType;
	data['exType'] = entity.exType;
	data['id'] = entity.id;
	data['imageStyle'] = entity.imageStyle;
	data['pictureList'] = entity.pictureList;

	data['publishedAt'] = entity.publishedAt;
	data['sourceName'] = entity.sourceName;
	data['summary'] = entity.summary;
	data['titleCN'] = entity.titleCN;
	data['url'] = entity.url;
	data['videoUrl'] = entity.videoUrl;
	return data;
}