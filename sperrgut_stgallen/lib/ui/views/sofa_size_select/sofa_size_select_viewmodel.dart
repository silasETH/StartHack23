import 'package:sperrgut_stgallen/app/app.locator.dart';
import 'package:sperrgut_stgallen/app/app.router.dart';
import 'package:sperrgut_stgallen/services/user_data_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class SofaSizeSelectViewModel extends BaseViewModel {
  final NavigationService _navigationService = locator<NavigationService>();
  final UserDataService _userDataService = locator<UserDataService>();

  void selectSmallItem() {
    _userDataService.setItemSize(false);
    _userDataService.tryAddingItemToCart();
    _navigationService.navigateToCartView();
  }

  void selectBigItem() {
    _userDataService.setItemSize(true);
    _userDataService.tryAddingItemToCart();
    _navigationService.navigateToCartView();
  }

  void back() {
    _navigationService.back();
  }

  void home() {
    _navigationService
        .popUntil((route) => route.settings.name == Routes.homeView);
  }
}
