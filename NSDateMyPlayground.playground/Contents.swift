//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"
// 而家既時間
func now() {
    let date = NSDate()
    print(date)
}

now()


// 顯示時間
func showTime() {
    let date = NSDate()
    var dateFormatter = NSDateFormatter()
    //codingexplorer.com to see what kind of format of date I want
    dateFormatter.dateFormat = "yyyy年M月d日"
    var str = dateFormatter.stringFromDate(date)
    print(str)
    
    dateFormatter = NSDateFormatter()
    dateFormatter.dateStyle = .FullStyle
    dateFormatter.timeStyle = .FullStyle
    str = dateFormatter.stringFromDate(date)
    print("str \(str)")
    
    //cocotron.googlecode.com/svb/branches/NSXML/Foundation/NSTimeZone/NSTimeZoneAbbreviaitons.plist
    
    let gmt = NSTimeZone(abbreviation: "GMT")
    dateFormatter.timeZone = gmt;
    str = dateFormatter.stringFromDate(date)
    print(str)
    
    dateFormatter = NSDateFormatter()
    dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
    dateFormatter.timeZone = NSTimeZone(abbreviation: "GMT")
    str = dateFormatter.stringFromDate(date)
    print(str)
    
}

showTime()


// 幾耐之後既時間

func timeWalk() {
    let calender = NSCalendar.currentCalendar()
    let now = NSDate()
    
    // 用日子做單位
    let tomorrow = calender.dateByAddingUnit(.Day, value: 1, toDate: now, options: [])
    
    print(tomorrow!)
    // 用秒數做單位
    let date = now.dateByAddingTimeInterval(22)
    print(date)
    
}

timeWalk()

// 下次呢個時間係幾時？
func nextDate() {
    let calendar = NSCalendar.currentCalendar()
    
    var nextTime = calendar.nextDateAfterDate(NSDate(), matchingHour: 9, minute: 30, second: 0, options: .MatchNextTime)
    print(nextTime!)
    
    nextTime = calendar.nextDateAfterDate(NSDate(), matchingUnit: .Hour, value: 2, options: .MatchNextTime)
    print(nextTime!)
    
}

nextDate()

//指定時間
func setDate() {
    let calendar = NSCalendar.currentCalendar()
    
    let date = calendar.dateWithEra(0, year: 2015, month: 3, day: 3, hour: 18, minute: 30, second: 30, nanosecond: 0)
    print(date!)
}

setDate()

func getDateDetail() {
    let date = NSDate()
    let calendar = NSCalendar.currentCalendar()
    
    var year = 0, month = 0, day = 0
    calendar.getEra(nil, year: &year, month: &month, day: &day, fromDate: date  )
    print("year \(year) month \(month) day \(day)")
    
    var hour = 0, min = 0, sec = 0, nanoSec = 0
    calendar.getHour(&hour, minute: &min, second: &sec, nanosecond: &nanoSec, fromDate: date)
    print("hour \(hour) min \(min) sec \(sec)")
    
    var yearForWeekOfYear = 0, weekOfYear = 0, weekDay = 0
    calendar.getEra(nil, yearForWeekOfYear: &yearForWeekOfYear, weekOfYear: &weekOfYear, weekday: &weekDay, fromDate: date)
    
}

getDateDetail()

func todayTomorrowYesterday() {
    let calendar = NSCalendar.currentCalendar()
    let today = NSDate()
    var result = calendar.isDateInToday(today)
    print(result)
    result = calendar.isDateInTomorrow(today)
    print(result)
    result = calendar.isDateInYesterday(today)
    print(result)
}

todayTomorrowYesterday()

func timestampButPressed(){
    let now = NSDate()
    let interval = now.timeIntervalSince1970
    print(interval)
    let date = NSDate(timeIntervalSince1970: interval)
    print(date)
}

timestampButPressed()

func stringToDate(){
    var string = "2015-07-01 10:22:33"
    
    let dateFormatter = NSDateFormatter()
    dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
    //dateFormtter.timeZone = NSTimeZone(abbreviation:"GMT")
    var currentDateTime = dateFormatter.dateFromString(string)
    print(currentDateTime!)
    
    dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss Z"
    string = "2015-07-01 10:22:33 +0000"
    currentDateTime = dateFormatter.dateFromString(string)
    print(currentDateTime!)
    
    
    string = "2015-07-01T10:22:33+0000"
    dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
    currentDateTime = dateFormatter.dateFromString(string)
    print(currentDateTime!)
    
}
stringToDate()


func compareDate(){
    let calendar = NSCalendar.currentCalendar()
    let date1 = calendar.dateWithEra(0, year: 2015, month: 3, day: 2, hour: 18, minute: 20, second: 3, nanosecond: 0)
    let date2 = calendar.dateWithEra(0, year: 2015, month: 3, day: 1, hour: 18, minute: 10, second: 3, nanosecond: 0)
    let result = calendar.isDate(date1!, inSameDayAsDate: date2!)
    print(result)
    
    let result2 = calendar.compareDate(date1!, toDate: date2!, toUnitGranularity: .Day)
    print(result2)
    
    
    // 相差左幾多年月日
    let components = calendar.components([.Year, .Month, .Day], fromDate: date1!, toDate: date2!, options: [])
    print("\(components.year)\(components.month)\(components.day)")
}

compareDate()