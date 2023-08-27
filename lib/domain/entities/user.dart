import 'package:freezed_annotation/freezed_annotation.dart';

part 'user.g.dart';

@JsonSerializable()
class User {
  User({
    this.displayName,
    required this.email,
    required this.id,
    this.photoUrl,
  });

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
  Map<String, dynamic> toJson() => _$UserToJson(this);
  final String? displayName;
  final String email;
  final String id;
  final String? photoUrl;
}
