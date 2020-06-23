//
//  GlobalModel.swift
//  SupHealth
//
//  Created by Benjamin Ludwig on 17/06/2020.
//  Copyright © 2020 benjazor. All rights reserved.
//

import Foundation

// Global data
struct Global: Codable {
    let NewConfirmed: Int
    let TotalConfirmed: Int
    let NewDeaths: Int
    let TotalDeaths: Int
    let NewRecovered: Int
    let TotalRecovered: Int
}
