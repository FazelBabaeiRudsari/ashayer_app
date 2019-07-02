import 'package:flutter/widgets.dart';
import 'package:connecting/src/layer/layer.dart';
import 'package:connecting/src/map/map.dart';

abstract class MapPlugin {
  bool supportsLayer(LayerOptions options);

  Widget createLayer(
      LayerOptions options, MapState mapState, Stream<Null> stream);
}
