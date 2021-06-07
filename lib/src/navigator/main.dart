import 'package:flutter/material.dart';

import '../src.dart';

class IsmailNavigator extends StatefulWidget {
  const IsmailNavigator({
    Key? key,
    this.pages = const <Page<dynamic>>[],
    this.onPopPage,
    this.initialRoute,
    this.onGenerateInitialRoutes = Navigator.defaultGenerateInitialRoutes,
    this.onGenerateRoute,
    this.onUnknownRoute,
    this.transitionDelegate = const DefaultTransitionDelegate<dynamic>(),
    this.reportsRouteUpdateToEngine = false,
    this.observers = const <NavigatorObserver>[],
    this.restorationScopeId,
    this.controller,
  }) : super(key: key);
  final IsmailNavigatorController? controller;

  /// The list of pages with which to populate the history.
  ///
  /// Pages are turned into routes using [Page.createRoute] in a manner
  /// analogous to how [Widget]s are turned into [Element]s (and [State]s or
  /// [RenderObject]s) using [Widget.createElement] (and
  /// [StatefulWidget.createState] or [RenderObjectWidget.createRenderObject]).
  ///
  /// When this list is updated, the new list is compared to the previous
  /// list and the set of routes is updated accordingly.
  ///
  /// Some [Route]s do not correspond to [Page] objects, namely, those that are
  /// added to the history using the [Navigator] API ([push] and friends). A
  /// [Route] that does not correspond to a [Page] object is called a pageless
  /// route and is tied to the [Route] that _does_ correspond to a [Page] object
  /// that is below it in the history.
  ///
  /// Pages that are added or removed may be animated as controlled by the
  /// [transitionDelegate]. If a page is removed that had other pageless routes
  /// pushed on top of it using [push] and friends, those pageless routes are
  /// also removed with or without animation as determined by the
  /// [transitionDelegate].
  ///
  /// To use this API, an [onPopPage] callback must also be provided to properly
  /// clean up this list if a page has been popped.
  ///
  /// If [initialRoute] is non-null when the widget is first created, then
  /// [onGenerateInitialRoutes] is used to generate routes that are above those
  /// corresponding to [pages] in the initial history.
  final List<Page<dynamic>> pages;

  /// Called when [pop] is invoked but the current [Route] corresponds to a
  /// [Page] found in the [pages] list.
  ///
  /// The `result` argument is the value with which the route is to complete
  /// (e.g. the value returned from a dialog).
  ///
  /// This callback is responsible for calling [Route.didPop] and returning
  /// whether this pop is successful.
  ///
  /// The [Navigator] widget should be rebuilt with a [pages] list that does not
  /// contain the [Page] for the given [Route]. The next time the [pages] list
  /// is updated, if the [Page] corresponding to this [Route] is still present,
  /// it will be interpreted as a new route to display.
  final PopPageCallback? onPopPage;

  /// The delegate used for deciding how routes transition in or off the screen
  /// during the [pages] updates.
  ///
  /// Defaults to [DefaultTransitionDelegate] if not specified, cannot be null.
  final TransitionDelegate<dynamic> transitionDelegate;

  /// The name of the first route to show.
  ///
  /// Defaults to [Navigator.defaultRouteName].
  ///
  /// The value is interpreted according to [onGenerateInitialRoutes], which
  /// defaults to [defaultGenerateInitialRoutes].
  final String? initialRoute;

  /// Called to generate a route for a given [RouteSettings].
  final RouteFactory? onGenerateRoute;

  /// Called when [onGenerateRoute] fails to generate a route.
  ///
  /// This callback is typically used for error handling. For example, this
  /// callback might always generate a "not found" page that describes the route
  /// that wasn't found.
  ///
  /// Unknown routes can arise either from errors in the app or from external
  /// requests to push routes, such as from Android intents.
  final RouteFactory? onUnknownRoute;

  /// A list of observers for this navigator.
  final List<NavigatorObserver> observers;

