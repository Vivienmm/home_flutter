

import 'package:weather/json/base/json_convert_content.dart';

class HomeFeedEntity with JsonConvert<HomeFeedEntity> {
	int pageNo;
	String pageSize;
	List<HomeFeedEntityInner> toplist;
	String totalCount;
	List<HomeFeedEntityInner> results;
}

class HomeFeedEntityInner with JsonConvert<HomeFeedEntityInner> {
	String dataType;
	String exType;
	String id;
	String imageStyle;
	List<String> pictureList;
	String  pictureNum;
	String publishedAt;
	String sourceName;
	String summary;
	String titleCN;
	String url;
	String videoUrl;
}
