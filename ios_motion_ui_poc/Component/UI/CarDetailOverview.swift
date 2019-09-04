//
//  CarDetailOverview.swift
//  ios_motion_ui_poc
//
//  Created by Hannes Van den Berghe on 03/09/2019.
//  Copyright © 2019 icapps. All rights reserved.
//

import UIKit
import Stella

class CarDetailOverview: UIView, UIGestureRecognizerDelegate {
    
    var scrollHandler:((Car?) -> Void)?
    var dismissHandler:(() -> Void)?
    var selectedCar: Car?

    var items: [Car]? {
        didSet {
            reloadItems()
        }
    }
    
    private lazy var stackView: UIStackView = {
        let view = UIStackView()
        view.axis = .horizontal
        view.spacing = 30
        return view
    }()
    
    private lazy var scrollView: UIScrollView = {
        let scroll = UIScrollView()
        scroll.showsHorizontalScrollIndicator = false
        scroll.delegate = self
        scroll.isPagingEnabled = true
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
        setupSwipe()
    }
    
    
    private func reloadItems() {
        stackView.removeAll()
        items?.forEach({ car in
            let item = CarDetailItemView(frame: .zero)
            item.car = car
            item.translatesAutoresizingMaskIntoConstraints = false
            item.widthAnchor.constraint(equalToConstant: 300).isActive = true
            item.heightAnchor.constraint(equalToConstant: 410).isActive = true
            stackView.addArrangedSubview(item)
        })
    }
    
    func showItems() {
        stackView.arrangedSubviews.forEach { view in
            guard let view = view as? CarDetailItemView else { return }
            view.showLabels()
        }
    }
    
    private func setupSwipe() {
        let gesture = UIPanGestureRecognizer(target: self, action: nil)
        gesture.delegate = self
        scrollView.addGestureRecognizer(gesture)
    }
    
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldRecognizeSimultaneouslyWith otherGestureRecognizer: UIGestureRecognizer) -> Bool {
        if let gesture = gestureRecognizer as? UIPanGestureRecognizer {
            let velocity = gesture.velocity(in: self)
            if velocity.y > 0 {
                dismissHandler?()
                return false
            }
            return true
        }
        return true
    }
    
}

extension CarDetailOverview: UIScrollViewDelegate {
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let page = Int(ceil(scrollView.contentOffset.x / scrollView.frame.size.width))
        if let car = items?[safe: page] {
            scrollHandler?(car)
        }
    }
    
    
    func showVisibleItem() {
        var frame = scrollView.frame
        let index = items?.firstIndex(where: { $0.model == selectedCar?.model }) ?? 0
        frame.origin.x = frame.size.width * CGFloat(index)
        frame.origin.y = 0
        scrollView.scrollRectToVisible(frame, animated: true)
    }
}
