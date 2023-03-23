import 'package:sperrgut_stgallen/app/app.locator.dart';
import 'package:sperrgut_stgallen/app/app.router.dart';
import 'package:sperrgut_stgallen/services/user_data_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class CartViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();
  final _userDataService = locator<UserDataService>();

  void pay() {
    print("Pay");
  }

  void salePoints() {
    print("SalePoints");
  }

  void back() {}

  void home() {
    _navigationService
        .popUntil((route) => route.settings.name == Routes.homeView);
  }
}
