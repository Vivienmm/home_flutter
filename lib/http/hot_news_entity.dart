import 'package:home_flutter/generated/json/base/json_convert_content.dart';
import 'package:home_flutter/generated/json/base/json_field.dart';

class HotNewsEntity with JsonConvert<HotNewsEntity> {
	@JSONField(name: "event_name")
	String eventName;
	@JSONField(name: "event_query")
	String eventQuery;
	@JSONField(name: "hot_value")
	String hotValue;
	@JSONField(name: "hot_value_diff_per")
	String hotValueDiffPer;
	String keyword;
	double flag;
}
