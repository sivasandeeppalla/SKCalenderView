//
//  ViewController.m
//  SKCalenderView
//
//  Created by developer1 on 29/09/15.
//  Copyright (c) 2015 developer1. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UICollectionViewDelegate,UICollectionViewDataSource>
{
    NSMutableArray*DayslistArray;
    int StartingDay,DateInCalender;
    NSUInteger numberOfDaysInMonth;
    NSMutableArray *monthArray;
    int CurrentMonth,CUrrentYear;
    int ChangingMonth,changingYear;
    NSMutableArray *AvalableDates;
    NSMutableArray*mainDatesArray;
    NSMutableArray*MonthArray;
    NSMutableArray*DateArray;
    
    
    NSMutableArray *DatesArray;
    NSMutableArray*BookedDates;
    NSMutableArray*BookedDatesDays;
    NSMutableArray *SelectDateArrayFormCalender;
    
    
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    DayslistArray=[[NSMutableArray alloc]initWithObjects:@"Sun",@"Mon",@"Tue",@"Wed",@"Thu",@"Fri",@"Sat", nil];
    
    DateInCalender=1;
    SelectDateArrayFormCalender=[[NSMutableArray alloc]init];
    
    AvalableDates=[[NSMutableArray alloc]initWithObjects:
                   @"01/09/2015",
                   @"02/09/2015",
                   @"03/09/2015",
                   @"04/09/2015",
                   @"05/09/2015",
                   @"06/09/2015",
                   @"07/09/2015",
                   @"08/09/2015",
                   @"09/09/2015",
                @"30/09/2015",
                @"01/10/2015",
                @"02/10/2015",
                @"03/10/2015",
                @"04/10/2015",
                @"05/10/2015",
                @"06/10/2015",
                @"07/10/2015",
                @"08/10/2015",
                @"09/10/2015",
                @"10/10/2015",
                @"11/10/2015",
                @"12/10/2015",
                @"13/10/2015",
                @"21/10/2015",
                @"22/10/2015",
                @"23/10/2015",
                @"24/10/2015",
                @"25/10/2015",
                @"26/10/2015",
                @"27/10/2015",
                @"28/10/2015",
                @"29/10/2015",
                @"30/10/2015",
                @"31/10/2015",
                @"01/11/2015",
                @"09/11/2015",
                @"10/11/2015",
                @"11/11/2015",
                @"12/11/2015",
                @"13/11/2015",
                @"14/11/2015",
                @"15/11/2015",
                @"16/11/2015",
                @"17/11/2015",
                @"18/11/2015",
                @"19/11/2015",
                @"20/11/2015",
                @"21/11/2015",
                @"22/11/2015",
                @"23/11/2015",
                @"24/11/2015",
                @"25/11/2015", nil];
    
    
    BookedDates=[[NSMutableArray alloc]initWithObjects:
                 @"12/09/2015",
                 @"13/09/2015",
                 @"14/09/2015",
                 @"15/09/2015",
                 @"19/09/2015",
                 @"20/09/2015",
                 @"22/09/2015",
                 @"23/09/2015",
                 @"24/09/2015",
                 @"30/09/2015",
                 @"14/10/2015",
                 @"15/10/2015",
                 @"16/10/2015",
                 @"17/10/2015",
                 @"18/10/2015",
                 @"19/10/2015",
                 @"20/10/2015",
                @"02/11/2015",
                 @"03/11/2015",
                 @"04/11/2015",
                 @"05/11/2015",
                 @"06/11/2015",
                 @"07/11/2015",
                 @"08/11/2015",
              nil];
    
    
    DatesArray=[[NSMutableArray alloc]init];
    BookedDatesDays=[[NSMutableArray alloc]init];

    
    for (NSString*STR in AvalableDates)
    {
        
        NSLog(@"str is %@",STR);
        
        NSArray*SPiltArray=[STR componentsSeparatedByString:@"/"];
        NSLog(@"split array is %@",SPiltArray);
        
        
        if ([[SPiltArray objectAtIndex:1] intValue]==ChangingMonth)
        {
            [DatesArray addObject:[SPiltArray objectAtIndex:0]];
        }
        
        
    }
    for (NSString*STR in BookedDates)
    {
        
        NSLog(@"str is %@",STR);
        
        NSArray*SPiltArray=[STR componentsSeparatedByString:@"/"];
        NSLog(@"split array is %@",SPiltArray);
        
        
        if ([[SPiltArray objectAtIndex:1] intValue]==ChangingMonth)
        {
            [BookedDatesDays addObject:[SPiltArray objectAtIndex:0]];
        }
        
        
    }
    



    
    
    
    
    // number of days
    monthArray=[[NSMutableArray alloc]init];
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    NSDate           *today           = [NSDate date];
    NSCalendar       *currentCalendar = [NSCalendar currentCalendar];
    NSDateComponents *yearComponents  = [currentCalendar components:NSYearCalendarUnit  fromDate:today];
    int currentYear  = [yearComponents year];
    for(int months = 0; months < 12; months++)
    {
        NSString *monthName = [NSString stringWithFormat:@"%@ %i",[[dateFormatter monthSymbols]objectAtIndex: months],currentYear];
        NSLog(@"%@ %i",[[dateFormatter monthSymbols]objectAtIndex: months],currentYear);
        [monthArray addObject:monthName];
    }
    
    // month day and year
    
    
    NSDate *currentDate = [NSDate date];
    NSCalendar* calendar = [NSCalendar currentCalendar];
    NSDateComponents* components = [calendar components:NSYearCalendarUnit|NSMonthCalendarUnit|NSDayCalendarUnit fromDate:currentDate]; // Get necessary date components
    
    [components month]; //gives you month
    [components day]; //gives you day
    [components year];
    
    NSLog(@"thi is called the components %@",components);
    
    CurrentMonth=(int)[components month];
    CUrrentYear=(int)[components year];
    ChangingMonth=CurrentMonth;
    changingYear=CUrrentYear;
    
    
    
    _month_Name.text=[monthArray objectAtIndex:[components month]-1];
    
    
    
    
    
    //number of days
    
    NSCalendar *cal = [NSCalendar currentCalendar];
    NSRange range = [cal rangeOfUnit:NSDayCalendarUnit inUnit:NSMonthCalendarUnit forDate:[NSDate date]];
    numberOfDaysInMonth = range.length;
    
    NSLog(@"this is called the comp %lu",(unsigned long)numberOfDaysInMonth);
    
    
    //Starting day
    
    NSString *finalDate = [NSString stringWithFormat:@"01-%ld-%ld 20:54:18",(long)[components month],[components year]];
    
    // Prepare an NSDateFormatter to convert to and from the string representation
    NSDateFormatter *dateFormatter12 = [[NSDateFormatter alloc] init];
    
    // ...using a date format corresponding to your date
    [dateFormatter12 setDateFormat:@"dd-MM-yyyy HH:mm:ss"];
    
    // Parse the string representation of the date
    NSDate *date = [dateFormatter12 dateFromString:finalDate];
    
    // Write the date back out using the same format
    NSLog(@"Month %@",[dateFormatter12 stringFromDate:date]);
    
    
    
    NSTimeZone *tz = [NSTimeZone defaultTimeZone];
    NSInteger seconds = [tz secondsFromGMTForDate: date];
    NSDate* selectedCurentDate=[NSDate dateWithTimeInterval: seconds sinceDate: date];
    
    NSDate *today1 = [NSDate date];
    NSDateFormatter *dateFormatter1 = [[NSDateFormatter alloc] init];
    //[dateFormatter setDateFormat:@"MM/dd/yyyy"];
    [dateFormatter1 setTimeStyle:NSDateFormatterLongStyle];
    NSString *currentTime = [dateFormatter1 stringFromDate:today1];
    
    NSLog(@"User's current time in their preference format:%@",currentTime);
    
    
    NSString *stringDate =[NSString stringWithFormat:@"%@",selectedCurentDate];
    NSDateFormatter *dateFormatter11 = [[NSDateFormatter alloc] init];
    [dateFormatter11 setDateFormat:@"yyyy-MM-dd HH:mm:ss +0000"];
    NSLog(@"newDate format:%@",stringDate);
    
    NSDate *date11  = [dateFormatter11 dateFromString:stringDate];
    NSLog(@"newDate format:%@",date11);
    
    
    
    
    
    
    NSCalendar *gregorian = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
    
    
    NSDateComponents *comps1 = [gregorian components:NSWeekdayCalendarUnit fromDate:date11];
    int weekday = [comps1 weekday];
    StartingDay=weekday;
    NSLog(@"this is called the super raja %d",StartingDay);

    [_calenderColl reloadData];
    
    // Do any additional setup after loading the view, typically from a nib.
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 2;
}
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    if (section==0)
    {
        return 7;
    }
    else
    {
        NSLog(@"this is calle dthe rows %lu",numberOfDaysInMonth+StartingDay-1);
        return numberOfDaysInMonth+StartingDay-1;
        
    }
    
    return YES;
}
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    float width1=0,Height=0;
    
    
    
    width1=(_calenderColl.bounds.size.width-7)/7;
    
    width1=width1;
    
    Height=25;
    return CGSizeMake(width1, Height);
    
}
- (UIEdgeInsets)collectionView:(UICollectionView*)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
    int left=0,right=0;
    if (section==0)
    {
        left=0;
        right=0;
    }else
    {
        left=0;
        right=0;
    }
    return UIEdgeInsetsMake(1, left, 0, right);
}
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionView *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section
{
    if (section==0)
    {
        return 0;
    }else
    {
        return 0;
    }
    return YES;
    // This is the minimum inter item spacing, can be more
}

