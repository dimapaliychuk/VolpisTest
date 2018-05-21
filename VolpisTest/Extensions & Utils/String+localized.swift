//
//  String+localized.swift
//  VolpisTest
//
//  Created by Dima Paliychuk on 5/21/18.
//  Copyright © 2018 Dima Paliychuk. All rights reserved.
//

import Foundation

extension String {
    
    var localized: String {
        return NSLocalizedString(
            self,
            tableName: nil,
            bundle: Bundle.main,
            value: "",
            comment: ""
        )
    }
}
