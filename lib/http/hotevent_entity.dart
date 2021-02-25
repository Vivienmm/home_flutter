import 'package:home_flutter/generated/json/base/json_convert_content.dart';
import 'package:home_flutter/generated/json/base/json_field.dart';

class HoteventEntity with JsonConvert<HoteventEntity> {
	@JSONField(name: "event_id")
	String eventId;
	@JSONField(name: "event_name")
	String eventName;
	@JSONField(name: "event_query")
	dynamic eventQuery;
	@JSONField(name: "cover_image")
	String coverImage;
	@JSONField(name: "hot_value")
	String hotValue;
	List<HoteventTvinfo> tvinfo;
}

class HoteventTvinfo with JsonConvert<HoteventTvinfo> {
	String title;
	String url;
	@JSONField(name: "image_url")
	List<String> imageUrl;
	dynamic source;
	@JSONField(name: "short_video_url")
	String shortVideoUrl;
	@JSONField(name: "video_url")
	String videoUrl;
}
