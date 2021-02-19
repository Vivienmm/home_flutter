import 'package:weather/city_list_entity.dart';


cityListEntityFromJson(CityListEntity data, Map<String, dynamic> json) {
	if (json['A'] != null) {
		data.a = new List<CityListum>();
		(json['A'] as List).forEach((v) {
			data.a.add(new CityListum().fromJson(v));
		});
	}
	if (json['B'] != null) {
		data.b = new List<CityListB>();
		(json['B'] as List).forEach((v) {
			data.b.add(new CityListB().fromJson(v));
		});
	}
	if (json['C'] != null) {
		data.c = new List<CityListC>();
		(json['C'] as List).forEach((v) {
			data.c.add(new CityListC().fromJson(v));
		});
	}
	if (json['D'] != null) {
		data.d = new List<CityListD>();
		(json['D'] as List).forEach((v) {
			data.d.add(new CityListD().fromJson(v));
		});
	}
	if (json['E'] != null) {
		data.e = new List<CityListE>();
		(json['E'] as List).forEach((v) {
			data.e.add(new CityListE().fromJson(v));
		});
	}
	if (json['F'] != null) {
		data.f = new List<CityListF>();
		(json['F'] as List).forEach((v) {
			data.f.add(new CityListF().fromJson(v));
		});
	}
	if (json['G'] != null) {
		data.g = new List<CityListG>();
		(json['G'] as List).forEach((v) {
			data.g.add(new CityListG().fromJson(v));
		});
	}
	if (json['H'] != null) {
		data.h = new List<CityListH>();
		(json['H'] as List).forEach((v) {
			data.h.add(new CityListH().fromJson(v));
		});
	}
	if (json['J'] != null) {
		data.j = new List<CityListJ>();
		(json['J'] as List).forEach((v) {
			data.j.add(new CityListJ().fromJson(v));
		});
	}
	if (json['K'] != null) {
		data.k = new List<CityListK>();
		(json['K'] as List).forEach((v) {
			data.k.add(new CityListK().fromJson(v));
		});
	}
	if (json['L'] != null) {
		data.l = new List<CityListL>();
		(json['L'] as List).forEach((v) {
			data.l.add(new CityListL().fromJson(v));
		});
	}
	if (json['M'] != null) {
		data.m = new List<CityListM>();
		(json['M'] as List).forEach((v) {
			data.m.add(new CityListM().fromJson(v));
		});
	}
	if (json['N'] != null) {
		data.n = new List<CityListN>();
		(json['N'] as List).forEach((v) {
			data.n.add(new CityListN().fromJson(v));
		});
	}
	if (json['P'] != null) {
		data.p = new List<CityListP>();
		(json['P'] as List).forEach((v) {
			data.p.add(new CityListP().fromJson(v));
		});
	}
	if (json['Q'] != null) {
		data.q = new List<CityListQ>();
		(json['Q'] as List).forEach((v) {
			data.q.add(new CityListQ().fromJson(v));
		});
	}
	if (json['R'] != null) {
		data.r = new List<CityListR>();
		(json['R'] as List).forEach((v) {
			data.r.add(new CityListR().fromJson(v));
		});
	}
	if (json['S'] != null) {
		data.s = new List<CityList>();
		(json['S'] as List).forEach((v) {
			data.s.add(new CityList().fromJson(v));
		});
	}
	if (json['T'] != null) {
		data.t = new List<CityListT>();
		(json['T'] as List).forEach((v) {
			data.t.add(new CityListT().fromJson(v));
		});
	}
	if (json['W'] != null) {
		data.w = new List<CityListW>();
		(json['W'] as List).forEach((v) {
			data.w.add(new CityListW().fromJson(v));
		});
	}
	if (json['X'] != null) {
		data.x = new List<CityListX>();
		(json['X'] as List).forEach((v) {
			data.x.add(new CityListX().fromJson(v));
		});
	}
	if (json['Y'] != null) {
		data.y = new List<CityListY>();
		(json['Y'] as List).forEach((v) {
			data.y.add(new CityListY().fromJson(v));
		});
	}
	if (json['Z'] != null) {
		data.z = new List<CityListZ>();
		(json['Z'] as List).forEach((v) {
			data.z.add(new CityListZ().fromJson(v));
		});
	}
	return data;
}

