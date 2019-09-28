import 'package:json_annotation/json_annotation.dart';

part 'token.g.dart';

@JsonSerializable()
class Token {
    Token();

    String token;
    
    factory Token.fromJson(Map<String,dynamic> json) => _$TokenFromJson(json);
    Map<String, dynamic> toJson() => _$TokenToJson(this);
}
