// to Convert the response into a non nullable object

import 'package:ecomappv2/app/app_shelf.dart';
import 'package:ecomappv2/data/responses/responses.dart';
import 'package:ecomappv2/domain/domain_shelf.dart';

//Constants
const Empty = "";
const Zero = 0;

extension CustomerResponseMapper on CustomerResponse? {
  Customer toDomain() {
    return Customer(
      id: this?.id?.orEmpty() ?? Empty,
      name: this?.name?.orEmpty() ?? Empty,
      numOfNotifications: this?.numOfNotifications?.orZero() ?? Zero,
    );
  }
}

extension ContactsResponseMapper on ContactsResponse? {
  Contacts toDomain() {
    return Contacts(
      email: this?.email?.orEmpty() ?? Empty,
      phone: this?.phone?.orEmpty() ?? Empty,
      link: this?.link?.orEmpty() ?? Empty,
    );
  }
}

extension AuthenticationResponseMapper on AuthenticationResponse? {
  Authentication toDomain() {
    return Authentication(
      customer: this?.customerResponse?.toDomain(),
      contacts: this?.contactsResponse?.toDomain(),
    );
  }
}
