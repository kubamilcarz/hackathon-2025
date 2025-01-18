import 'package:json_annotation/json_annotation.dart';

part 'place_predictions_response_dto.g.dart';

@JsonSerializable()
class PredictionsResponseDTO {
  final List<PredictionDTO> predictions;
  final String status;

  PredictionsResponseDTO({
    required this.predictions,
    required this.status,
  });

  factory PredictionsResponseDTO.fromJson(Map<String, dynamic> json) =>
      _$PredictionsResponseDTOFromJson(json);

  Map<String, dynamic> toJson() => _$PredictionsResponseDTOToJson(this);
}

@JsonSerializable()
class PredictionDTO {
  final String description;
  final List<MatchedSubstringDTO> matched_substrings;
  final String place_id;
  final String reference;
  final StructuredFormattingDTO structured_formatting;
  final List<TermDTO> terms;
  final List<String> types;

  PredictionDTO({
    required this.description,
    required this.matched_substrings,
    required this.place_id,
    required this.reference,
    required this.structured_formatting,
    required this.terms,
    required this.types,
  });

  factory PredictionDTO.fromJson(Map<String, dynamic> json) =>
      _$PredictionDTOFromJson(json);

  Map<String, dynamic> toJson() => _$PredictionDTOToJson(this);
}

@JsonSerializable()
class MatchedSubstringDTO {
  final int length;
  final int offset;

  MatchedSubstringDTO({
    required this.length,
    required this.offset,
  });

  factory MatchedSubstringDTO.fromJson(Map<String, dynamic> json) =>
      _$MatchedSubstringDTOFromJson(json);

  Map<String, dynamic> toJson() => _$MatchedSubstringDTOToJson(this);
}

@JsonSerializable()
class StructuredFormattingDTO {
  final String main_text;
  final List<MatchedSubstringDTO> main_text_matched_substrings;
  final String secondary_text;

  StructuredFormattingDTO({
    required this.main_text,
    required this.main_text_matched_substrings,
    required this.secondary_text,
  });

  factory StructuredFormattingDTO.fromJson(Map<String, dynamic> json) =>
      _$StructuredFormattingDTOFromJson(json);

  Map<String, dynamic> toJson() => _$StructuredFormattingDTOToJson(this);
}

@JsonSerializable()
class TermDTO {
  final int offset;
  final String value;

  TermDTO({
    required this.offset,
    required this.value,
  });

  factory TermDTO.fromJson(Map<String, dynamic> json) =>
      _$TermDTOFromJson(json);

  Map<String, dynamic> toJson() => _$TermDTOToJson(this);
}