-(UICollectionViewCell*)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewCell *Cell;
    if (Cell==nil)
    {
        static NSString *identifier = @"CalenderCell";
        
        Cell= [collectionView dequeueReusableCellWithReuseIdentifier:identifier forIndexPath:indexPath];
        
    }
    
    
    for (UIView *obj in Cell.subviews)
    {
        if ([obj isKindOfClass:[UIView class]]) {
            [obj removeFromSuperview];
        }
    }
    
    float width1=0;
    
    
    Cell.layer.borderColor=[[UIColor colorWithRed:6/255.0 green:114/255.0 blue:234/255.0 alpha:1] CGColor];
    Cell.layer.borderWidth=0.5;
    Cell.clipsToBounds=YES;
    
    width1=(_calenderColl.bounds.size.width-7)/7;
    if (indexPath.section==0)
    {
        Cell.backgroundColor=[UIColor colorWithRed:236/255.0 green:236/255.0 blue:236/255.0 alpha:1];
        
        UILabel *dayName=[[UILabel alloc]initWithFrame:CGRectMake(1, 5, width1-2, 15)];
        NSLog(@"this is valle the %@ ",dayName.text);
        
        dayName.font=[UIFont fontWithName:@"Arial" size:11.0];
        dayName.text=[DayslistArray objectAtIndex:indexPath.row];
        dayName.textAlignment=NSTextAlignmentCenter;
        
        UIView *DayView=[[UIView alloc]initWithFrame:CGRectMake(0, 0,width1 , 25 )];
        
        
        [DayView addSubview:dayName];
        [Cell addSubview:DayView];
        
    }
    else    if (indexPath.section==1)
        
    {
        UIView *DayView=[[UIView alloc]initWithFrame:CGRectMake(0, 0,width1 , 25)];
        
        Cell.backgroundColor=[UIColor colorWithRed:206/255.0 green:215/255.0 blue:236/255.0 alpha:1];
        
        UILabel *date=[[UILabel alloc]initWithFrame:CGRectMake(1, 5, width1-2, 15)];
        date.font=[UIFont fontWithName:@"Arial" size:11.0];
        
        date.textAlignment=NSTextAlignmentCenter;
        
        
        
        DayView.backgroundColor=[UIColor colorWithRed:206/255.0 green:215/255.0 blue:236/255.0 alpha:1];
        
        NSLog(@"index pathi is dofhaeofbge %ld %ld",(long)indexPath.item, (long)DateInCalender);
        
        
        
        
        
        
        if (StartingDay-1>indexPath.row)
            
        {
            [DayView removeFromSuperview];
        }
        
        else if (StartingDay-1<=indexPath.row)
        {
            
            
            NSLog(@"date is this %d   %d",DateInCalender,StartingDay);
            
            NSString *DateStr;
            if (DateInCalender<=9)
            {
                DateStr =[NSString stringWithFormat:@"0%d",DateInCalender];
            }else
            {
                DateStr=[NSString stringWithFormat:@"%d",DateInCalender];
            }
            NSLog(@"dats is %@",DateStr);
            
            
            
            
          if ([DatesArray containsObject:DateStr])
            {
                
                
                date.text=[NSString stringWithFormat:@"%d",DateInCalender];

          
                NSLog(@"date is this %d   %d",DateInCalender,StartingDay);
                
                
                
                
                DayView.backgroundColor=[UIColor colorWithRed:164/255.0 green:230/255.0 blue:0/255.0 alpha:1];
                
                
                
                date.text=[NSString stringWithFormat:@"%d",DateInCalender];
                [SelectDateArrayFormCalender addObject:[NSString stringWithFormat:@"%d",DateInCalender]];
                
                
                
                
                
                
            }
            else if ([BookedDatesDays containsObject:DateStr])
            {
                DayView.backgroundColor=[UIColor colorWithRed:200/255.0 green:49/255.0 blue:38/255.0  alpha:1];
                date.text=[NSString stringWithFormat:@"%d",DateInCalender];
                [SelectDateArrayFormCalender addObject:[NSString stringWithFormat:@"%d",DateInCalender]];
            }
            else
            {
                
                
                
                
                
                DayView.backgroundColor=[UIColor colorWithRed:206/255.0 green:215/255.0 blue:236/255.0 alpha:1];
                
                NSString *hello=[NSString stringWithFormat:@"%d",DateInCalender];
                NSMutableAttributedString *attributeString = [[NSMutableAttributedString alloc] initWithString:[NSString stringWithFormat: @"%@",hello]];
                [attributeString addAttribute:NSStrikethroughStyleAttributeName
                                        value:@2
                                        range:NSMakeRange(0, [hello length])];
                
                
                [attributeString addAttribute:NSForegroundColorAttributeName value:[UIColor lightGrayColor] range:NSMakeRange(0, attributeString.length)];
                
                date.attributedText=attributeString;
                
                [SelectDateArrayFormCalender addObject:[NSString stringWithFormat:@"%d",DateInCalender]];
                
            }
          
            
            
            
            
            
            
            [DayView addSubview:date];
            [Cell addSubview:DayView];
            
            
            
        }
        
        
        
        
        
        
        if (StartingDay-1<=indexPath.row)
        {
            
            if (numberOfDaysInMonth+StartingDay-1 > indexPath.row)
            {
                DateInCalender++;
            }
            
        }
        
        if (StartingDay-1>indexPath.row)
            
        {
            [DayView removeFromSuperview];
        }
        
        
        
        
    }
    
    
    return Cell;
    
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section==0)
    {
        
    }
    else if (indexPath.section==1)
    {
        if (indexPath.item<StartingDay-1)
        {
            
        }else
        {
            
            
            NSLog(@"this is the index item %ld -------",(long)indexPath.item);
            
            
            NSLog(@"tadha0if %@",SelectDateArrayFormCalender );
            
            NSString *DateStr;
            NSString *MonthString;
            
            if ([[SelectDateArrayFormCalender objectAtIndex:indexPath.item-StartingDay+1]intValue]<=9)
            {
                DateStr =[NSString stringWithFormat:@"0%d",[[SelectDateArrayFormCalender objectAtIndex:indexPath.item-StartingDay+1]intValue]];
            }else
            {
                DateStr=[NSString stringWithFormat:@"%d",[[SelectDateArrayFormCalender objectAtIndex:indexPath.item-StartingDay+1]intValue]];
            }
            
            if (ChangingMonth<=9)
            {
                MonthString =[NSString stringWithFormat:@"0%d",ChangingMonth];
            }else
            {
                MonthString=[NSString stringWithFormat:@"%d",ChangingMonth];
            }
            
            NSLog(@"date str is %@/%@/%d",DateStr,MonthString,changingYear);
            
            if ([DatesArray containsObject:DateStr])
            {
                NSLog(@"this is called the selcted date");
                
            }
            else if ([BookedDatesDays containsObject:DateStr])
            {
                
            }
            else
            {
                
                
            }
            
            
            
        }
        
        
    }
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)nextBtn:(UIButton *)sender {
    //number of days
    
    ChangingMonth=ChangingMonth+1;
    
    
    if (ChangingMonth>12)
    {
        ChangingMonth=1;
        changingYear=changingYear+1;
        
        
        NSString *finalDate = [NSString stringWithFormat:@"01-%ld-%d 20:54:18",(long)ChangingMonth,changingYear];
        
        // Prepare an NSDateFormatter to convert to and from the string representation
        NSDateFormatter *dateFormatter12 = [[NSDateFormatter alloc] init];
        
        // ...using a date format corresponding to your date
        [dateFormatter12 setDateFormat:@"dd-MM-yyyy HH:mm:ss"];
        
        // Parse the string representation of the date
        NSDate *date = [dateFormatter12 dateFromString:finalDate];
        
        // Write the date back out using the same format
        NSLog(@"Month %@",[dateFormatter12 stringFromDate:date]);
        
        
        
        NSTimeZone *tz = [NSTimeZone defaultTimeZone];
        NSInteger seconds = [tz secondsFromGMTForDate: date];
        NSDate* selectedCurentDate=[NSDate dateWithTimeInterval: seconds sinceDate: date];
        
        NSDate *today1 = [NSDate date];
        NSDateFormatter *dateFormatter1 = [[NSDateFormatter alloc] init];
        //[dateFormatter setDateFormat:@"MM/dd/yyyy"];
        [dateFormatter1 setTimeStyle:NSDateFormatterLongStyle];
        NSString *currentTime = [dateFormatter1 stringFromDate:today1];
        
        NSLog(@"User's current time in their preference format:%@",currentTime);
        
        
        NSString *stringDate =[NSString stringWithFormat:@"%@",selectedCurentDate];
        NSDateFormatter *dateFormatter11 = [[NSDateFormatter alloc] init];
        [dateFormatter11 setDateFormat:@"yyyy-MM-dd HH:mm:ss +0000"];
        NSLog(@"newDate format:%@",stringDate);
        
        NSDate *date11  = [dateFormatter11 dateFromString:stringDate];
        NSLog(@"newDate format:%@",date11);
        
        
        
        monthArray=[[NSMutableArray alloc]init];
        NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
        NSDate           *today           = date11;
        NSCalendar       *currentCalendar = [NSCalendar currentCalendar];
        NSDateComponents *yearComponents  = [currentCalendar components:NSYearCalendarUnit  fromDate:today];
        int currentYear  = [yearComponents year];
        for(int months = 0; months < 12; months++)
        {
            NSString *monthName = [NSString stringWithFormat:@"%@ %i",[[dateFormatter monthSymbols]objectAtIndex: months],currentYear];
            NSLog(@"%@ %i",[[dateFormatter monthSymbols]objectAtIndex: months],currentYear);
            [monthArray addObject:monthName];
        }
        
        
        
    }
    _month_Name.text=[monthArray objectAtIndex:ChangingMonth-1];
    
    NSString *finalDate = [NSString stringWithFormat:@"01-%ld-%d 20:54:18",(long)ChangingMonth,changingYear];
    
    // Prepare an NSDateFormatter to convert to and from the string representation
    NSDateFormatter *dateFormatter12 = [[NSDateFormatter alloc] init];
    
    // ...using a date format corresponding to your date
    [dateFormatter12 setDateFormat:@"dd-MM-yyyy HH:mm:ss"];
    
    // Parse the string representation of the date
    NSDate *date = [dateFormatter12 dateFromString:finalDate];
    
    // Write the date back out using the same format
    NSLog(@"Month %@",[dateFormatter12 stringFromDate:date]);
    
    
    
    NSTimeZone *tz = [NSTimeZone defaultTimeZone];
    NSInteger seconds = [tz secondsFromGMTForDate: date];
    NSDate* selectedCurentDate=[NSDate dateWithTimeInterval: seconds sinceDate: date];
    
    NSDate *today1 = [NSDate date];
    NSDateFormatter *dateFormatter1 = [[NSDateFormatter alloc] init];
    //[dateFormatter setDateFormat:@"MM/dd/yyyy"];
    [dateFormatter1 setTimeStyle:NSDateFormatterLongStyle];
    NSString *currentTime = [dateFormatter1 stringFromDate:today1];
    
    NSLog(@"User's current time in their preference format:%@",currentTime);
    
    
    NSString *stringDate =[NSString stringWithFormat:@"%@",selectedCurentDate];
    NSDateFormatter *dateFormatter11 = [[NSDateFormatter alloc] init];
    [dateFormatter11 setDateFormat:@"yyyy-MM-dd HH:mm:ss +0000"];
    NSLog(@"newDate format:%@",stringDate);
    
    NSDate *date11  = [dateFormatter11 dateFromString:stringDate];
    NSLog(@"newDate format:%@",date11);
    
    
    NSCalendar *cal = [NSCalendar currentCalendar];
    NSRange range = [cal rangeOfUnit:NSDayCalendarUnit inUnit:NSMonthCalendarUnit forDate:date11];
    numberOfDaysInMonth = range.length;
    
    NSLog(@"this is called the comp %lu",(unsigned long)numberOfDaysInMonth);
    
    
    //Starting day
    
    
    
    
    
    
    
    NSCalendar *gregorian = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
    
    
    NSDateComponents *comps1 = [gregorian components:NSWeekdayCalendarUnit fromDate:date11];
    int weekday = [comps1 weekday];
    StartingDay=weekday;
    NSLog(@"this is called the super raja %d",StartingDay);
    
    
    
    DatesArray=[[NSMutableArray alloc]init];
    BookedDatesDays=[[NSMutableArray alloc]init];
    
    for (NSString*STR in AvalableDates)
    {
        
        NSLog(@"str is %@",STR);
        
        NSArray*SPiltArray=[STR componentsSeparatedByString:@"/"];
        NSLog(@"split array is %@",SPiltArray);
        
        
        if ([[SPiltArray objectAtIndex:1] intValue]==ChangingMonth)
        {
            [DatesArray addObject:[SPiltArray objectAtIndex:0]];
        }
        
        
    }
    
    
    for (NSString*STR in BookedDates)
    {
        
        NSLog(@"str is %@",STR);
        
        NSArray*SPiltArray=[STR componentsSeparatedByString:@"/"];
        NSLog(@"split array is %@",SPiltArray);
        
        
        if ([[SPiltArray objectAtIndex:1] intValue]==ChangingMonth)
        {
            [BookedDatesDays addObject:[SPiltArray objectAtIndex:0]];
        }
        
        
    }
    
    
    
    
    NSLog(@"this is called th booked dates %@   %@",BookedDatesDays,DatesArray);
    
    [SelectDateArrayFormCalender removeAllObjects];
    DateInCalender=1;
    
    //  [_calenderColl reloadData];
    
    NSIndexSet *indexSet=[NSIndexSet indexSetWithIndex:1];
    
    [_calenderColl reloadSections:indexSet];
    
    
}

