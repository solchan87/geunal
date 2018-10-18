//
//  CalandarService.swift
//  MyCalendar
//
//  Created by SolChan Ahn on 03/10/2018.
//  Copyright © 2018 SolChan Ahn. All rights reserved.
//

import Foundation

struct MonthData {
    var year: Int
    var month: Int
    var dateDatas: [DateData]
}

struct DateData {
    var year: Int
    var month: Int
    var date: Int
    var dayOfWeek: Int
    var dateType: Bool
}

struct CurrentTime {
    var year: Int
    var month: Int
    var date: Int
    var hour: Int
    var min: Int
    var week: Int?
}

class CalendarService {
    
    let startYear: Int = 1930
    let endYear: Int = 2050
    
    func getMonthData(year: Int, month: Int) -> MonthData{
        
        let monthData = MonthData(year: year, month: month, dateDatas: getDateDatas(year: year, month: month))
        
        return monthData
    }
    
    private func getLastDate(year: Int, month: Int) -> Int{
        switch month {
        case 1, 3, 5, 7, 8, 10, 12:
            return 31
        case 4, 6, 9, 11:
            return 30
        case 2:
            return year % 4 == 0 && (year % 100 != 0 || year % 400 == 0) ? 29 : 28
        default:
            return 0
        }
    }
    
    func getDayOfWeek(year: Int, month: Int) -> Int {
        var dateToString: String = ""
        if month < 10 {
            dateToString = "\(year)0\(month)01"
        }else {
            dateToString = "\(year)\(month)01"
        }
        
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyyMMdd"
        
        let firstDate = formatter.date(from: dateToString)
        let myCalendar = Calendar(identifier: .gregorian)
        let weekDay = myCalendar.component(.weekday, from: firstDate!)
        
        return weekDay
    }
    
    func getCurrentDayOfWeek(currentTime: CurrentTime) -> Int {
        let tDate = Date()
        let formatter = DateFormatter()
        
        formatter.dateFormat = "yyyyMMdd"
        let dateToString = formatter.string(from: tDate)
        
        let firstDate = formatter.date(from: dateToString)
        let myCalendar = Calendar(identifier: .gregorian)
        let weekDay = myCalendar.component(.weekday, from: firstDate!)
        
        return weekDay
    }
    
    func getCurrentTime() -> CurrentTime{
        let tDate = Date()
        let formatter = DateFormatter()
        
        formatter.dateFormat = "yyyy.MM.dd.hh.mm"
        let result = formatter.string(from: tDate)
        
        let time = result.components(separatedBy: ".")
        
        let year: Int = Int(time[0]) ?? 0
        let month: Int = Int(time[1]) ?? 0
        let date: Int = Int(time[2]) ?? 0
        let hour: Int = Int(time[3]) ?? 0
        let min: Int = Int(time[4]) ?? 0
        
        let currentTime = CurrentTime(year: year, month: month, date: date, hour: hour, min: min, week: nil)
        
        return currentTime
    }
    
    func getDateDatas(year: Int, month: Int) -> [DateData] {
        var totalCount = 1
        var weekCount = 1
        var dateCount = 0
        
        var dateDatas:[DateData] = []
        
        let lastDate = getLastDate(year: year, month: month)
        let dayOfWeek = getDayOfWeek(year: year, month: month)
        
        for _ in 1..<(lastDate + dayOfWeek) {
            if totalCount < dayOfWeek {
                let dateData = DateData(year: year, month: month, date: dateCount, dayOfWeek: weekCount, dateType: false)
                dateDatas.append(dateData)
            }else {
                dateCount += 1
                let dateData = DateData(year: year, month: month, date: dateCount, dayOfWeek: weekCount, dateType: true)
                dateDatas.append(dateData)
            }
            totalCount += 1
            if weekCount == 7 {
                weekCount = 1
            }else {
                weekCount += 1
            }
            
        }
        return dateDatas
    }
}
