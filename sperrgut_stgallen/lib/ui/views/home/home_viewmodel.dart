import 'package:sperrgut_stgallen/app/app.locator.dart';
import 'package:sperrgut_stgallen/app/app.router.dart';
import 'package:sperrgut_stgallen/services/user_data_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class HomeViewModel extends BaseViewModel {
  final NavigationService _navigationService = locator<NavigationService>();
  final UserDataService _userDataService = locator<UserDataService>();
  final DialogService _dialogService = locator<DialogService>();

  void registerItem() async {
    if (!_userDataService.isCartEmpty()) {
      var response = await _dialogService.showDialog(
        title: "Es wurde bereits erfasstes Sperrgut gefunden",
        buttonTitle: "Sperrgut anzeigen",
        cancelTitle: "Sperrgut löschen",
      );

      if (response!.confirmed) {
        _navigationService.navigateToCartView();
        return;
      }
    }

    _userDataService.createNewCart();
    _navigationService.navigateToTypeSelectView();
  }

  void map() {
    _navigationService.navigateToMapView();
  }

  void info() {
    _navigationService.navigateToInfoView();
  }

  void receipts() {
    _navigationService.navigateToPdfDownloaderView();
  }

  void loadUserData() async {
    _userDataService.loadFromDisk();
  }
}