- (IBAction)previousBtn:(UIButton *)sender {
    
    ChangingMonth=ChangingMonth-1;
    if (ChangingMonth==0)
    {
        ChangingMonth=12;
        changingYear=changingYear-1;
        
        
        NSString *finalDate = [NSString stringWithFormat:@"01-%ld-%d 20:54:18",(long)ChangingMonth,changingYear];
        
        // Prepare an NSDateFormatter to convert to and from the string representation
        NSDateFormatter *dateFormatter12 = [[NSDateFormatter alloc] init];
        
        // ...using a date format corresponding to your date
        [dateFormatter12 setDateFormat:@"dd-MM-yyyy HH:mm:ss"];
        
        // Parse the string representation of the date
        NSDate *date = [dateFormatter12 dateFromString:finalDate];
        
        // Write the date back out using the same format
        NSLog(@"Month %@",[dateFormatter12 stringFromDate:date]);
        
        
        
        NSTimeZone *tz = [NSTimeZone defaultTimeZone];
        NSInteger seconds = [tz secondsFromGMTForDate: date];
        NSDate* selectedCurentDate=[NSDate dateWithTimeInterval: seconds sinceDate: date];
        
        NSDate *today1 = [NSDate date];
        NSDateFormatter *dateFormatter1 = [[NSDateFormatter alloc] init];
        //[dateFormatter setDateFormat:@"MM/dd/yyyy"];
        [dateFormatter1 setTimeStyle:NSDateFormatterLongStyle];
        NSString *currentTime = [dateFormatter1 stringFromDate:today1];
        
        NSLog(@"User's current time in their preference format:%@",currentTime);
        
        
        NSString *stringDate =[NSString stringWithFormat:@"%@",selectedCurentDate];
        NSDateFormatter *dateFormatter11 = [[NSDateFormatter alloc] init];
        [dateFormatter11 setDateFormat:@"yyyy-MM-dd HH:mm:ss +0000"];
        NSLog(@"newDate format:%@",stringDate);
        
        NSDate *date11  = [dateFormatter11 dateFromString:stringDate];
        NSLog(@"newDate format:%@",date11);
        
        
        
        monthArray=[[NSMutableArray alloc]init];
        NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
        NSDate           *today           = date11;
        NSCalendar       *currentCalendar = [NSCalendar currentCalendar];
        NSDateComponents *yearComponents  = [currentCalendar components:NSYearCalendarUnit  fromDate:today];
        int currentYear  = [yearComponents year];
        for(int months = 0; months < 12; months++)
        {
            NSString *monthName = [NSString stringWithFormat:@"%@ %i",[[dateFormatter monthSymbols]objectAtIndex: months],currentYear];
            NSLog(@"%@ %i",[[dateFormatter monthSymbols]objectAtIndex: months],currentYear);
            [monthArray addObject:monthName];
        }
        
        
        
    }
    _month_Name.text=[monthArray objectAtIndex:ChangingMonth-1];
    NSString *finalDate = [NSString stringWithFormat:@"01-%ld-%d 20:54:18",(long)ChangingMonth,changingYear];
    
    // Prepare an NSDateFormatter to convert to and from the string representation
    NSDateFormatter *dateFormatter12 = [[NSDateFormatter alloc] init];
    
    // ...using a date format corresponding to your date
    [dateFormatter12 setDateFormat:@"dd-MM-yyyy HH:mm:ss"];
    
    // Parse the string representation of the date
    NSDate *date = [dateFormatter12 dateFromString:finalDate];
    
    // Write the date back out using the same format
    NSLog(@"Month %@",[dateFormatter12 stringFromDate:date]);
    
    
    
    NSTimeZone *tz = [NSTimeZone defaultTimeZone];
    NSInteger seconds = [tz secondsFromGMTForDate: date];
    NSDate* selectedCurentDate=[NSDate dateWithTimeInterval: seconds sinceDate: date];
    
    NSDate *today1 = [NSDate date];
    NSDateFormatter *dateFormatter1 = [[NSDateFormatter alloc] init];
    //[dateFormatter setDateFormat:@"MM/dd/yyyy"];
    [dateFormatter1 setTimeStyle:NSDateFormatterLongStyle];
    NSString *currentTime = [dateFormatter1 stringFromDate:today1];
    
    NSLog(@"User's current time in their preference format:%@",currentTime);
    
    
    NSString *stringDate =[NSString stringWithFormat:@"%@",selectedCurentDate];
    NSDateFormatter *dateFormatter11 = [[NSDateFormatter alloc] init];
    [dateFormatter11 setDateFormat:@"yyyy-MM-dd HH:mm:ss +0000"];
    NSLog(@"newDate format:%@",stringDate);
    
    NSDate *date11  = [dateFormatter11 dateFromString:stringDate];
    NSLog(@"newDate format:%@",date11);
    
    
    NSCalendar *cal = [NSCalendar currentCalendar];
    NSRange range = [cal rangeOfUnit:NSDayCalendarUnit inUnit:NSMonthCalendarUnit forDate:date11];
    numberOfDaysInMonth = range.length;
    
    NSLog(@"this is called the comp %lu",(unsigned long)numberOfDaysInMonth);
    
    
    //Starting day
    
    
    
    
    
    
    
    NSCalendar *gregorian = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
    
    
    NSDateComponents *comps1 = [gregorian components:NSWeekdayCalendarUnit fromDate:date11];
    int weekday = [comps1 weekday];
    StartingDay=weekday;
    NSLog(@"this is called the super raja %d",StartingDay);
    DatesArray=[[NSMutableArray alloc]init];
    BookedDatesDays=[[NSMutableArray alloc]init];
    
    for (NSString*STR in AvalableDates)
    {
        
        NSLog(@"str is %@",STR);
        
        NSArray*SPiltArray=[STR componentsSeparatedByString:@"/"];
        NSLog(@"split array is %@",SPiltArray);
        
        
        if ([[SPiltArray objectAtIndex:1] intValue]==ChangingMonth)
        {
            [DatesArray addObject:[SPiltArray objectAtIndex:0]];
        }
        
        
    }
    
    
    for (NSString*STR in BookedDates)
    {
        
        NSLog(@"str is %@",STR);
        
        NSArray*SPiltArray=[STR componentsSeparatedByString:@"/"];
        NSLog(@"split array is %@",SPiltArray);
        
        
        if ([[SPiltArray objectAtIndex:1] intValue]==ChangingMonth)
        {
            [BookedDatesDays addObject:[SPiltArray objectAtIndex:0]];
        }
        
        
    }
    
    
    
    [SelectDateArrayFormCalender removeAllObjects];
    
    
    
    DateInCalender=1;
    
    NSIndexSet *indexSet=[NSIndexSet indexSetWithIndex:1];
    
    [_calenderColl reloadSections:indexSet];
    
    
    
    
}

@end
