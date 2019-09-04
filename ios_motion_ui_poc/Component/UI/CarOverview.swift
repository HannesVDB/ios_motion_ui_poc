//
//  CarOverview.swift
//  ios_motion_ui_poc
//
//  Created by Hannes Van den Berghe on 03/09/2019.
//  Copyright © 2019 icapps. All rights reserved.
//

import UIKit
import Stella

class CarOverview: UIView {
    
    var selectCarHandler:((Car?) -> Void)?
    
    var items: [Car]? {
        didSet {
            reloadItems()
        }
    }
    
    private lazy var stackView: UIStackView = {
        let view = UIStackView()
        view.axis = .horizontal
        view.spacing = 20
        return view
    }()
    
    private lazy var scrollView: UIScrollView = {
        let scroll = UIScrollView()
        scroll.showsHorizontalScrollIndicator = false
        return scroll
    }()
    
    // MARK: - Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    private func commonInit() {
        backgroundColor = .clear
        drawView()
    }
    
    private func drawView() {
        addSubview(scrollView)
        scrollView.constrainToSuperview()
        scrollView.addSubview(stackView)
        stackView.constrainToSuperview(insets: UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20))
    }
    
    
    private func reloadItems() {
        stackView.removeAll()
        items?.forEach({ car in
            let item = CarItemView(frame: .zero)
            item.car = car
            item.translatesAutoresizingMaskIntoConstraints = false
            item.widthAnchor.constraint(equalToConstant: 100).isActive = true
            item.heightAnchor.constraint(equalToConstant: 150).isActive = true
            item.selectCarHandler = {
                self.selectCarHandler?(car)
            }
            stackView.addArrangedSubview(item)
        })
    }
    
}
