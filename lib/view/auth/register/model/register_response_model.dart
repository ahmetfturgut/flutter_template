import 'package:json_annotation/json_annotation.dart';
import 'package:vexana/vexana.dart';

part 'register_response_model.g.dart';

@JsonSerializable()
class RegisterResponseModel extends INetworkModel<RegisterResponseModel> {
  bool? success;
  String? error;
  String? message;
  String? data;
  RegisterResponseModel({this.success, this.error, this.message, this.data});

  @override
  RegisterResponseModel fromJson(Map<String, dynamic> json) {
    return _$RegisterResponseModelFromJson(json);
  }

  @override
  Map<String, dynamic> toJson() {
    return _$RegisterResponseModelToJson(this);
  }
}
