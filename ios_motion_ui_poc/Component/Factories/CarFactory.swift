//
//  CarFactory.swift
//  ios_motion_ui_poc
//
//  Created by Hannes Van den Berghe on 04/09/2019.
//  Copyright © 2019 icapps. All rights reserved.
//

import UIKit

protocol CarManufacturing {
    func make() -> [Car]
}

class CarFactoy: CarManufacturing {
    
    static var shared = CarFactoy()
    
    func make() -> [Car] {
        return [
            Car(image: UIImage(named: "eleanor")!,
                model: "Shelby Mustang Eleanor",
                brand: BrandFactory.shared.make(type: .ford),
                description: "You probably know that Eleanor was the GT500 hero car's name in Gone in Sixty Seconds, but that's not where the name originated. Eleanor was the hero car in the original Gone in 60 Seconds -- the 1974 we-don't-need-no-special-effects version -- but that car was a Mach 1, not a Shelby. Incidentally, the chase scene in that original movie was so epic that the writer-slash-director-slash-stunt driver literally died trying to film it's even more over-the-top (and never-released) sequel."),
            Car(image: UIImage(named: "911")!,
                model: "911",
                brand: BrandFactory.shared.make(type: .porsche),
                description: "The Porsche 911 (pronounced Nine Eleven or in German: Neunelfer) is a two-door, 2+2 high performance rear-engined sports car made since 1963[1] by Porsche AG of Stuttgart, Germany. It has a rear-mounted flat-six engine and all round independent suspension. It has undergone continuous development, though the basic concept has remained unchanged. The engines were air-cooled until the introduction of the Type 996 in 1998, with the 993, produced from 1994–1998 model years, being the last of the air-cooled Porsche sports cars."),
        ]
    }
}

enum BrandType {
    case ford
    case porsche
}

protocol BrandMaking {
    func make(type: BrandType) -> Brand
}

class BrandFactory: BrandMaking {
    static var shared = BrandFactory()
    
    func make(type: BrandType) -> Brand  {
        switch type {
        case .ford: return Brand(name: "Ford", image: UIImage(named: "ford")!)
        case .porsche: return Brand(name: "Porsche", image: UIImage(named: "porsche")!)
        }
    }
}
