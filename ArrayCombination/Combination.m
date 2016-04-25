//
//  Combination.m
//  aabcad
//
//  Created by CYJ on 16/4/9.
//  Copyright © 2016年 CYJ. All rights reserved.
//

#import "Combination.h"

@implementation Combination
/**
 *  排列组合算法
 *  @param array 需要排列的数组
 *  @param m     要几个一组
 *  @return 返回排好的数组
 */
- (NSMutableArray *)combination:(NSMutableArray *)array chooseCount:(int)m {
    NSInteger n = array.count;
    
    if (m > n){
        return nil;
    }
    
    NSMutableArray *allChooseArray = [NSMutableArray array];
    NSMutableArray *retArray = [array copy];
    //m=5 array = [@"1", @"2", @"3", @"4", @"5", @"6", @"7"]
    for(int i=0;i < n;i++){
        if (i < m){
            //array = [@"1", @"1", @"1", @"1", @"1", @"0", @"0"]
            [array replaceObjectAtIndex:i withObject:@"1"];
        } else{
            [array replaceObjectAtIndex:i withObject:@"0"];
        }
    }
    
    NSMutableArray *firstArray = [[NSMutableArray alloc] init];
    
    for(int i=0; i<n; i++){
        if ([[array objectAtIndex:i] intValue] == 1){
            //firstArray = [@"1", @"2", @"3", @"4", @"5"]
            [firstArray addObject:[retArray objectAtIndex:i]];
        }
    }
    [allChooseArray addObject:firstArray];
    
    int count = 0;
    for(int i = 0; i < n-1; i++){
        if ([[array objectAtIndex:i] intValue] == 1 && [[array objectAtIndex:(i + 1)] intValue] == 0){
            [array replaceObjectAtIndex:i withObject:@"0"];
            [array replaceObjectAtIndex:(i + 1) withObject:@"1"];
            
            for (int k = 0; k < i; k++){
                if ([[array objectAtIndex:k] intValue] == 1){
                    count ++;
                }
            }
            if (count > 0){
                for (int k = 0; k < i; k++){
                    if (k < count){
                        [array replaceObjectAtIndex:k withObject:@"1"];
                    } else {
                        [array replaceObjectAtIndex:k withObject:@"0"];
                    }
                }
            }
            
            
            NSMutableArray *middleArray = [[NSMutableArray alloc] init];
            
            for (int k = 0; k < n; k++){
                if ([[array objectAtIndex:k] intValue] == 1){
                    [middleArray addObject:[retArray objectAtIndex:k]];
                }
            }
            
            [allChooseArray addObject:middleArray];
            
            i = -1;
            count = 0;
        }
    }
    
    return allChooseArray;
}
@end
