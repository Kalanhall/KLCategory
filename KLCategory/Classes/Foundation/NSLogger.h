//
//  NSLogger.h
//  NSLogger
//
//  Created by Ghost on 2018/9/4.
//  Copyright © 2018 Company. All rights reserved.
//

#define LOG_LEVEL_NOLOG     99
#define LOG_LEVEL_ERROR     60
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
#define NSLogError(...) NSFormattedLog(LOG_LEVEL_ERROR, @"\t❌❌❌\tError", __VA_ARGS__)
#else
#define NSLogError(...)
#endif

#if NSLogThreshold <= LOG_LEVEL_WARNING
#define NSLogWarn(...) NSFormattedLog(LOG_LEVEL_WARNING, @"\t⚠️⚠️⚠️\tWarning", __VA_ARGS__)
#else
#define NSLogWarn(...)
#endif

#if NSLogThreshold <= LOG_LEVEL_NOTICE
#define NSLogNotice(...) NSFormattedLog(LOG_LEVEL_NOTICE, @"\t📣📣📣\tNotice", __VA_ARGS__)
#else
#define NSLogNotice(...)
#endif

#if NSLogThreshold <= LOG_LEVEL_INFO
#define NSLogInfo(...) NSFormattedLog(LOG_LEVEL_INFO, @"\t✉️✉️✉️\tInfo", __VA_ARGS__)
#else
#define NSLogInfo(...)
#endif

#if NSLogThreshold <= LOG_LEVEL_DEBUG
#define NSLogDebug(...) NSFormattedLog(LOG_LEVEL_DEBUG, @"\t🔥🔥🔥\tDebug", __VA_ARGS__)
#else
#define NSLogDebug(...)
#endif

#if NSLogThreshold <= LOG_LEVEL_VERBOSE
#define NSLogVerbose(...) NSFormattedLog(LOG_LEVEL_VERBOSE, @"\t😊😊😊\tVerbose", __VA_ARGS__)
#else
#define NSLogVerbose(...)
#endif

#if NSLogThreshold <= LOG_LEVEL_ALERT
#define NSLogAlert(...) \
^(){\
    NSFormattedLog(LOG_LEVEL_ALERT, @"\t🥺🥺🥺\tAlert", __VA_ARGS__);\
    UIAlertController *vc = [UIAlertController alertControllerWithTitle:@"Something To Do" message:[NSString stringWithFormat:__VA_ARGS__] preferredStyle:UIAlertControllerStyleAlert];\
    UIAlertAction *cancle = [UIAlertAction actionWithTitle:@"Cancle" style:UIAlertActionStyleDestructive handler:nil];\
    [vc addAction:cancle];\
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{\
        [self presentViewController:vc animated:YES completion:nil];\
    });\
}()
#else
#define NSLogAlert(...)
#endif
