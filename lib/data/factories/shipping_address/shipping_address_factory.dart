// my app imports
import 'package:e_commerce/data/local/shipping_address/shipping_address_local_repository.dart';
import 'package:e_commerce/domain/models/shipping_address_model.dart';

class ShippingAddressRepositoryFactory {
  ShippingAddressLocalRepository _shippingAddressLocalRepository;

  ShippingAddressRepositoryFactory() {
    this._shippingAddressLocalRepository = ShippingAddressLocalRepository();
  }

  Future<ShippingAddressModel> getAddress() async {
    return await _shippingAddressLocalRepository.getAddress();
  }
}
