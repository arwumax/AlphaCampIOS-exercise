//
//  AboutVC.m
//  ALPHAcamp-App-Parse
//
//  Created by Tank Lin on 2015/7/1.
//  Copyright (c) 2015年 Tank Lin. All rights reserved.
//

#import "AboutVC.h"

@interface AboutVC () <UIGestureRecognizerDelegate>
{
    int nextView;
    int segmentFather;
    int segmentSon;
}

@end

@implementation AboutVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.titleView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"alpha-logo-titleview.png"]];
    
    
    nextView = 0;
    segmentFather = 0;
    segmentSon = 0;
    
    /// Dictionary-1 Member
    dictMemberA = @{
                    @"photo": [UIImage imageNamed:@"Bernard"],
                    @"name": @"Bernard Chan",
                    @"text": @"ALPHA Camp 創辦人。TMI 駐場創業家，曾任 Yahoo！亞太區廣告業務總監。美國MIT大學創業論壇mentor",
                    };
    dictMemberB = @{
                    @"photo": [UIImage imageNamed:@"Frank"],
                    @"name": @"陳建銘 | Frank Chen",
                    @"text": @"前 Yahoo! 奇摩董事總經理。以開放創新與策略合作不斷創造具規模經濟的商業模式",
                    };
    dictMemberC = @{
                    @"photo": [UIImage imageNamed:@"Mark"],
                    @"name": @"許安德 | Mark Hsu",
                    @"text": @"創投 Pinehurst Advisors 合夥人 & 新浪網及 KKbox 的共同創辦人。活躍天使投資人",
                    };
    
    /// Dictionary-1 Teacher
    dictTeacherA = @{
                     @"photo": [UIImage imageNamed:@"ihower"],
                     @"name": @"iHower Chang",
                     @"text": @"Ruby on Rails 實戰聖經作者，前 Faria Systems CTO，多次 COSCUP、OSDC.TW、台灣與中國RubyCong、日本RubyKaigi 大會講者",
                     };
    dictTeacherB = @{
                     @"photo": [UIImage imageNamed:@"Shyne"],
                     @"name": @"Shyne Tseng",
                     @"text": @"GetProperly 共同創辦人，台大資管MBA，史丹佛大學電腦科學碩士，旅居矽谷，愛好旅行、美食和科技",
                     };
    dictTeacherC = @{
                     @"photo": [UIImage imageNamed:@"Brain"],
                     @"name": @"方鶴 | Brian Fang",
                     @"text": @"FUNTEK軟體架構師，5945呼叫師傅共同創辦人，前CyberLink資深工程師。作品Picaca獲選為Apple featured app (2013/08)，暢銷書《iPhone SDK 3 Programming 應用程式開發》作者",
                     };
    
    /// Dictionary-2 OldSchool
    dictOldschoolA = @{
                       @"photo": [UIImage imageNamed:@"Abby"],
                       @"name": @"Abby Hsu",
                       @"text": @"渴望突破體制內教育的大三生，在自我探索的過程中夾雜著迷惘與孤單，靠著網路的學習資源、媒體、各式專業書籍，逐漸理出自己的未來規劃，因此決定報名 Bootcamp，希望能藉由課程接觸網路新創的世界，培養數位行銷的專業能力，朝自己的夢想邁進。",
                       };
    dictOldschoolB = @{
                       @"photo": [UIImage imageNamed:@"Kung"],
                       @"name": @"Kung",
                       @"text": @"台大獸醫研究所畢業，從台北到南部從事大動物獸醫師的工作，在全台灣各個牧場出診照顧乳牛，但是在傳統的行業當中卻期待能夠擁有新創的思維，開啟一條不一樣的路。來到 ALPHA Camp 學習一顆靈活的行銷頭腦，期待成為改變產業的橋樑。",
                       };
    dictOldschoolC = @{
                       @"photo": [UIImage imageNamed:@"Anthony"],
                       @"name": @"Anthony Liu",
                       @"text": @"伊利諾大學香檳分校物理系，退伍後放棄到美國念研究所的機會，專心投注於自己開發的通訊輔助 app，希望透過 ALPHA Camp 認識更多有志創業的夥伴，激盪彼此想法，並學習數位行銷為未來的創業之路做準備。",
                       };
    
    /// Array
    arrayPeople0 = @[dictMemberA, dictMemberB, dictMemberC];
    arrayPeople1 = @[dictTeacherA, dictTeacherB, dictTeacherC];
    arrayPeople2 = @[dictOldschoolA, dictOldschoolB, dictOldschoolC];
    
    
    
    /// Array包三個Array
    arraySegment = @[arrayPeople0, arrayPeople1, arrayPeople2];
    [self viewData:arrayPeople0[segmentSon]];
    
    
    
    
    
    /// Swipe Right
    UISwipeGestureRecognizer *swipeViewRight = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(swipeRight)];
    //    swipeViewRight.delegate = self;
    swipeViewRight.direction = UISwipeGestureRecognizerDirectionRight;
    [self.view addGestureRecognizer:swipeViewRight];
    /// Swipe Left
    UISwipeGestureRecognizer *swipeViewLeft = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(swipeLeft)];
    //    swipeViewLeft.delegate = self;
    swipeViewLeft.direction = UISwipeGestureRecognizerDirectionLeft;
    [self.view addGestureRecognizer:swipeViewLeft];

}

