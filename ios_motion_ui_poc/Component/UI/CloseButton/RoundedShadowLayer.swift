//
//  RoundedShadowLayer.swift
//  Point of Sale
//
//  Created by Stefan Adams on 25/11/2016.
//  Copyright © 2016 iCapps. All rights reserved.
//

import UIKit

class RoundedShadowLayer: RoundedLayer {
    
    override init() {
        super.init()
        setupShadows()
    }
    
    override init(layer: Any) {
        super.init(layer: layer)
        setupShadows()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupShadows()
    }
    
    private func setupShadows() {
        shadowColor = UIColor.black.cgColor
        shadowOffset = CGSize(width: 0, height: 15)
        shadowOpacity = 0.2
        shadowRadius = 15
    }
    
    override func layoutSublayers() {
        super.layoutSublayers()
        
        shadowPath = UIBezierPath(roundedRect: bounds, cornerRadius: cornerRadius).cgPath
    }
    
}
