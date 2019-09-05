//
//  DetailViewController.swift
//  ios_motion_ui_poc
//
//  Created by Hannes Van den Berghe on 03/09/2019.
//  Copyright © 2019 icapps. All rights reserved.
//

import UIKit

extension UIViewController {
    
    func presentDetailViewController(with transitioningDelegate: UIViewControllerTransitioningDelegate? = nil, dismissHandler: ((DetailViewController) -> Void)? = nil) {
        //swiftlint:disable force_cast
        let controller: DetailViewController = DetailViewController.from(storyboard: "Detail") as! DetailViewController
        controller.modalPresentationStyle = .custom
        controller.transitioningDelegate = transitioningDelegate
        
        controller.dismissHandler = {
            guard let handler = dismissHandler else {
                controller.presentingViewController?.dismiss(animated: true, completion: nil)
                return
            }
            handler(controller)
        }
        
        present(controller, animated: true, completion: nil)
    }
}

class DetailViewController: UIViewController {
    
    @IBOutlet weak var carOverviewContainer: CarDetailOverview!
    @IBOutlet weak var informationLabel: UILabel!
    @IBOutlet weak var informationTopConstraint: NSLayoutConstraint!
    
    var dismissHandler: (() -> Void)?
    var scrollHandler:((Car?) -> Void)?
    var selectedCar: Car?
    var didSetLayout = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        select(car: selectedCar)
        carOverviewContainer.selectedCar = selectedCar
        carOverviewContainer.items = CarFactoy.shared.make()
        carOverviewContainer.dismissHandler = {
            self.dismiss(animated: true, completion: nil)
        }
        carOverviewContainer.scrollHandler = { car in
            self.select(car: car)
            self.scrollHandler?(car)
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        didSetLayout = true
        
        informati
        onTopConstraint.constant = 220
        UIView.animate(withDuration: 0.25) {
            self.informationLabel.alpha = 1
            self.view.layoutIfNeeded()
        }
    }
    
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        if !didSetLayout {
            carOverviewContainer.showVisibleItem()
        }
    }
    
    @IBAction func didTapClose(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    private func select(car: Car?) {
        informationLabel.text = car?.description
//        informationLabel.hero.id = "Information_\(car?.model ?? "")"
//        informationLabel.hero.modifiers = [.fade, .translate(y: 300), .duration(0.5)]
    }
}
