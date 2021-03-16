import 'package:home_flutter/entity/media_entity.dart';

mediaEntityFromJson(MediaEntity data, Map<String, dynamic> json) {
	if (json['status'] != null) {
		data.status = json['status'] is String
				? int.tryParse(json['status'])
				: json['status'].toInt();
	}
	if (json['msg'] != null) {
		data.msg = json['msg'].toString();
	}
	if (json['data'] != null) {
		data.data = new List<MediaData>();
		(json['data'] as List).forEach((v) {
			data.data.add(new MediaData().fromJson(v));
		});
	}
	if (json['total'] != null) {
		data.total = json['total'] is String
				? int.tryParse(json['total'])
				: json['total'].toInt();
	}
	return data;
}

Map<String, dynamic> mediaEntityToJson(MediaEntity entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['status'] = entity.status;
	data['msg'] = entity.msg;
	if (entity.data != null) {
		data['data'] =  entity.data.map((v) => v.toJson()).toList();
	}
	data['total'] = entity.total;
	return data;
}

mediaDataFromJson(MediaData data, Map<String, dynamic> json) {
	if (json['rank'] != null) {
		data.rank = json['rank'] is String
				? int.tryParse(json['rank'])
				: json['rank'].toInt();
	}
	if (json['type'] != null) {
		data.type = json['type'] is String
				? int.tryParse(json['type'])
				: json['type'].toInt();
	}
	if (json['weiboCertificationName'] != null) {
		data.weiboCertificationName = json['weiboCertificationName'].toString();
	}
	if (json['weiboName'] != null) {
		data.weiboName = json['weiboName'].toString();
	}
	if (json['weiboIcon'] != null) {
		data.weiboIcon = json['weiboIcon'].toString();
	}
	if (json['weiboUuid'] != null) {
		data.weiboUuid = json['weiboUuid'].toString();
	}
	if (json['wechatCertificationName'] != null) {
		data.wechatCertificationName = json['wechatCertificationName'].toString();
	}
	if (json['wechatName'] != null) {
		data.wechatName = json['wechatName'].toString();
	}
	if (json['wechatIcon'] != null) {
		data.wechatIcon = json['wechatIcon'].toString();
	}
	if (json['wechatUuid'] != null) {
		data.wechatUuid = json['wechatUuid'].toString();
	}
	if (json['dataName'] != null) {
		data.dataName = json['dataName'].toString();
	}
	if (json['dataCertificationName'] != null) {
		data.dataCertificationName = json['dataCertificationName'].toString();
	}
	if (json['dataUuid'] != null) {
		data.dataUuid = json['dataUuid'].toString();
	}
	if (json['dataIcon'] != null) {
		data.dataIcon = json['dataIcon'].toString();
	}
	return data;
}

Map<String, dynamic> mediaDataToJson(MediaData entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['rank'] = entity.rank;
	data['type'] = entity.type;
	data['weiboCertificationName'] = entity.weiboCertificationName;
	data['weiboName'] = entity.weiboName;
	data['weiboIcon'] = entity.weiboIcon;
	data['weiboUuid'] = entity.weiboUuid;
	data['wechatCertificationName'] = entity.wechatCertificationName;
	data['wechatName'] = entity.wechatName;
	data['wechatIcon'] = entity.wechatIcon;
	data['wechatUuid'] = entity.wechatUuid;
	data['dataName'] = entity.dataName;
	data['dataCertificationName'] = entity.dataCertificationName;
	data['dataUuid'] = entity.dataUuid;
	data['dataIcon'] = entity.dataIcon;
	return data;
}