  /// Restoration ID to save and restore the state of the navigator, including
  /// its history.
  ///
  /// {@template flutter.widgets.navigator.restorationScopeId}
  /// If a restoration ID is provided, the navigator will persist its internal
  /// state (including the route history as well as the restorable state of the
  /// routes) and restore it during state restoration.
  ///
  /// If no restoration ID is provided, the route history stack will not be
  /// restored and state restoration is disabled for the individual routes as
  /// well.
  ///
  /// The state is persisted in a [RestorationBucket] claimed from
  /// the surrounding [RestorationScope] using the provided restoration ID.
  /// Within that bucket, the [Navigator] also creates a new [RestorationScope]
  /// for its children (the [Route]s).
  ///
  /// See also:
  ///
  ///  * [RestorationManager], which explains how state restoration works in
  ///    Flutter.
  ///  * [RestorationMixin], which contains a runnable code sample showcasing
  ///    state restoration in Flutter.
  ///  * [Navigator], which explains under the heading "state restoration"
  ///    how and under what conditions the navigator restores its state.
  ///  * [Navigator.restorablePush], which includes an example showcasing how
  ///    to push a restorable route unto the navigator.
  /// {@endtemplate}
  final String? restorationScopeId;

  /// The name for the default route of the application.
  ///
  /// See also:
  ///
  ///  * [dart:ui.PlatformDispatcher.defaultRouteName], which reflects the route that the
  ///    application was started with.
  static const String defaultRouteName = '/';

  /// Called when the widget is created to generate the initial list of [Route]
  /// objects if [initialRoute] is not null.
  ///
  /// Defaults to [defaultGenerateInitialRoutes].
  ///
  /// The [NavigatorState] and [initialRoute] will be passed to the callback.
  /// The callback must return a list of [Route] objects with which the history
  /// will be primed.
  ///
  /// When parsing the initialRoute, if there's any chance that the it may
  /// contain complex characters, it's best to use the
  /// [characters](https://pub.dev/packages/characters) API. This will ensure
  /// that extended grapheme clusters and surrogate pairs are treated as single
  /// characters by the code, the same way that they appear to the user. For
  /// example, the string "👨‍👩‍👦" appears to the user as a single
  /// character and `string.characters.length` intuitively returns 1. On the
  /// other hand, `string.length` returns 8, and `string.runes.length` returns
  /// 5!
  final RouteListFactory onGenerateInitialRoutes;

  /// Whether this navigator should report route update message back to the
  /// engine when the top-most route changes.
  ///
  /// If the property is set to true, this navigator automatically sends the
  /// route update message to the engine when it detects top-most route changes.
  /// The messages are used by the web engine to update the browser URL bar.
  ///
  /// If there are multiple navigators in the widget tree, at most one of them
  /// can set this property to true (typically, the top-most one created from
  /// the [WidgetsApp]). Otherwise, the web engine may receive multiple route
  /// update messages from different navigators and fail to update the URL
  /// bar.
  ///
  /// Defaults to false.
  final bool reportsRouteUpdateToEngine;

  @override
  IsmailNavigatorState createState() => IsmailNavigatorState();
  static IsmailNavigatorController? of(BuildContext context) =>
      context.findAncestorStateOfType<IsmailNavigatorState>()!.controller;
}

class IsmailNavigatorState extends State<IsmailNavigator> {
  late IsmailNavigatorController controller =
      widget.controller ?? IsmailNavigatorController();
  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: controller.key,
      observers: widget.observers,
      onGenerateInitialRoutes: widget.onGenerateInitialRoutes,
      onGenerateRoute: widget.onGenerateRoute,
      onPopPage: widget.onPopPage,
      onUnknownRoute: widget.onUnknownRoute,
      pages: widget.pages,
      reportsRouteUpdateToEngine: widget.reportsRouteUpdateToEngine,
      restorationScopeId: widget.restorationScopeId,
      transitionDelegate: widget.transitionDelegate,
      initialRoute: widget.initialRoute,
    );
  }
}
