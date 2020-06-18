//
//  Covid19APIList.swift
//  SupHealth
//
//  Created by Benjamin Ludwig on 14/06/2020.
//  Copyright © 2020 benjazor. All rights reserved.
//

import Foundation

// Country
struct Country: Codable, Identifiable {
    let id = UUID()
    let Country: String
    let CountryCode: String
    let Slug: String
    let NewConfirmed: Int
    let TotalConfirmed: Int
    let NewDeaths: Int
    let TotalDeaths: Int
    let NewRecovered: Int
    let TotalRecovered: Int
    let Date: String
}
