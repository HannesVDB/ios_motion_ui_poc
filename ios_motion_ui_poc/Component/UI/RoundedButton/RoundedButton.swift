//
//  RoundedButton.swift
//  ios_motion_ui_poc
//
//  Created by Hannes Van den Berghe on 04/09/2019.
//  Copyright © 2019 icapps. All rights reserved.
//

import UIKit

class RoundedButton: UIButton {
    
    override func awakeFromNib() {
        super.awakeFromNib()
        initializeViews()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initializeViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        initializeViews()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        layer.cornerRadius = frame.height / 2
    }
    
    func initializeViews() {
        setTitleColor(.darkGray, for: .normal)
        setTitleColor(.lightGray, for: .highlighted)
        layer.borderColor = UIColor.darkGray.cgColor
        layer.borderWidth = 1
    }
}