Map<String, dynamic> cityListEntityToJson(CityListEntity entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	if (entity.a != null) {
		data['A'] =  entity.a.map((v) => v.toJson()).toList();
	}
	if (entity.b != null) {
		data['B'] =  entity.b.map((v) => v.toJson()).toList();
	}
	if (entity.c != null) {
		data['C'] =  entity.c.map((v) => v.toJson()).toList();
	}
	if (entity.d != null) {
		data['D'] =  entity.d.map((v) => v.toJson()).toList();
	}
	if (entity.e != null) {
		data['E'] =  entity.e.map((v) => v.toJson()).toList();
	}
	if (entity.f != null) {
		data['F'] =  entity.f.map((v) => v.toJson()).toList();
	}
	if (entity.g != null) {
		data['G'] =  entity.g.map((v) => v.toJson()).toList();
	}
	if (entity.h != null) {
		data['H'] =  entity.h.map((v) => v.toJson()).toList();
	}
	if (entity.j != null) {
		data['J'] =  entity.j.map((v) => v.toJson()).toList();
	}
	if (entity.k != null) {
		data['K'] =  entity.k.map((v) => v.toJson()).toList();
	}
	if (entity.l != null) {
		data['L'] =  entity.l.map((v) => v.toJson()).toList();
	}
	if (entity.m != null) {
		data['M'] =  entity.m.map((v) => v.toJson()).toList();
	}
	if (entity.n != null) {
		data['N'] =  entity.n.map((v) => v.toJson()).toList();
	}
	if (entity.p != null) {
		data['P'] =  entity.p.map((v) => v.toJson()).toList();
	}
	if (entity.q != null) {
		data['Q'] =  entity.q.map((v) => v.toJson()).toList();
	}
	if (entity.r != null) {
		data['R'] =  entity.r.map((v) => v.toJson()).toList();
	}
	if (entity.s != null) {
		data['S'] =  entity.s.map((v) => v.toJson()).toList();
	}
	if (entity.t != null) {
		data['T'] =  entity.t.map((v) => v.toJson()).toList();
	}
	if (entity.w != null) {
		data['W'] =  entity.w.map((v) => v.toJson()).toList();
	}
	if (entity.x != null) {
		data['X'] =  entity.x.map((v) => v.toJson()).toList();
	}
	if (entity.y != null) {
		data['Y'] =  entity.y.map((v) => v.toJson()).toList();
	}
	if (entity.z != null) {
		data['Z'] =  entity.z.map((v) => v.toJson()).toList();
	}
	return data;
}

cityListumFromJson(CityListum data, Map<String, dynamic> json) {
	if (json['city'] != null) {
		data.city = json['city'].toString();
	}
	if (json['pinyin'] != null) {
		data.pinyin = json['pinyin'].toString();
	}
	if (json['code'] != null) {
		data.code = json['code'].toString();
	}
	return data;
}

Map<String, dynamic> cityListumToJson(CityListum entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['city'] = entity.city;
	data['pinyin'] = entity.pinyin;
	data['code'] = entity.code;
	return data;
}

cityListBFromJson(CityListB data, Map<String, dynamic> json) {
	if (json['city'] != null) {
		data.city = json['city'].toString();
	}
	if (json['pinyin'] != null) {
		data.pinyin = json['pinyin'].toString();
	}
	if (json['code'] != null) {
		data.code = json['code'].toString();
	}
	return data;
}

Map<String, dynamic> cityListBToJson(CityListB entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['city'] = entity.city;
	data['pinyin'] = entity.pinyin;
	data['code'] = entity.code;
	return data;
}

cityListCFromJson(CityListC data, Map<String, dynamic> json) {
	if (json['city'] != null) {
		data.city = json['city'].toString();
	}
	if (json['pinyin'] != null) {
		data.pinyin = json['pinyin'].toString();
	}
	if (json['code'] != null) {
		data.code = json['code'].toString();
	}
	return data;
}

Map<String, dynamic> cityListCToJson(CityListC entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['city'] = entity.city;
	data['pinyin'] = entity.pinyin;
	data['code'] = entity.code;
	return data;
}

cityListDFromJson(CityListD data, Map<String, dynamic> json) {
	if (json['city'] != null) {
		data.city = json['city'].toString();
	}
	if (json['pinyin'] != null) {
		data.pinyin = json['pinyin'].toString();
	}
	if (json['code'] != null) {
		data.code = json['code'].toString();
	}
	return data;
}

Map<String, dynamic> cityListDToJson(CityListD entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['city'] = entity.city;
	data['pinyin'] = entity.pinyin;
	data['code'] = entity.code;
	return data;
}

cityListEFromJson(CityListE data, Map<String, dynamic> json) {
	if (json['city'] != null) {
		data.city = json['city'].toString();
	}
	if (json['pinyin'] != null) {
		data.pinyin = json['pinyin'].toString();
	}
	if (json['code'] != null) {
		data.code = json['code'].toString();
	}
	return data;
}

