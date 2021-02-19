// ignore_for_file: non_constant_identifier_names
// ignore_for_file: camel_case_types
// ignore_for_file: prefer_single_quotes

// This file is automatically generated. DO NOT EDIT, all your changes would be lost.
import 'package:home_flutter/http/city_list_entity.dart';
import 'package:home_flutter/generated/json/city_list_entity_helper.dart';
import 'package:home_flutter/http/feed_data_entity.dart';
import 'package:home_flutter/generated/json/feed_data_entity_helper.dart';
import 'package:home_flutter/http/weather_entity.dart';
import 'package:home_flutter/generated/json/weather_entity_helper.dart';
import 'package:home_flutter/http/home_feed_entity.dart';
import 'package:home_flutter/generated/json/home_feed_entity_helper.dart';

class JsonConvert<T> {
	T fromJson(Map<String, dynamic> json) {
		return _getFromJson<T>(runtimeType, this, json);
	}

  Map<String, dynamic> toJson() {
		return _getToJson<T>(runtimeType, this);
  }

  static _getFromJson<T>(Type type, data, json) {
    switch (type) {
			case CityListEntity:
				return cityListEntityFromJson(data as CityListEntity, json) as T;
			case CityListum:
				return cityListumFromJson(data as CityListum, json) as T;
			case CityListB:
				return cityListBFromJson(data as CityListB, json) as T;
			case CityListC:
				return cityListCFromJson(data as CityListC, json) as T;
			case CityListD:
				return cityListDFromJson(data as CityListD, json) as T;
			case CityListE:
				return cityListEFromJson(data as CityListE, json) as T;
			case CityListF:
				return cityListFFromJson(data as CityListF, json) as T;
			case CityListG:
				return cityListGFromJson(data as CityListG, json) as T;
			case CityListH:
				return cityListHFromJson(data as CityListH, json) as T;
			case CityListJ:
				return cityListJFromJson(data as CityListJ, json) as T;
			case CityListK:
				return cityListKFromJson(data as CityListK, json) as T;
			case CityListL:
				return cityListLFromJson(data as CityListL, json) as T;
			case CityListM:
				return cityListMFromJson(data as CityListM, json) as T;
			case CityListN:
				return cityListNFromJson(data as CityListN, json) as T;
			case CityListP:
				return cityListPFromJson(data as CityListP, json) as T;
			case CityListQ:
				return cityListQFromJson(data as CityListQ, json) as T;
			case CityListR:
				return cityListRFromJson(data as CityListR, json) as T;
			case CityList:
				return cityListFromJson(data as CityList, json) as T;
			case CityListT:
				return cityListTFromJson(data as CityListT, json) as T;
			case CityListW:
				return cityListWFromJson(data as CityListW, json) as T;
			case CityListX:
				return cityListXFromJson(data as CityListX, json) as T;
			case CityListY:
				return cityListYFromJson(data as CityListY, json) as T;
			case CityListZ:
				return cityListZFromJson(data as CityListZ, json) as T;
			case FeedDataEntity:
				return feedDataEntityFromJson(data as FeedDataEntity, json) as T;
			case FeedDataToplist:
				return feedDataToplistFromJson(data as FeedDataToplist, json) as T;
			case FeedDataResult:
				return feedDataResultFromJson(data as FeedDataResult, json) as T;
			case WeatherEntity:
				return weatherEntityFromJson(data as WeatherEntity, json) as T;
			case WeatherReal:
				return weatherRealFromJson(data as WeatherReal, json) as T;
			case WeatherAqiInfo:
				return weatherAqiInfoFromJson(data as WeatherAqiInfo, json) as T;
			case HomeFeedEntity:
				return homeFeedEntityFromJson(data as HomeFeedEntity, json) as T;
			case HomeFeedEntityInner:
				return homeFeedEntityInnerFromJson(data as HomeFeedEntityInner, json) as T;    }
    return data as T;
  }

