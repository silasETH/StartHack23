import 'package:sperrgut_stgallen/app/app.locator.dart';
import 'package:sperrgut_stgallen/app/app.router.dart';
import 'package:sperrgut_stgallen/services/helper_service.dart';
import 'package:sperrgut_stgallen/services/user_data_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class CartViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();
  final _userDataService = locator<UserDataService>();
  final _helperService = locator<HelperService>();

  List<CartItemText> get cartItemTexts => _helperService.cartItemTexts;

  void registerItem() {
    _navigationService.navigateToTypeSelectView();
  }

  String get total =>
      "CHF 8.60 × ${_userDataService.calcTotalStampCount()} = CHF ${(_userDataService.calcTotalStampCount() * 8.6).toStringAsFixed(2)}";

  void pay() {
    _navigationService.navigateToPdfDownloaderView();
  }

  void salePoints() {
    _navigationService.navigateToMapView();
  }

  void back() {}

  void home() {
    _navigationService
        .popUntil((route) => route.settings.name == Routes.homeView);
  }
}
