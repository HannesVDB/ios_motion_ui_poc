//
//  CarItemView.swift
//  ios_motion_ui_poc
//
//  Created by Hannes Van den Berghe on 03/09/2019.
//  Copyright © 2019 icapps. All rights reserved.
//

import UIKit
import Stella

class CarItemView: UIControl {
    
    var selectCarHandler:(() -> Void)?
    
    var car: Car? {
        didSet {
            titleLabel.text = car?.brand.name
            imageView.image = car?.brand.image
            imageView.hero.id = "\(car?.brand.name ?? "")_hero"
            containerView.hero.id = "container_hero_\(car?.brand.name ?? "")_hero"
        }
    }
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.isUserInteractionEnabled = false
        return label
    }()
    
    private lazy var imageView: UIImageView = {
        let view = UIImageView()
        view.contentMode = UIView.ContentMode.scaleAspectFit
        view.isUserInteractionEnabled = false
        return view
    }()
    
    private lazy var containerView: UIView = {
        let view = UIView()
        view.isUserInteractionEnabled = false
        view.backgroundColor = .white
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        drawView()
        addTarget(self, action: #selector(didSelectItem), for: .touchUpInside)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("Not implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        containerView.layer.cornerRadius = 16
        containerView.layer.masksToBounds = false
    }
    
    private func drawView() {
        addSubview(containerView)
        containerView.translatesAutoresizingMaskIntoConstraints = false
        containerView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        containerView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        containerView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        containerView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.75).isActive = true
        
        containerView.addSubview(imageView)
        imageView.constrainToSuperview()
        
        addSubview(titleLabel)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.topAnchor.constraint(equalTo: containerView.bottomAnchor, constant: 12).isActive = true
        titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12).isActive = true
        titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -12).isActive = true
        titleLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -12)
    }
    
    @objc private func didSelectItem() {
        selectCarHandler?()
    }
}