  static _getToJson<T>(Type type, data) {
		switch (type) {
			case CityListEntity:
				return cityListEntityToJson(data as CityListEntity);
			case CityListum:
				return cityListumToJson(data as CityListum);
			case CityListB:
				return cityListBToJson(data as CityListB);
			case CityListC:
				return cityListCToJson(data as CityListC);
			case CityListD:
				return cityListDToJson(data as CityListD);
			case CityListE:
				return cityListEToJson(data as CityListE);
			case CityListF:
				return cityListFToJson(data as CityListF);
			case CityListG:
				return cityListGToJson(data as CityListG);
			case CityListH:
				return cityListHToJson(data as CityListH);
			case CityListJ:
				return cityListJToJson(data as CityListJ);
			case CityListK:
				return cityListKToJson(data as CityListK);
			case CityListL:
				return cityListLToJson(data as CityListL);
			case CityListM:
				return cityListMToJson(data as CityListM);
			case CityListN:
				return cityListNToJson(data as CityListN);
			case CityListP:
				return cityListPToJson(data as CityListP);
			case CityListQ:
				return cityListQToJson(data as CityListQ);
			case CityListR:
				return cityListRToJson(data as CityListR);
			case CityList:
				return cityListToJson(data as CityList);
			case CityListT:
				return cityListTToJson(data as CityListT);
			case CityListW:
				return cityListWToJson(data as CityListW);
			case CityListX:
				return cityListXToJson(data as CityListX);
			case CityListY:
				return cityListYToJson(data as CityListY);
			case CityListZ:
				return cityListZToJson(data as CityListZ);
			case FeedDataEntity:
				return feedDataEntityToJson(data as FeedDataEntity);
			case FeedDataToplist:
				return feedDataToplistToJson(data as FeedDataToplist);
			case FeedDataResult:
				return feedDataResultToJson(data as FeedDataResult);
			case WeatherEntity:
				return weatherEntityToJson(data as WeatherEntity);
			case WeatherReal:
				return weatherRealToJson(data as WeatherReal);
			case WeatherAqiInfo:
				return weatherAqiInfoToJson(data as WeatherAqiInfo);
			case HomeFeedEntity:
				return homeFeedEntityToJson(data as HomeFeedEntity);
			case HomeFeedEntityInner:
				return homeFeedEntityInnerToJson(data as HomeFeedEntityInner);
			}
			return data as T;
		}
  //Go back to a single instance by type
	static _fromJsonSingle<M>( json) {
		String type = M.toString();
		if(type == (CityListEntity).toString()){
			return CityListEntity().fromJson(json);
		}	else if(type == (CityListum).toString()){
			return CityListum().fromJson(json);
		}	else if(type == (CityListB).toString()){
			return CityListB().fromJson(json);
		}	else if(type == (CityListC).toString()){
			return CityListC().fromJson(json);
		}	else if(type == (CityListD).toString()){
			return CityListD().fromJson(json);
		}	else if(type == (CityListE).toString()){
			return CityListE().fromJson(json);
		}	else if(type == (CityListF).toString()){
			return CityListF().fromJson(json);
		}	else if(type == (CityListG).toString()){
			return CityListG().fromJson(json);
		}	else if(type == (CityListH).toString()){
			return CityListH().fromJson(json);
		}	else if(type == (CityListJ).toString()){
			return CityListJ().fromJson(json);
		}	else if(type == (CityListK).toString()){
			return CityListK().fromJson(json);
		}	else if(type == (CityListL).toString()){
			return CityListL().fromJson(json);
		}	else if(type == (CityListM).toString()){
			return CityListM().fromJson(json);
		}	else if(type == (CityListN).toString()){
			return CityListN().fromJson(json);
		}	else if(type == (CityListP).toString()){
			return CityListP().fromJson(json);
		}	else if(type == (CityListQ).toString()){
			return CityListQ().fromJson(json);
		}	else if(type == (CityListR).toString()){
			return CityListR().fromJson(json);
		}	else if(type == (CityList).toString()){
			return CityList().fromJson(json);
		}	else if(type == (CityListT).toString()){
			return CityListT().fromJson(json);
		}	else if(type == (CityListW).toString()){
			return CityListW().fromJson(json);
		}	else if(type == (CityListX).toString()){
			return CityListX().fromJson(json);
		}	else if(type == (CityListY).toString()){
			return CityListY().fromJson(json);
		}	else if(type == (CityListZ).toString()){
			return CityListZ().fromJson(json);
		}	else if(type == (FeedDataEntity).toString()){
			return FeedDataEntity().fromJson(json);
		}	else if(type == (FeedDataToplist).toString()){
			return FeedDataToplist().fromJson(json);
		}	else if(type == (FeedDataResult).toString()){
			return FeedDataResult().fromJson(json);
		}	else if(type == (WeatherEntity).toString()){
			return WeatherEntity().fromJson(json);
		}	else if(type == (WeatherReal).toString()){
			return WeatherReal().fromJson(json);
		}	else if(type == (WeatherAqiInfo).toString()){
			return WeatherAqiInfo().fromJson(json);
		}	else if(type == (HomeFeedEntity).toString()){
			return HomeFeedEntity().fromJson(json);
		}	else if(type == (HomeFeedEntityInner).toString()){
			return HomeFeedEntityInner().fromJson(json);
		}	
		return null;
	}

