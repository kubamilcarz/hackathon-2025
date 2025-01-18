import 'package:freezed_annotation/freezed_annotation.dart';

part 'test_request.g.dart';

// TODO: Remove unused Test Request
@JsonSerializable()
class TestRequest {
  final String param;

  TestRequest({required this.param});
  Map<String, dynamic> toJson() => _$TestRequestToJson(this);

  factory TestRequest.fromJson(Map<String, dynamic> json) =>
      _$TestRequestFromJson(json);
}
