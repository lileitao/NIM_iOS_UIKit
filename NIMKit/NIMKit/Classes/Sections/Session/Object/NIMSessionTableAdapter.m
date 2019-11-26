//
//  NIMSessionTableDelegate.m
//  NIMKit
//
//  Created by chris on 2016/11/7.
//  Copyright © 2016年 NetEase. All rights reserved.
//

#import "NIMSessionTableAdapter.h"
#import "NIMMessageModel.h"
#import "NIMMessageCellFactory.h"
#import "UIView+NIM.h"

@interface NIMSessionTableAdapter()

@property (nonatomic,strong) NIMMessageCellFactory *cellFactory;

@end

@implementation NIMSessionTableAdapter

- (instancetype)init
{
    self = [super init];
    if (self) {
        _cellFactory = [[NIMMessageCellFactory alloc] init];
    }
    return self;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.interactor items].count;
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = nil;
    id model = [[self.interactor items] objectAtIndex:indexPath.row];
    if ([model isKindOfClass:[NIMMessageModel class]]) {
        cell = [self.cellFactory cellInTable:tableView
                                   forMessageMode:model];
        cell.hidden = NO;
        [(NIMMessageCell *)cell setDelegate:self.delegate];
        [(NIMMessageCell *)cell refreshData:model];
        
        // llt如果是通知类消息 就隐藏；
        NIMMessageModel *msgModel = model;
        if (msgModel.message.messageType == NIMMessageTypeNotification) {
            cell.hidden = YES;
        }
    }
    else if ([model isKindOfClass:[NIMTimestampModel class]])
    {
        cell = [self.cellFactory cellInTable:tableView
                                     forTimeModel:model];
    }
    else
    {
        NSAssert(0, @"not support model");
    }
    return cell;
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if ([self.delegate respondsToSelector:@selector(tableView:willDisplayCell:forRowAtIndexPath:)])
    {
        [self.delegate tableView:tableView willDisplayCell:cell forRowAtIndexPath:indexPath];
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    CGFloat cellHeight = 0;
    id modelInArray = [[self.interactor items] objectAtIndex:indexPath.row];
    if ([modelInArray isKindOfClass:[NIMMessageModel class]])
    {
        NIMMessageModel *model = (NIMMessageModel *)modelInArray;
        
        CGSize size = [model contentSize:tableView.nim_width];
        CGFloat avatarMarginY = [model avatarMargin].y;
        
        UIEdgeInsets contentViewInsets = model.contentViewInsets;
        UIEdgeInsets bubbleViewInsets  = model.bubbleViewInsets;
        cellHeight = size.height + contentViewInsets.top + contentViewInsets.bottom + bubbleViewInsets.top + bubbleViewInsets.bottom;
        cellHeight = cellHeight > (model.avatarSize.height + avatarMarginY) ? cellHeight : model.avatarSize.height + avatarMarginY;
        // llt如果是通知类消息 就隐藏；
        if (model.message.messageType == NIMMessageTypeNotification) {
            cellHeight = 0;
        }
    }
    else if ([modelInArray isKindOfClass:[NIMTimestampModel class]])
    {
        cellHeight = [(NIMTimestampModel *)modelInArray height];
    }
    else
    {
        NSAssert(0, @"not support model");
    }
    return cellHeight;
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    [[UIMenuController sharedMenuController] setMenuVisible:NO animated:YES];
    CGFloat currentOffsetY = scrollView.contentOffset.y;
    if (currentOffsetY + scrollView.frame.size.height  > scrollView.contentSize.height\
        && scrollView.frame.size.height <= scrollView.contentSize.height && scrollView.isDragging) {
        [self.interactor pullUp];
    }
}

@end
