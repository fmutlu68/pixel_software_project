import 'package:flutter/material.dart';

abstract class BaseViewModel {
  BuildContext? pageContext;
  void setContext(BuildContext newContext);
  void init();
  void onDispose();
  // ILocalCacheManager cacheManager = LocalCacheManager.instance;
}
