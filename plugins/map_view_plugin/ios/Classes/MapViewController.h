#import <Flutter/Flutter.h>
#import <VisioMoveEssential/VisioMoveEssential.h>
// Defines map overlay controllable from Flutter.

@interface FLTMapViewController
    : NSObject <FlutterPlatformView>
- (instancetype)initWithFrame:(CGRect)frame
               viewIdentifier:(int64_t)viewId
                    arguments:(nullable id)args
                    registrar:(NSObject<FlutterPluginRegistrar> *)registrar;
@end

// Allows the engine to create new Map View instances.
@interface FLTMapViewFactory : NSObject <FlutterPlatformViewFactory>
- (instancetype)initWithRegistrar:(NSObject<FlutterPluginRegistrar> *)registrar;
@end
