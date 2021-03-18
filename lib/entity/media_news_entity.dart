import 'package:home_flutter/generated/json/base/json_convert_content.dart';
import 'package:home_flutter/generated/json/base/json_field.dart';

class MediaNewsEntity with JsonConvert<MediaNewsEntity> {
	int status;
	String msg;
	MediaNewsData data;
}

class MediaNewsData with JsonConvert<MediaNewsData> {
	@JSONField(name: "display_result_count")
	int displayResultCount;
	int total;
	bool loadMore;
	int nextIndex;
	List<dynamic> correctionResults;
	String advLeftHtml;
	bool hasAdvInfo;
	List<MediaNewsDataData> data;
	MediaNewsDataRelated related;
}

class MediaNewsDataData with JsonConvert<MediaNewsDataData> {
	String snippet;
	String title;
	List<dynamic> reporter;
	String url;
	int timestamp;
	String source;
	int resultType;
	@JSONField(name: "image_list")
	List<String> imageList;
	@JSONField(name: "video_list")
	List<dynamic> videoList;
	@JSONField(name: "radio_list")
	List<dynamic> radioList;
	@JSONField(name: "content_sign")
	String contentSign;
	@JSONField(name: "same_news_num")
	String sameNewsNum;
	String extend;
	String username;
	String edition;
	String icon;
}

class MediaNewsDataRelated with JsonConvert<MediaNewsDataRelated> {
	List<dynamic> result;
	List<dynamic> correction;
}