  //list is returned by type
	static M _getListChildType<M>(List data) {
		if(List<CityListEntity>() is M){
			return data.map<CityListEntity>((e) => CityListEntity().fromJson(e)).toList() as M;
		}	else if(List<CityListum>() is M){
			return data.map<CityListum>((e) => CityListum().fromJson(e)).toList() as M;
		}	else if(List<CityListB>() is M){
			return data.map<CityListB>((e) => CityListB().fromJson(e)).toList() as M;
		}	else if(List<CityListC>() is M){
			return data.map<CityListC>((e) => CityListC().fromJson(e)).toList() as M;
		}	else if(List<CityListD>() is M){
			return data.map<CityListD>((e) => CityListD().fromJson(e)).toList() as M;
		}	else if(List<CityListE>() is M){
			return data.map<CityListE>((e) => CityListE().fromJson(e)).toList() as M;
		}	else if(List<CityListF>() is M){
			return data.map<CityListF>((e) => CityListF().fromJson(e)).toList() as M;
		}	else if(List<CityListG>() is M){
			return data.map<CityListG>((e) => CityListG().fromJson(e)).toList() as M;
		}	else if(List<CityListH>() is M){
			return data.map<CityListH>((e) => CityListH().fromJson(e)).toList() as M;
		}	else if(List<CityListJ>() is M){
			return data.map<CityListJ>((e) => CityListJ().fromJson(e)).toList() as M;
		}	else if(List<CityListK>() is M){
			return data.map<CityListK>((e) => CityListK().fromJson(e)).toList() as M;
		}	else if(List<CityListL>() is M){
			return data.map<CityListL>((e) => CityListL().fromJson(e)).toList() as M;
		}	else if(List<CityListM>() is M){
			return data.map<CityListM>((e) => CityListM().fromJson(e)).toList() as M;
		}	else if(List<CityListN>() is M){
			return data.map<CityListN>((e) => CityListN().fromJson(e)).toList() as M;
		}	else if(List<CityListP>() is M){
			return data.map<CityListP>((e) => CityListP().fromJson(e)).toList() as M;
		}	else if(List<CityListQ>() is M){
			return data.map<CityListQ>((e) => CityListQ().fromJson(e)).toList() as M;
		}	else if(List<CityListR>() is M){
			return data.map<CityListR>((e) => CityListR().fromJson(e)).toList() as M;
		}	else if(List<CityList>() is M){
			return data.map<CityList>((e) => CityList().fromJson(e)).toList() as M;
		}	else if(List<CityListT>() is M){
			return data.map<CityListT>((e) => CityListT().fromJson(e)).toList() as M;
		}	else if(List<CityListW>() is M){
			return data.map<CityListW>((e) => CityListW().fromJson(e)).toList() as M;
		}	else if(List<CityListX>() is M){
			return data.map<CityListX>((e) => CityListX().fromJson(e)).toList() as M;
		}	else if(List<CityListY>() is M){
			return data.map<CityListY>((e) => CityListY().fromJson(e)).toList() as M;
		}	else if(List<CityListZ>() is M){
			return data.map<CityListZ>((e) => CityListZ().fromJson(e)).toList() as M;
		}	else if(List<FeedDataEntity>() is M){
			return data.map<FeedDataEntity>((e) => FeedDataEntity().fromJson(e)).toList() as M;
		}	else if(List<FeedDataToplist>() is M){
			return data.map<FeedDataToplist>((e) => FeedDataToplist().fromJson(e)).toList() as M;
		}	else if(List<FeedDataResult>() is M){
			return data.map<FeedDataResult>((e) => FeedDataResult().fromJson(e)).toList() as M;
		}	else if(List<WeatherEntity>() is M){
			return data.map<WeatherEntity>((e) => WeatherEntity().fromJson(e)).toList() as M;
		}	else if(List<WeatherReal>() is M){
			return data.map<WeatherReal>((e) => WeatherReal().fromJson(e)).toList() as M;
		}	else if(List<WeatherAqiInfo>() is M){
			return data.map<WeatherAqiInfo>((e) => WeatherAqiInfo().fromJson(e)).toList() as M;
		}	else if(List<HomeFeedEntity>() is M){
			return data.map<HomeFeedEntity>((e) => HomeFeedEntity().fromJson(e)).toList() as M;
		}	else if(List<HomeFeedEntityInner>() is M){
			return data.map<HomeFeedEntityInner>((e) => HomeFeedEntityInner().fromJson(e)).toList() as M;
		}
		return null;
	}

  static M fromJsonAsT<M>(json) {
    if (json is List) {
      return _getListChildType<M>(json);
    } else {
      return _fromJsonSingle<M>(json) as M;
    }
  }
}