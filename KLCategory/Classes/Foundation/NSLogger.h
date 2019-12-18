//
//  NSLogger.h
//  NSLogger
//
//  Created by Ghost on 2018/9/4.
//  Copyright © 2018 Company. All rights reserved.
//

#define LOG_LEVEL_NOLOG     99
#define LOG_LEVEL_ERROR     70
#define LOG_LEVEL_SUCCESS   60
#define LOG_LEVEL_WARNING   50
#define LOG_LEVEL_NOTICE    40
#define LOG_LEVEL_INFO      30
#define LOG_LEVEL_DEBUG     20
#define LOG_LEVEL_ALERT     10
#define LOG_LEVEL_VERBOSE   0

#ifdef __OPTIMIZE__
#define NSLogThreshold LOG_LEVEL_NOLOG      // Release
#else
#define NSLogThreshold LOG_LEVEL_VERBOSE    // Debug
#endif

#define _NSFile [[NSString stringWithUTF8String:__FILE__] lastPathComponent]
#define _NSLine __LINE__
#define _NSFunc __func__

#define NSControlledLog(level, ...)\
if (level >= NSLogThreshold) { NSLog(__VA_ARGS__); }

#define NSFormattedLog(level, tag, format, ...) \
NSControlledLog(level, @"%@ %s Line:%d\n%@: %@", _NSFile, _NSFunc, _NSLine, tag, [NSString stringWithFormat:(format), ##__VA_ARGS__])

#if NSLogThreshold <= LOG_LEVEL_ERROR
#define NSLogError(...) NSFormattedLog(LOG_LEVEL_ERROR, @"\t❎❎❎\t", __VA_ARGS__)
#else
#define NSLogError(...)
#endif

#if NSLogThreshold <= LOG_LEVEL_SUCCESS
#define NSLogSuccess(...) NSFormattedLog(LOG_LEVEL_SUCCESS, @"\t✅✅✅\t", __VA_ARGS__)
#else
#define NSLogSuccess(...)
#endif

#if NSLogThreshold <= LOG_LEVEL_WARNING
#define NSLogWarning(...) NSFormattedLog(LOG_LEVEL_WARNING, @"\t⚠️⚠️⚠️\t", __VA_ARGS__)
#else
#define NSLogWarning(...)
#endif

#if NSLogThreshold <= LOG_LEVEL_NOTICE
#define NSLogNotice(...) NSFormattedLog(LOG_LEVEL_NOTICE, @"\t🔔🔔🔔\t", __VA_ARGS__)
#else
#define NSLogNotice(...)
#endif

#if NSLogThreshold <= LOG_LEVEL_INFO
#define NSLogInfo(...) NSFormattedLog(LOG_LEVEL_INFO, @"\t♻️♻️♻️\t", __VA_ARGS__)
#else
#define NSLogInfo(...)
#endif

#if NSLogThreshold <= LOG_LEVEL_DEBUG
#define NSLogDebug(...) NSFormattedLog(LOG_LEVEL_DEBUG, @"\t🐝🐝🐝\t", __VA_ARGS__)
#else
#define NSLogDebug(...)
#endif

#if NSLogThreshold <= LOG_LEVEL_VERBOSE
#define NSLogVerbose(...) NSFormattedLog(LOG_LEVEL_VERBOSE, @"\t🐠🐠🐠\t", __VA_ARGS__)
#else
#define NSLogVerbose(...)
#endif

#if NSLogThreshold <= LOG_LEVEL_ALERT
#define NSLogAlert(...) \
^(){\
    NSFormattedLog(LOG_LEVEL_ALERT, @"\t🐳🐳🐳\t", __VA_ARGS__);\
    UIAlertController *vc = [UIAlertController alertControllerWithTitle:@"🐳🐳🐳\n" message:[NSString stringWithFormat:__VA_ARGS__] preferredStyle:UIAlertControllerStyleAlert];\
    UIAlertAction *cancle = [UIAlertAction actionWithTitle:@"Cancle" style:UIAlertActionStyleDestructive handler:nil];\
    [vc addAction:cancle];\
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{\
        [UIApplication.sharedApplication.keyWindow.rootViewController presentViewController:vc animated:YES completion:nil];\
    });\
}()
#else
#define NSLogAlert(...)
#endif
