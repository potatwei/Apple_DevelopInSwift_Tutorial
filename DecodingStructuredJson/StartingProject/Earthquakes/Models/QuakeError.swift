//
//  QuakeError.swift
//  Earthquakes-iOS
//
//  Created by Shihang Wei on 12/10/23.
//  Copyright © 2023 Apple. All rights reserved.
//

import Foundation

enum QuakeError: Error, LocalizedError {
    case missingData
    
    var errorDescription: String? {
        switch self {
        case .missingData:
            return NSLocalizedString(
                "Found and will discard a quake missing a valid code, magnitude, place, or time.",
                comment: ""
            )
        }
    }
}