Map<String, dynamic> cityListEToJson(CityListE entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['city'] = entity.city;
	data['pinyin'] = entity.pinyin;
	data['code'] = entity.code;
	return data;
}

cityListFFromJson(CityListF data, Map<String, dynamic> json) {
	if (json['city'] != null) {
		data.city = json['city'].toString();
	}
	if (json['pinyin'] != null) {
		data.pinyin = json['pinyin'].toString();
	}
	if (json['code'] != null) {
		data.code = json['code'].toString();
	}
	return data;
}

Map<String, dynamic> cityListFToJson(CityListF entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['city'] = entity.city;
	data['pinyin'] = entity.pinyin;
	data['code'] = entity.code;
	return data;
}

cityListGFromJson(CityListG data, Map<String, dynamic> json) {
	if (json['city'] != null) {
		data.city = json['city'].toString();
	}
	if (json['pinyin'] != null) {
		data.pinyin = json['pinyin'].toString();
	}
	if (json['code'] != null) {
		data.code = json['code'].toString();
	}
	return data;
}

Map<String, dynamic> cityListGToJson(CityListG entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['city'] = entity.city;
	data['pinyin'] = entity.pinyin;
	data['code'] = entity.code;
	return data;
}

cityListHFromJson(CityListH data, Map<String, dynamic> json) {
	if (json['city'] != null) {
		data.city = json['city'].toString();
	}
	if (json['pinyin'] != null) {
		data.pinyin = json['pinyin'].toString();
	}
	if (json['code'] != null) {
		data.code = json['code'].toString();
	}
	return data;
}

Map<String, dynamic> cityListHToJson(CityListH entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['city'] = entity.city;
	data['pinyin'] = entity.pinyin;
	data['code'] = entity.code;
	return data;
}

cityListJFromJson(CityListJ data, Map<String, dynamic> json) {
	if (json['city'] != null) {
		data.city = json['city'].toString();
	}
	if (json['pinyin'] != null) {
		data.pinyin = json['pinyin'].toString();
	}
	if (json['code'] != null) {
		data.code = json['code'].toString();
	}
	return data;
}

Map<String, dynamic> cityListJToJson(CityListJ entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['city'] = entity.city;
	data['pinyin'] = entity.pinyin;
	data['code'] = entity.code;
	return data;
}

cityListKFromJson(CityListK data, Map<String, dynamic> json) {
	if (json['city'] != null) {
		data.city = json['city'].toString();
	}
	if (json['pinyin'] != null) {
		data.pinyin = json['pinyin'].toString();
	}
	if (json['code'] != null) {
		data.code = json['code'].toString();
	}
	return data;
}

Map<String, dynamic> cityListKToJson(CityListK entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['city'] = entity.city;
	data['pinyin'] = entity.pinyin;
	data['code'] = entity.code;
	return data;
}

cityListLFromJson(CityListL data, Map<String, dynamic> json) {
	if (json['city'] != null) {
		data.city = json['city'].toString();
	}
	if (json['pinyin'] != null) {
		data.pinyin = json['pinyin'].toString();
	}
	if (json['code'] != null) {
		data.code = json['code'].toString();
	}
	return data;
}

Map<String, dynamic> cityListLToJson(CityListL entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['city'] = entity.city;
	data['pinyin'] = entity.pinyin;
	data['code'] = entity.code;
	return data;
}

cityListMFromJson(CityListM data, Map<String, dynamic> json) {
	if (json['city'] != null) {
		data.city = json['city'].toString();
	}
	if (json['pinyin'] != null) {
		data.pinyin = json['pinyin'].toString();
	}
	if (json['code'] != null) {
		data.code = json['code'].toString();
	}
	return data;
}

Map<String, dynamic> cityListMToJson(CityListM entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['city'] = entity.city;
	data['pinyin'] = entity.pinyin;
	data['code'] = entity.code;
	return data;
}

cityListNFromJson(CityListN data, Map<String, dynamic> json) {
	if (json['city'] != null) {
		data.city = json['city'].toString();
	}
	if (json['pinyin'] != null) {
		data.pinyin = json['pinyin'].toString();
	}
	if (json['code'] != null) {
		data.code = json['code'].toString();
	}
	return data;
}

Map<String, dynamic> cityListNToJson(CityListN entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['city'] = entity.city;
	data['pinyin'] = entity.pinyin;
	data['code'] = entity.code;
	return data;
}

