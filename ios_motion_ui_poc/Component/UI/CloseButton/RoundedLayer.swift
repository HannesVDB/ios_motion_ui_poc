//
//  RoundedLayer.swift
//  Point of Sale
//
//  Created by Stefan Adams on 25/11/2016.
//  Copyright © 2016 iCapps. All rights reserved.
//

import UIKit

class RoundedLayer: CALayer {
    
    /// When the rounding value is nil we rounded the layer as a complete circle.
    var rounding: CGFloat?
    
    // MARK: - Sublayer
    
    override func layoutSublayers() {
        super.layoutSublayers()
        
        if let rounding = rounding {
            cornerRadius = rounding
        } else {
            cornerRadius = bounds.height / 2.0
        }
    }
}
