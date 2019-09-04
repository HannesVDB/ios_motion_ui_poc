//
//  Car.swift
//  ios_motion_ui_poc
//
//  Created by Hannes Van den Berghe on 04/09/2019.
//  Copyright © 2019 icapps. All rights reserved.
//

import UIKit

struct Car {
    var image: UIImage
    var model: String
    var brand: Brand
    var description: String
}

struct Brand {
    var name: String
    var image: UIImage
}
