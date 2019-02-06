//
//  CalendarCCell.swift
//  Geunal
//
//  Created by SolChan Ahn on 01/02/2019.
//  Copyright © 2019 SolChan Ahn. All rights reserved.
//

import UIKit

import ReactorKit
import RxCocoa
import RxSwift

class CalendarCCell: UICollectionViewCell, StoryboardView {
    
    @IBOutlet weak var yearLabel: UILabel!
    @IBOutlet weak var daysCollectionView: UICollectionView!
    
    var disposeBag = DisposeBag()
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        self.disposeBag = DisposeBag()
    }
    
    func bind(reactor: CalendarCCellReactor) {
        
    }
}
