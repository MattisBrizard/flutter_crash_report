#import "MapViewController.h"

@implementation FLTMapViewFactory {
  NSObject<FlutterPluginRegistrar>* _registrar;
}

- (instancetype)initWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  self = [super init];
  if (self) {
    _registrar = registrar;
  }
  return self;
}

- (NSObject<FlutterMessageCodec>*)createArgsCodec {
  return [FlutterStandardMessageCodec sharedInstance];
}

- (NSObject<FlutterPlatformView>*)createWithFrame:(CGRect)frame
                                   viewIdentifier:(int64_t)viewId
                                        arguments:(id _Nullable)args {
  return [[FLTMapViewController alloc] initWithFrame:frame
                                        viewIdentifier:viewId
                                         arguments:args
                                         registrar:_registrar];
}

@end



@implementation FLTMapViewController {
  VMEMapView* _mapView;
  int64_t _viewId;
  FlutterMethodChannel* _channel;
  NSObject<FlutterPluginRegistrar>* _registrar;
}

- (instancetype)initWithFrame:(CGRect)frame
               viewIdentifier:(int64_t)viewId
                    arguments:(id _Nullable)args
                    registrar:(NSObject<FlutterPluginRegistrar>*)registrar {
    if (self = [super init]) {
        _viewId = viewId;
        _registrar = registrar;
        NSString* mapHash = args[@"hash"];
        if (mapHash == nil) return nil;
        _mapView = [[VMEMapView alloc] initWithFrame:frame];
        [_mapView setMapHash:mapHash];
        [_mapView loadMap];
      }
      return self;
}

- (UIView*)view {
    return _mapView;
}
@end
