//
//  DayTableViewCell.swift
//  Geunal
//
//  Created by SolChan Ahn on 19/10/2018.
//  Copyright © 2018 SolChan Ahn. All rights reserved.
//

import UIKit
import VisualEffectView


class DayTableViewCell: UITableViewCell {
    @IBOutlet weak var messageLabel: UILabel!
    @IBOutlet weak var filterView: UIView!
    
    var visualEffectView: VisualEffectView!
    
    var message: String = "" {
        didSet{
            self.messageLabel.text = message
            visualEffectView.blurRadius = 6
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        visualEffectView = VisualEffectView(frame: self.bounds)
        visualEffectView.scale = 1
        addSubview(visualEffectView)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
    }
    
    func showMessageLabel(point: CGFloat) {
        let maxSize = self.frame.width * 0.65
        if point <= maxSize {
            let value = 6 * (point / maxSize)
            visualEffectView.blurRadius = 6 - value
        }
    }
    
    func hideMessageLabel() {
        UIView.animate(withDuration: 0.5) {
            self.visualEffectView.blurRadius = 6
        }
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
