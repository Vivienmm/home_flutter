

import 'package:weather/json/base/json_convert_content.dart';

class FeedDataEntity with JsonConvert<FeedDataEntity> {
	int pageNo;
	int pageSize;
	List<FeedDataResult> toplist;
	int totalCount;
	List<FeedDataResult> results;
}

class FeedDataToplist with JsonConvert<FeedDataToplist> {
	String dataType;
	String exType;
	String id;
	String imageStyle;
	List<String> pictureList;
	int pictureNum;
	String publishedAt;
	String sourceName;
	String summary;
	String titleCN;
	String url;
	String videoUrl;
}

class FeedDataResult with JsonConvert<FeedDataResult> {
	String dataType;
	dynamic exType;
	String id;
	String imageStyle;
	List<String> pictureList;
	int pictureNum;
	String publishedAt;
	String sourceName;
	String summary;
	String titleCN;
	String url;
	String videoUrl;
}
