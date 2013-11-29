//
//  CocoaDebugTools.m
//
//  Created by Chan Ivan on 10/8/13.
//
//

#import "CocoaDebugTools.h"
#import <objc/runtime.h>

@implementation CocoaDebugTools


@end

#pragma mark - Private Methods
const char* typeEncodeToString(const char* type)
{
    bool missingTypeEncode = false;
    const char *result = "";
    if (strcmp(type, "c") == 0)
    {
        result = "char";
    }
    else if (strcmp(type, "i") == 0)
    {
        result = "int";
    }
    else if (strcmp(type, "s") == 0)
    {
        result = "short";
    }
    else if (strcmp(type, "l") == 0)
    {
        result = "long";
    }
    else if (strcmp(type, "q") == 0)
    {
        result = "long long";
    }
    else if (strcmp(type, "C") == 0)
    {
        result = "unsigned char";
    }
    else if (strcmp(type, "I") == 0)
    {
        result = "unsigned int";
    }
    else if (strcmp(type, "S") == 0)
    {
        result = "unsigned short";
    }
    else if (strcmp(type, "L") == 0)
    {
        result = "unsigned long";
    }
    else if (strcmp(type, "Q") == 0)
    {
        result = "unsigned long long";
    }
    else if (strcmp(type, "f") == 0)
    {
        result = "float";
    }
    else if (strcmp(type, "d") == 0)
    {
        result = "double";
    }
    else if (strcmp(type, "B") == 0)
    {
        result = "bool";
    }
    else if (strcmp(type, "v") == 0)
    {
        result = "void";
    }
    else if (strcmp(type, "Vv") == 0)
    {
        result = "oneway void";
    }
    else if (strcmp(type, "*") == 0)
    {
        result = "char *";
    }
    else if (strcmp(type, "@") == 0)
    {
        result = "id";
    }
    else if (strcmp(type, "#") == 0)
    {
        result = "Class";
    }
    else if (strcmp(type, ":") == 0)
    {
        result = "SEL";
    }
    else if (strcmp(type, "[array type]") == 0)
    {
        result = "array";
    }
    else if (strcmp(type, "bnum") == 0)
    {//A bit field of num bit
        result = "bit";
    }
    else if (strcmp(type, "^type") == 0)
    {//A pointer to type
        result = "type";
    }
    else if (strcmp(type, "?") == 0)
    {//An unknown type (among other things, this code is used for function pointers)
        result = "unknown";
    }
    else
    {
        NSString *typeStr = [[NSString alloc] initWithUTF8String:type];
        if ([typeStr hasPrefix:@"{"]        //"{name=type...}"   structure
            || [typeStr hasPrefix:@"("]     //"(name=type...)"   union
            )
        {
            NSRange range = [typeStr rangeOfString:@"="];
            if (range.location != NSNotFound)
            {
                NSRange typeRange = {1, range.location - 1};
                
                result = [[typeStr substringWithRange:typeRange] UTF8String];
            }
            else
            {
                missingTypeEncode = true;
            }
        }
        else if ([typeStr hasPrefix:@"^"])  //^type
        {
            NSRange range = [typeStr rangeOfString:@"="];
            if (range.location != NSNotFound)
            {
                NSRange typeRange = {2, range.location - 2};
                
                result = [[typeStr substringWithRange:typeRange] UTF8String];
            }
            else
            {
                const char *realType = typeEncodeToString([[typeStr substringFromIndex:1] UTF8String]);
                result = [[NSString stringWithFormat:@"%s *",realType] UTF8String];
            }
        }
        else if ([typeStr hasPrefix:@"@\""])  //@"type"
        {
            NSRange typeRange = {2, [typeStr length] - 3};
            
            result = [[typeStr substringWithRange:typeRange] UTF8String];
        }
        else if ([typeStr hasPrefix:@"@"])  //@?
        {
            result = "id";
        }
        else
        {//
            missingTypeEncode = true;
            
        }
        [typeStr release];
    }
    
    if (missingTypeEncode)
    {
        result = type;
    }
    
    return result;
}

