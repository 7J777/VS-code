#import <Foundation/Foundation.h>

@interface DataGenerator : NSObject
+ (void)generateData:(NSString *)filename;
@end

@implementation DataGenerator
+ (void)generateData:(NSString *)filename {
    NSMutableArray *data = [NSMutableArray array];
    for (int i = 0; i < 10; i++) {
        NSDictionary *item = @{@"id": @(i), @"value": @(arc4random_uniform(100))};
        [data addObject:item];
    }

    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:data options:NSJSONWritingPrettyPrinted error:nil];
    [jsonData writeToFile:filename atomically:YES];
    NSLog(@"Data generated and saved to %@", filename);
}
@end

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        [DataGenerator generateData:@"data.json"];
    }
    return 0;
}