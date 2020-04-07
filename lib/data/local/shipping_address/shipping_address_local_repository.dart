// my app imports
import 'package:e_commerce/domain/models/shipping_address_model.dart';
import 'package:e_commerce/domain/repositories/shipping_address/shipping_address_repository.dart';

class ShippingAddressLocalRepository extends ShippingAddressRepository {
  @override
  Future<ShippingAddressModel> getAddress() async {
    return Future.delayed(Duration(microseconds: 400), () {
      return null;
      // return ShippingAddressModel(
      //     firstName: 'John',
      //     lastName: 'Kwame',
      //     addressLine1: 'House 23',
      //     addressLine2: 'SSNIT Housing',
      //     region: 'Eastern',
      //     city: 'Takoradi',
      //     phoneNumber1: '+233 55 231 1110',
      //     phoneNumber2: '');
    });
  }
}