void _printVars(const char* className)
{
    Class cls = objc_getClass(className);
    
    unsigned int varCount = 0;
    Ivar *vars = class_copyIvarList(cls, &varCount);
    
    printf("{\n");
    
    for(int i = 0; i < varCount; i++)
    {
        const char *varEncode = ivar_getTypeEncoding(vars[i]);
        const char *varName = ivar_getName(vars[i]);
        
        printf("\t %-30s \t %s\n", typeEncodeToString(varEncode), varName);
    }
    
    printf("}\n\n");
}

void _printMethods(Class cls)
{
    unsigned int methodCount = 0;
    BOOL isMeta = class_isMetaClass(cls);
    char methodPrefix = isMeta ? '+' : '-';
    Method *methods = class_copyMethodList([cls class], &methodCount);
    for (int i = 0; i < methodCount; i++)
    {
        NSMutableString *methodStr = [[NSMutableString alloc] init];
        
        //Return Type
        char *returnType = method_copyReturnType(methods[i]);
        [methodStr appendFormat:@"%c (%s)",methodPrefix, typeEncodeToString(returnType)];
        
        //Get SEL Name & divide into array by ":"
        const char *selName = sel_getName(method_getName(methods[i]));
        NSString *selStr = [[NSString alloc] initWithUTF8String:selName];
        NSArray *selArray = [selStr componentsSeparatedByString:@":"];
        [selStr release];
        
        //Arguments
        char buffer[256];
        unsigned int numberOfArguments = method_getNumberOfArguments(methods[i]);
        if (numberOfArguments <= 2)
        {//skip the caller & selector itself
            [methodStr appendString:[selArray objectAtIndex:0]];
        }
        else
        {//arguments
            for(int j = 2; j < numberOfArguments; j++)
            {
                method_getArgumentType(methods[i], j, buffer, 256);
                [methodStr appendFormat:@"%@:(%s)arg%d ",[selArray objectAtIndex:j-2], typeEncodeToString(buffer), j-2];
            }
        }
        
        printf("%s; \n", [methodStr UTF8String]);
        
        [methodStr release];
        free(returnType);
    }
    free(methods);
}

#pragma mark - Print Methods
void pVarsValue(int pointer)
{
    id obj = (id)pointer;
    Class cls = [obj class];
    
    unsigned int varCount = 0;
    Ivar *vars = class_copyIvarList(cls, &varCount);
    
    printf("{\n");
    
    for(int i = 0; i < varCount; i++)
    {
        const char *varEncode = ivar_getTypeEncoding(vars[i]);
        const char *varName = ivar_getName(vars[i]);
        
        void *var = 0;
        object_getInstanceVariable(obj, varName, &var);
        
        printf("\t %-25s  %-40s \t = \t %p \n", typeEncodeToString(varEncode), varName, var);

    }
    
    printf("}\n");
}


void pClassInfo(const char* className)
{
    printf("\n");
    printf("%s: \n", className);
    _printVars(className);
    
    pClassMethods(className);
    
    printf("\n");
    
    pInstanceMethods(className);
    
    printf("\n");
}

void pVars(const char* className)
{
    printf("%s: \n", className);
    _printVars(className);
}

void pMethods(const char* className)
{
    printf("%s: \n", className);
    
    pClassMethods(className);
    pInstanceMethods(className);
}

void pInstanceMethods(const char* className)
{
    Class cls = objc_getClass(className);
    _printMethods(cls);
}

void pClassMethods(const char* className)
{
    Class metaCls = objc_getMetaClass(className);
    _printMethods(metaCls);
    
}

#pragma mark - Memory
void simulateMemoryWarning()
{
    SEL sel = sel_registerName("_performMemoryWarning");
    if ([[UIApplication sharedApplication] respondsToSelector:sel])
    {
        [[UIApplication sharedApplication] performSelector:sel withObject:nil];
    }
    else
    {
        [[NSNotificationCenter defaultCenter] postNotificationName:UIApplicationDidReceiveMemoryWarningNotification object:nil];
    }
}
