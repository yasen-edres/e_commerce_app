import 'package:json_annotation/json_annotation.dart';
part 'user_dto.g.dart';
@JsonSerializable()
class UserDto {
  @JsonKey(name: "name")
  final String? name;
  @JsonKey(name: "email")
  final String? email;
  @JsonKey(name: "role")
  final String? role;

  UserDto ({
    this.name,
    this.email,
    this.role,
  });

  factory UserDto.fromJson(Map<String, dynamic> json) {
    return _$UserFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$UserToJson(this);
  }
}
