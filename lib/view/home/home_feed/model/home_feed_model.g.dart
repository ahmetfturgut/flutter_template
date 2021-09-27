// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_feed_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HomeFeedModel _$HomeFeedModelFromJson(Map<String, dynamic> json) {
  return HomeFeedModel(
    data: json['data'] == null
        ? null
        : Data.fromJson((json['data'] as Map<String, dynamic>).map(
            (k, e) => MapEntry(k, e as Object),
          )),
  );
}

Map<String, dynamic> _$HomeFeedModelToJson(HomeFeedModel instance) =>
    <String, dynamic>{
      'data': instance.data,
    };

Data _$DataFromJson(Map<String, dynamic> json) {
  return Data(
    statusCode: json['statusCode'] as int?,
    message: json['message'] as String?,
    success: json['success'] as bool?,
    response: (json['response'] as List<dynamic>?)
        ?.map((e) => Response.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'statusCode': instance.statusCode,
      'message': instance.message,
      'success': instance.success,
      'response': instance.response,
    };

Response _$ResponseFromJson(Map<String, dynamic> json) {
  return Response(
    id: json['id'] as String?,
    name: json['name'] as String?,
    isbn: json['isbn'] as String?,
    likecount: json['likecount'] as String?,
    image: json['image'] as String?,
    author: json['author'] as String?,
    publisher: json['publisher'] as String?,
  );
}

Map<String, dynamic> _$ResponseToJson(Response instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'isbn': instance.isbn,
      'likecount': instance.likecount,
      'image': instance.image,
      'author': instance.author,
      'publisher': instance.publisher,
    };