/// Swipe Right Method
- (void)swipeRight {
    nextView++;
    if (nextView == [arraySegment count]) {
        nextView = 0;
    }
    [self viewData:arraySegment[segmentFather][nextView]];
    //    NSLog(@"往右滑:第%i個", nextView);
}
/// Swipe Right Method
- (void)swipeLeft {
    if (nextView>0){
        nextView--;
    }else{
        nextView = (int)arraySegment.count-1;
    }
    [self viewData:arraySegment[segmentFather][nextView]];
    //    NSLog(@"往左滑:前%i頁", nextView);
    
}


/// 中間"圖片"."名字"."描述"區塊
- (void)viewData :(NSDictionary *) dict{
    self.peopleView.image = [dict valueForKey:@"photo"];
    self.nameLabel.text = [dict valueForKey:@"name"];
    self.textView.text = [dict valueForKey:@"text"];
}



/// Next 下一頁
- (IBAction)buttonNext:(id)sender {
    nextView++;
    if (nextView == [arraySegment count]) {
        nextView = 0;
    }
    [self viewData:arraySegment[segmentFather][nextView]];
    //    NSLog(@"往前:第%i個", nextView);
    
}
/// Previous 前一頁
- (IBAction)buttonPrevious:(id)sender {
    if (nextView>0){
        nextView--;
    }else{
        nextView = (int)arraySegment.count-1;
    }
    [self viewData:arraySegment[segmentFather][nextView]];
    //    NSLog(@"往後:第%i個 ", nextView);
}



-(void)loadData:(int)changeNumber withGroup:(int)groupNumber{
    
    self.peopleView.image = arraySegment[segmentFather][segmentSon][@"photo"];
    self.nameLabel.text = arraySegment[segmentFather][segmentSon][@"name"];
    self.textView.text = arraySegment[segmentFather][segmentSon][@"text"];
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)changeSegment:(id)sender {
    UISegmentedControl *segmentSwitch = sender;
    if (segmentSwitch.selectedSegmentIndex == 0) {
        segmentFather = 0;
        [self loadData:segmentSon withGroup:segmentFather];
    }
    else if (segmentSwitch.selectedSegmentIndex == 1) {
        segmentFather = 1;
        [self loadData:segmentSon withGroup:segmentFather];
    }
    else if (segmentSwitch.selectedSegmentIndex == 2) {
        segmentFather = 2;
        [self loadData:segmentSon withGroup:segmentFather];
    }
}
@end
