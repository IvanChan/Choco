//
//  CocoaDebugTools.h
//
//  Created by Chan Ivan on 10/8/13.
//
//

#import <Foundation/Foundation.h>

@interface CocoaDebugTools : NSObject

@end

//打印对象的所有成员的值
extern void pVarsValue(int pointer);

//打印类的相关信息（成员、类方法、实例方法）
extern void pClassInfo(const char* className);

//打印类的成员
extern void pVars(const char* className);

//打印类的所有方法
extern void pMethods(const char* className);

//打印类的实例方法
extern void pInstanceMethods(const char* className);

//打印类的类方法
extern void pClassMethods(const char* className);

//模拟内存警告
extern void simulateMemoryWarning();
