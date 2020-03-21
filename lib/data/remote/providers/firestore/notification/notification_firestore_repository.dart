// my app imports
import 'package:e_commerce/domain/models/product_model.dart';
import 'package:e_commerce/domain/repositories/notification/notification_repository.dart';
import 'package:e_commerce/domain/models/cart_model.dart';
import 'package:e_commerce/domain/models/cart_model_list.dart';
import 'package:e_commerce/domain/models/notification_model.dart';

class NotificationFirestoreRepository extends NotificationRepository {
  @override
  Future<List<NotificationModel>> getNotifications(
      int notificationId, int numToLoad) async {
    List<NotificationModel> notifications = [];

    for (int i = 0; i < 12; i++) {
      notifications.add(
        NotificationModel(
            cartList: CartModelList.initial(list: [
              CartModel(
                status: 'pending',
                productModel: ProductModel(
                    name: 'Lenovo x280',
                    price: '\$ 1399',
                    discount: '-37%',
                    images: [
                      'assets/images/lenovo.jpg',
                      'assets/images/lenovo.jpg',
                    ]),
              )
            ]),
            date: '24-01-2020',
            title: 'Item Shipped',
            subTitle: 'Checkout order details',
            image: 'assets/images/lenovo.jpg'),
      );
    }

    return Future.delayed(Duration(seconds: 4), () {
      return notifications;
    });
  }
}
