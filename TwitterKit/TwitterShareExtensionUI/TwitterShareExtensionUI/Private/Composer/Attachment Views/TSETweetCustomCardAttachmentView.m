/*
 * Copyright (C) 2017 Twitter, Inc.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 *
 */

#import "TSETweetAttachment.h"
#import "TSETweetCustomCardAttachmentView.h"

@interface TSETweetCustomCardAttachmentView ()

@property (nonatomic, nonnull, readonly) id<TSETweetAttachmentCustomCardViewProvider> attachment;

@end

@implementation TSETweetCustomCardAttachmentView

- (instancetype)initWithCustomCardAttachment:(id<TSETweetAttachmentCustomCardViewProvider>)attachment
{
    NSParameterAssert(attachment);

    if ((self = [super init])) {
        _attachment = attachment;

        [self addSubview:attachment.embeddedCardView];
    }

    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];

    self.attachment.embeddedCardView.frame = self.bounds;
}

- (CGSize)intrinsicContentSize
{
    return self.attachment.embeddedCardView.intrinsicContentSize;
}

@end