cityListPFromJson(CityListP data, Map<String, dynamic> json) {
	if (json['city'] != null) {
		data.city = json['city'].toString();
	}
	if (json['pinyin'] != null) {
		data.pinyin = json['pinyin'].toString();
	}
	if (json['code'] != null) {
		data.code = json['code'].toString();
	}
	return data;
}

Map<String, dynamic> cityListPToJson(CityListP entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['city'] = entity.city;
	data['pinyin'] = entity.pinyin;
	data['code'] = entity.code;
	return data;
}

cityListQFromJson(CityListQ data, Map<String, dynamic> json) {
	if (json['city'] != null) {
		data.city = json['city'].toString();
	}
	if (json['pinyin'] != null) {
		data.pinyin = json['pinyin'].toString();
	}
	if (json['code'] != null) {
		data.code = json['code'].toString();
	}
	return data;
}

Map<String, dynamic> cityListQToJson(CityListQ entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['city'] = entity.city;
	data['pinyin'] = entity.pinyin;
	data['code'] = entity.code;
	return data;
}

cityListRFromJson(CityListR data, Map<String, dynamic> json) {
	if (json['city'] != null) {
		data.city = json['city'].toString();
	}
	if (json['pinyin'] != null) {
		data.pinyin = json['pinyin'].toString();
	}
	if (json['code'] != null) {
		data.code = json['code'].toString();
	}
	return data;
}

Map<String, dynamic> cityListRToJson(CityListR entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['city'] = entity.city;
	data['pinyin'] = entity.pinyin;
	data['code'] = entity.code;
	return data;
}

cityListFromJson(CityList data, Map<String, dynamic> json) {
	if (json['city'] != null) {
		data.city = json['city'].toString();
	}
	if (json['pinyin'] != null) {
		data.pinyin = json['pinyin'].toString();
	}
	if (json['code'] != null) {
		data.code = json['code'].toString();
	}
	return data;
}

Map<String, dynamic> cityListToJson(CityList entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['city'] = entity.city;
	data['pinyin'] = entity.pinyin;
	data['code'] = entity.code;
	return data;
}

cityListTFromJson(CityListT data, Map<String, dynamic> json) {
	if (json['city'] != null) {
		data.city = json['city'].toString();
	}
	if (json['pinyin'] != null) {
		data.pinyin = json['pinyin'].toString();
	}
	if (json['code'] != null) {
		data.code = json['code'].toString();
	}
	return data;
}

Map<String, dynamic> cityListTToJson(CityListT entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['city'] = entity.city;
	data['pinyin'] = entity.pinyin;
	data['code'] = entity.code;
	return data;
}

cityListWFromJson(CityListW data, Map<String, dynamic> json) {
	if (json['city'] != null) {
		data.city = json['city'].toString();
	}
	if (json['pinyin'] != null) {
		data.pinyin = json['pinyin'].toString();
	}
	if (json['code'] != null) {
		data.code = json['code'].toString();
	}
	return data;
}

Map<String, dynamic> cityListWToJson(CityListW entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['city'] = entity.city;
	data['pinyin'] = entity.pinyin;
	data['code'] = entity.code;
	return data;
}

cityListXFromJson(CityListX data, Map<String, dynamic> json) {
	if (json['city'] != null) {
		data.city = json['city'].toString();
	}
	if (json['pinyin'] != null) {
		data.pinyin = json['pinyin'].toString();
	}
	if (json['code'] != null) {
		data.code = json['code'].toString();
	}
	return data;
}

Map<String, dynamic> cityListXToJson(CityListX entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['city'] = entity.city;
	data['pinyin'] = entity.pinyin;
	data['code'] = entity.code;
	return data;
}

cityListYFromJson(CityListY data, Map<String, dynamic> json) {
	if (json['city'] != null) {
		data.city = json['city'].toString();
	}
	if (json['pinyin'] != null) {
		data.pinyin = json['pinyin'].toString();
	}
	if (json['code'] != null) {
		data.code = json['code'].toString();
	}
	return data;
}

Map<String, dynamic> cityListYToJson(CityListY entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['city'] = entity.city;
	data['pinyin'] = entity.pinyin;
	data['code'] = entity.code;
	return data;
}

cityListZFromJson(CityListZ data, Map<String, dynamic> json) {
	if (json['city'] != null) {
		data.city = json['city'].toString();
	}
	if (json['pinyin'] != null) {
		data.pinyin = json['pinyin'].toString();
	}
	if (json['code'] != null) {
		data.code = json['code'].toString();
	}
	return data;
}

Map<String, dynamic> cityListZToJson(CityListZ entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['city'] = entity.city;
	data['pinyin'] = entity.pinyin;
	data['code'] = entity.code;
	return data;
}