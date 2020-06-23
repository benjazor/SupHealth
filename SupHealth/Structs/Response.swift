//
//  ResponseModel.swift
//  SupHealth
//
//  Created by Benjamin Ludwig on 17/06/2020.
//  Copyright © 2020 benjazor. All rights reserved.
//

import Foundation

// API response
struct Response: Codable {
    let Global: Global
    let Countries: Array<Country>
    let Date: String
}
