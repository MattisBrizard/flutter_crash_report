#import "MapViewPlugin.h"

@implementation FLTMapViewPlugin{
  NSObject<FlutterPluginRegistrar>* _registrar;
  FlutterMethodChannel* _channel;
}

+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
    FLTMapViewFactory* mapViewFactory = [[FLTMapViewFactory alloc] initWithRegistrar:registrar];
    [registrar registerViewFactory:mapViewFactory withId:@"plugins.fnow.com/map_view"];
}
@end
