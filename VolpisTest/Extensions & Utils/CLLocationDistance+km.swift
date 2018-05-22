//
//  CLLocationDistance+km.swift
//  VolpisTest
//
//  Created by Dima Paliychuk on 5/21/18.
//  Copyright © 2018 Dima Paliychuk. All rights reserved.
//

import UIKit
import CoreLocation

extension CLLocationDistance {
    
    func inKilometers() -> CLLocationDistance {
        return self/1000
    }
}
