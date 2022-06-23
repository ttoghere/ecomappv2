import 'package:json_annotation/json_annotation.dart';
part 'responses.g.dart';

@JsonSerializable()
class BaseResponse {
  @JsonKey(name: "status")
  int? status;
  @JsonKey(name: "message")
  String? message;
}

@JsonSerializable()
class CustomerResponse {
  @JsonKey(name: "id")
  String? id;
  @JsonKey(name: "name")
  String? name;
  @JsonKey(name: "numOfNotifications")
  int? numOfNotifications;
  CustomerResponse({
    this.id,
    this.name,
    this.numOfNotifications,
  });
  //From Json
  factory CustomerResponse.fromJson(Map<String, dynamic> json) {
    return _$CustomerResponseFromJson(json);
  }
  //To Json
  Map<String, dynamic> toJson() => _$CustomerResponseToJson(this);
}

@JsonSerializable()
class ContactsResponse {
  @JsonKey(name: "email")
  String? email;
  @JsonKey(name: "phone")
  String? phone;
  @JsonKey(name: "link")
  String? link;
  ContactsResponse({
    this.email,
    this.phone,
    this.link,
  });
  //From Json
  factory ContactsResponse.fromJson(Map<String, dynamic> json) {
    return _$ContactsResponseFromJson(json);
  }
  //To Json
  Map<String, dynamic> toJson() => _$ContactsResponseToJson(this);
}

@JsonSerializable()
class AuthenticationResponse extends BaseResponse {
  @JsonKey(name: "customer")
  CustomerResponse? customerResponse;
  @JsonKey(name: "contacts")
  ContactsResponse? contactsResponse;
  AuthenticationResponse({
    this.customerResponse,
    this.contactsResponse,
  });
  //From Json
  factory AuthenticationResponse.fromJson(Map<String, dynamic> json) {
    return _$AuthenticationResponseFromJson(json);
  }
  //To Json
  Map<String, dynamic> toJson() => _$AuthenticationResponseToJson(this);
}
