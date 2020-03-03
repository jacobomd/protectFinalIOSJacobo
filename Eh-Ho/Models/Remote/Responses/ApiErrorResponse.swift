//
//  ApiErrorResponse.swift
//  Eh-Ho
//
//  Created by Jacobo Morales Diaz on 03/03/2020.
//  Copyright © 2020 KeepCoding. All rights reserved.
//

import Foundation

struct ApiErrorResponse: Codable, Error {
    let errors: [String]
    let action: String?
}
