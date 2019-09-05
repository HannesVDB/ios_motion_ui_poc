//
//  CarDetailItemView.swift
//  ios_motion_ui_poc
//
//  Created by Hannes Van den Berghe on 03/09/2019.
//  Copyright © 2019 icapps. All rights reserved.
//

import UIKit
import Stella
import Hero
class CarDetailItemView: UIControl {
    var car: Car? {
        didSet {
            titleLabel.text = car?.model
            carImageView.image = car?.image
            brandImageView.image = car?.brand.image
            actionButton.setTitle("More information", for: .normal)
            
            carImageView.hero.id = "\(car?.model ?? "")+\(car?.brand.name ?? "")"
            brandImageView.hero.id = "\(car?.brand.name ?? "")_hero"
            containerView.hero.id = "container_hero_\(car?.brand.name ?? "")_hero"
            actionButton.hero.id = "actionbutton"
            actionButton.hero.modifiers = [.fade]
            titleLabel.hero.id = "title_hero"
            titleLabel.hero.modifiers = [.fade]
//            self.hero.id = "rnadom_id"
        }
    }
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
//        label.alpha = 0
        return label
    }()
    
    private lazy var carImageView: UIImageView = {
        let view = UIImageView()
        view.contentMode = .scaleAspectFit
        view.layer.zPosition = 99
        return view
    }()
    
    private lazy var brandImageView: UIImageView = {
        let view = UIImageView()
        view.contentMode = .scaleAspectFit
        return view
    }()
    
    private lazy var containerView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        return view
    }()
    
    private lazy var actionButton: RoundedButton = {
        let button = RoundedButton()
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        drawView()
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
        containerView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        containerView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        containerView.topAnchor.constraint(equalTo: topAnchor, constant: 100).isActive = true
        containerView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        
        addSubview(carImageView)
        carImageView.translatesAutoresizingMaskIntoConstraints = false
        carImageView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        carImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20).isActive = true
        carImageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20).isActive = true
        carImageView.heightAnchor.constraint(equalToConstant: 250).isActive = true

        addSubview(titleLabel)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.topAnchor.constraint(equalTo: carImageView.bottomAnchor, constant: 12).isActive = true
        titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12).isActive = true
        titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -12).isActive = true
        
        addSubview(brandImageView)
        brandImageView.translatesAutoresizingMaskIntoConstraints = false
        brandImageView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 12).isActive = true
        brandImageView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        brandImageView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        brandImageView.heightAnchor.constraint(equalToConstant: 44).isActive = true
        
        addSubview(actionButton)
        actionButton.translatesAutoresizingMaskIntoConstraints = false
        actionButton.topAnchor.constraint(equalTo: brandImageView.bottomAnchor, constant: 12).isActive = true
        actionButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8).isActive = true
        actionButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8).isActive = true
        actionButton.heightAnchor.constraint(equalToConstant: 44).isActive = true
        actionButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -12).isActive = true
    }
    
    func showLabels() {
        UIView.animate(withDuration: 0.25, delay: 0.1, options: .curveEaseIn, animations: {
            self.titleLabel.alpha = 1
            self.actionButton.alpha = 1
        }, completion: nil)
    }
}
