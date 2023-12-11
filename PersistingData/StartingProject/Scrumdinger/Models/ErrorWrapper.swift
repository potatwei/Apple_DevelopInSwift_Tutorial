//
//  ErrorWrapper.swift
//  Scrumdinger
//
//  Created by Shihang Wei on 12/10/23.
//

import Foundation
    
struct ErrorWrapper: Identifiable {
    let id: UUID
    let error: Error
    let guidance: String
    
    init(id: UUID = UUID(), error: Error, guidance: String) {
        self.id = id
        self.error = error
        self.guidance = guidance
    }
}
