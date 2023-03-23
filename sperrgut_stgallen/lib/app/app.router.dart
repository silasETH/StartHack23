// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedNavigatorGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:flutter/material.dart' as _i11;
import 'package:flutter/material.dart';
import 'package:sperrgut_stgallen/ui/views/home/home_view.dart' as _i2;
import 'package:sperrgut_stgallen/ui/views/info/info_view.dart' as _i10;
import 'package:sperrgut_stgallen/ui/views/map/map_view.dart' as _i9;
import 'package:sperrgut_stgallen/ui/views/mattress_size_select/mattress_size_select_view.dart'
    as _i6;
import 'package:sperrgut_stgallen/ui/views/other_item_size_select/other_item_size_select_view.dart'
    as _i8;
import 'package:sperrgut_stgallen/ui/views/sofa_size_select/sofa_size_select_view.dart'
    as _i5;
import 'package:sperrgut_stgallen/ui/views/startup/startup_view.dart' as _i3;
import 'package:sperrgut_stgallen/ui/views/type_select/type_select_view.dart'
    as _i4;
import 'package:sperrgut_stgallen/ui/views/weight_select/weight_select_view.dart'
    as _i7;
import 'package:stacked/stacked.dart' as _i1;
import 'package:stacked_services/stacked_services.dart' as _i12;

class Routes {
  static const homeView = '/home-view';

  static const startupView = '/startup-view';

  static const typeSelectView = '/type-select-view';

  static const sofaSizeSelectView = '/sofa-size-select-view';

  static const mattressSizeSelectView = '/mattress-size-select-view';

  static const weightSelectView = '/weight-select-view';

  static const otherItemSizeSelectView = '/other-item-size-select-view';

  static const mapView = '/map-view';

  static const infoView = '/info-view';

  static const all = <String>{
    homeView,
    startupView,
    typeSelectView,
    sofaSizeSelectView,
    mattressSizeSelectView,
    weightSelectView,
    otherItemSizeSelectView,
    mapView,
    infoView,
  };
}

class StackedRouter extends _i1.RouterBase {
  final _routes = <_i1.RouteDef>[
    _i1.RouteDef(
      Routes.homeView,
      page: _i2.HomeView,
    ),
    _i1.RouteDef(
      Routes.startupView,
      page: _i3.StartupView,
    ),
    _i1.RouteDef(
      Routes.typeSelectView,
      page: _i4.TypeSelectView,
    ),
    _i1.RouteDef(
      Routes.sofaSizeSelectView,
      page: _i5.SofaSizeSelectView,
    ),
    _i1.RouteDef(
      Routes.mattressSizeSelectView,
      page: _i6.MattressSizeSelectView,
    ),
    _i1.RouteDef(
      Routes.weightSelectView,
      page: _i7.WeightSelectView,
    ),
    _i1.RouteDef(
      Routes.otherItemSizeSelectView,
      page: _i8.OtherItemSizeSelectView,
    ),
    _i1.RouteDef(
      Routes.mapView,
      page: _i9.MapView,
    ),
    _i1.RouteDef(
      Routes.infoView,
      page: _i10.InfoView,
    ),
  ];

  final _pagesMap = <Type, _i1.StackedRouteFactory>{
    _i2.HomeView: (data) {
      return _i11.MaterialPageRoute<dynamic>(
        builder: (context) => const _i2.HomeView(),
        settings: data,
        maintainState: false,
      );
    },
    _i3.StartupView: (data) {
      return _i11.MaterialPageRoute<dynamic>(
        builder: (context) => const _i3.StartupView(),
        settings: data,
        maintainState: false,
      );
    },
    _i4.TypeSelectView: (data) {
      return _i11.MaterialPageRoute<dynamic>(
        builder: (context) => const _i4.TypeSelectView(),
        settings: data,
        maintainState: false,
      );
    },
    _i5.SofaSizeSelectView: (data) {
      return _i11.MaterialPageRoute<dynamic>(
        builder: (context) => const _i5.SofaSizeSelectView(),
        settings: data,
        maintainState: false,
      );
    },
    _i6.MattressSizeSelectView: (data) {
      return _i11.MaterialPageRoute<dynamic>(
        builder: (context) => const _i6.MattressSizeSelectView(),
        settings: data,
        maintainState: false,
      );
    },
    _i7.WeightSelectView: (data) {
      return _i11.MaterialPageRoute<dynamic>(
        builder: (context) => const _i7.WeightSelectView(),
        settings: data,
        maintainState: false,
      );
    },
    _i8.OtherItemSizeSelectView: (data) {
      return _i11.MaterialPageRoute<dynamic>(
        builder: (context) => const _i8.OtherItemSizeSelectView(),
        settings: data,
        maintainState: false,
      );
    },
    _i9.MapView: (data) {
      return _i11.MaterialPageRoute<dynamic>(
        builder: (context) => const _i9.MapView(),
        settings: data,
        maintainState: false,
      );
    },
    _i10.InfoView: (data) {
      return _i11.MaterialPageRoute<dynamic>(
        builder: (context) => const _i10.InfoView(),
        settings: data,
        maintainState: false,
      );
    },
  };

  @override
  List<_i1.RouteDef> get routes => _routes;
  @override
  Map<Type, _i1.StackedRouteFactory> get pagesMap => _pagesMap;
}

extension NavigatorStateExtension on _i12.NavigationService {
  Future<dynamic> navigateToHomeView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.homeView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToStartupView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.startupView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToTypeSelectView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.typeSelectView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToSofaSizeSelectView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.sofaSizeSelectView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToMattressSizeSelectView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.mattressSizeSelectView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToWeightSelectView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.weightSelectView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToOtherItemSizeSelectView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.otherItemSizeSelectView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToMapView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.mapView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithHomeView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.homeView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithStartupView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.startupView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithTypeSelectView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.typeSelectView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithSofaSizeSelectView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.sofaSizeSelectView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithMattressSizeSelectView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.mattressSizeSelectView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithWeightSelectView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.weightSelectView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithOtherItemSizeSelectView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.otherItemSizeSelectView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithMapView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.mapView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }
}
