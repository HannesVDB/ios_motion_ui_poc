//
//  CloseButton.swift
//  IIFY
//
//  Created by Hannes Van den Berghe on 30/08/2019.
//  Copyright © 2019 pinch-it. All rights reserved.
//

import UIKit

class CloseButton: UIButton {
    
    private lazy var blur: UIVisualEffectView = {
        let effect = UIVisualEffectView(effect: UIBlurEffect(style: .light))
        effect.isUserInteractionEnabled = false
        return effect
    }()

    override func awakeFromNib() {
        super.awakeFromNib()
        
        initializeViews()
    }
    
    private func initializeViews() {
        insertSubview(blur, at: 0)
        blur.constrain(to: self)
        if let imageView = imageView {
            bringSubviewToFront(imageView)
        }
        (layer as? RoundedShadowLayer)?.backgroundColor = UIColor.white.withAlphaComponent(0.12).cgColor
        (layer as? RoundedShadowLayer)?.shadowOpacity = 0.3
        (layer as? RoundedShadowLayer)?.shadowRadius = 15
        (layer as? RoundedShadowLayer)?.shadowOffset = CGSize(width: -1, height: 0.0)
        setImage(UIImage(named: "close"), for: .normal)
    }
    
    // MARK: - Layers
    
    override class var layerClass: AnyClass {
        return RoundedShadowLayer.self
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        layer.cornerRadius = frame.height / 2
        blur.layer.cornerRadius = frame.height / 2
        blur.layer.masksToBounds = true

        (layer as? RoundedShadowLayer)?.rounding = frame.height / 2
    }
    
    // MARK: - Button states
    
    override var isHighlighted: Bool {
        didSet {
            UIView.animate(withDuration: 0.1, animations: {
                self.scaleIfHighlighted(0.95)
            })
        }
    }
    
}

extension UIButton {
    
    func scaleIfHighlighted(_ scale: CGFloat) {
        if self.isHighlighted {
            self.layer.setAffineTransform(CGAffineTransform(scaleX: scale, y: scale))
        } else {
            self.layer.setAffineTransform(CGAffineTransform.identity)
        }
    }
    
}
