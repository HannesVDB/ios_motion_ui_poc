//
//  ViewController.swift
//  ios_motion_ui_poc
//
//  Created by Hannes Van den Berghe on 03/09/2019.
//  Copyright © 2019 icapps. All rights reserved.
//

import UIKit
import Hero

class ViewController: UIViewController {

    @IBOutlet weak var carOverviewContainer: CarOverview!
    @IBOutlet weak var carImageView: UIImageView!
    private let animator: MainAnimator = MainAnimator()
    private var selectedCar: Car?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        carOverviewContainer.items = CarFactoy.shared.make()
        show(car: carOverviewContainer.items?.first)
        carOverviewContainer.selectCarHandler = { car in
            self.selectedCar = car
            self.performSegue(withIdentifier: "showDetail", sender: self)
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.show(car: selectedCar)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let controller = segue.destination as? DetailViewController {
            controller.selectedCar = selectedCar
            controller.scrollHandler = { car in
                self.show(car: car)
            }
        }
    }
    
    private func show(car: Car?) {
        selectedCar = car
        carImageView.image = car?.image
        carImageView.hero.id = "\(car?.model ?? "")+\(car?.brand.name ?? "")"
    }
}
