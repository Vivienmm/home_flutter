import 'package:home_flutter/generated/json/base/json_convert_content.dart';

class MediaEntity with JsonConvert<MediaEntity> {
	int status;
	String msg;
	List<MediaData> data;
	int total;
}

class MediaData with JsonConvert<MediaData> {
	int rank;
	int type;
	String weiboCertificationName;
	String weiboName;
	String weiboIcon;
	String weiboUuid;
	String wechatCertificationName;
	String wechatName;
	String wechatIcon;
	String wechatUuid;
	String dataName;
	String dataCertificationName;
	String dataUuid;
	String dataIcon;
}
