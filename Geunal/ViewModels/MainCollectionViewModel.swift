//
//  MainCollectionViewModel.swift
//  Geunal
//
//  Created by SolChan Ahn on 01/11/2018.
//  Copyright © 2018 SolChan Ahn. All rights reserved.
//

import Foundation

protocol MainCollectionViewModel {
    
    var calendarYearRange: [Int] { get }
    var calendarMonthRange: [Int] { get }
    
    var year: Dynamic<Int> { get }
    var month: Dynamic<Int> { get }
    
    func getIndexPath() -> IndexPath
}

class MainCollectionViewModelFrom:NSObject, MainCollectionViewModel {
    
    let currentTimeModel: CurrentTimeModel
    
    let calendarYearRange: [Int]
    let calendarMonthRange: [Int]
    
    let year: Dynamic<Int>
    let month: Dynamic<Int>
    
    init(currentTimeModel: CurrentTimeModel) {
        
        self.calendarYearRange = Array(CalendarYear.min ... CalendarYear.max)
        self.calendarMonthRange = Array(1...12)
        
        self.currentTimeModel = currentTimeModel
        
        self.year = Dynamic(currentTimeModel.currentYear)
        self.month = Dynamic(currentTimeModel.currentMonth)
    }
    
    func getIndexPath() -> IndexPath {
        
        let section = self.year.value - CalendarYear.min
        let row = self.month.value - 1
        let indexPath = IndexPath(row: row, section: section)
        
        return indexPath
    }
    
    
}
