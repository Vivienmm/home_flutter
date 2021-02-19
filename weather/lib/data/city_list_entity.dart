

import 'package:azlistview/azlistview.dart';
import 'package:weather/json/base/json_convert_content.dart';
import 'package:weather/json/base/json_field.dart';

class CityListEntity with JsonConvert<CityListEntity> {
	@JSONField(name: "A")
	List<CityListum> a;
	@JSONField(name: "B")
	List<CityListum> b;
	@JSONField(name: "C")
	List<CityListum> c;
	@JSONField(name: "D")
	List<CityListum> d;
	@JSONField(name: "E")
	List<CityListum> e;
	@JSONField(name: "F")
	List<CityListum> f;
	@JSONField(name: "G")
	List<CityListum> g;
	@JSONField(name: "H")
	List<CityListum> h;
	@JSONField(name: "J")
	List<CityListum> j;
	@JSONField(name: "K")
	List<CityListum> k;
	@JSONField(name: "L")
	List<CityListum> l;
	@JSONField(name: "M")
	List<CityListum> m;
	@JSONField(name: "N")
	List<CityListum> n;
	@JSONField(name: "P")
	List<CityListum> p;
	@JSONField(name: "Q")
	List<CityListum> q;
	@JSONField(name: "R")
	List<CityListum> r;
	@JSONField(name: "S")
	List<CityListum> s;
	@JSONField(name: "T")
	List<CityListum> t;
	@JSONField(name: "W")
	List<CityListum> w;
	@JSONField(name: "X")
	List<CityListum> x;
	@JSONField(name: "Y")
	List<CityListum> y;
	@JSONField(name: "Z")
	List<CityListum> z;
}

class CityListum extends ISuspensionBean with JsonConvert<CityListum>   {
	String city;
	String pinyin;
	String code;

	CityListum({
		this.city,
		this.code,
		this.pinyin,
	});

	@override
	String getSuspensionTag() => code;
}

class CityListB with JsonConvert<CityListB> {
	String city;
	String pinyin;
	String code;
}

class CityListC with JsonConvert<CityListC> {
	String city;
	String pinyin;
	String code;
}

class CityListD with JsonConvert<CityListD> {
	String city;
	String pinyin;
	String code;
}

class CityListE with JsonConvert<CityListE> {
	String city;
	String pinyin;
	String code;
}

class CityListF with JsonConvert<CityListF> {
	String city;
	String pinyin;
	String code;
}

class CityListG with JsonConvert<CityListG> {
	String city;
	String pinyin;
	String code;
}

class CityListH with JsonConvert<CityListH> {
	String city;
	String pinyin;
	String code;
}

class CityListJ with JsonConvert<CityListJ> {
	String city;
	String pinyin;
	String code;
}

class CityListK with JsonConvert<CityListK> {
	String city;
	String pinyin;
	String code;
}

class CityListL with JsonConvert<CityListL> {
	String city;
	String pinyin;
	String code;
}

class CityListM with JsonConvert<CityListM> {
	String city;
	String pinyin;
	String code;
}

class CityListN with JsonConvert<CityListN> {
	String city;
	String pinyin;
	String code;
}

class CityListP with JsonConvert<CityListP> {
	String city;
	String pinyin;
	String code;
}

class CityListQ with JsonConvert<CityListQ> {
	String city;
	String pinyin;
	String code;
}

class CityListR with JsonConvert<CityListR> {
	String city;
	String pinyin;
	String code;
}

class CityList with JsonConvert<CityList> {
	String city;
	String pinyin;
	String code;
}

class CityListT with JsonConvert<CityListT> {
	String city;
	String pinyin;
	String code;
}

class CityListW with JsonConvert<CityListW> {
	String city;
	String pinyin;
	String code;
}

class CityListX with JsonConvert<CityListX> {
	String city;
	String pinyin;
	String code;
}

class CityListY with JsonConvert<CityListY> {
	String city;
	String pinyin;
	String code;
}

class CityListZ with JsonConvert<CityListZ> {
	String city;
	String pinyin;
	String code;
}
