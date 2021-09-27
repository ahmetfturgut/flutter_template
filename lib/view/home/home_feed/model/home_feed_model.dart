import 'package:json_annotation/json_annotation.dart';
import 'package:vexana/vexana.dart';

part 'home_feed_model.g.dart';

@JsonSerializable()
class HomeFeedModel extends INetworkModel<HomeFeedModel> {
  Data? data;

  HomeFeedModel({this.data});

  @override
  HomeFeedModel fromJson(Map<String, dynamic> json) {
    return _$HomeFeedModelFromJson(json);
  }

  @override
  Map<String, dynamic> toJson() {
    return _$HomeFeedModelToJson(this);
  }
}

@JsonSerializable()
class Data extends INetworkModel<Data> {
  int? statusCode;
  String? message;
  bool? success;
  List<Response>? response;

  Data({this.statusCode, this.message, this.success, this.response});

  @override
  Data fromJson(Map<String, dynamic> json) {
    return _$DataFromJson(json);
  }

  factory Data.fromJson(Map<String, Object> json) {
    return _$DataFromJson(json);
  }
  @override
  Map<String, dynamic> toJson() {
    return _$DataToJson(this);
  }
}

@JsonSerializable()
class Response extends INetworkModel<Response> {
  String? id;
  String? name;
  String? isbn;
  String? likecount;
  String? image;
  String? author;
  String? publisher;

  Response(
      {this.id,
      this.name,
      this.isbn,
      this.likecount,
      this.image,
      this.author,
      this.publisher});

  @override
  Response fromJson(Map<String, dynamic> json) {
    return _$ResponseFromJson(json);
  }

  factory Response.fromJson(Map<String, dynamic> json) {
    return _$ResponseFromJson(json);
  }
  @override
  Map<String, dynamic> toJson() {
    return _$ResponseToJson(this);
  }
}
