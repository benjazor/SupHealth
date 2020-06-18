//
//  NetworkingManager.swift
//  SupHealth
//
//  Created by Benjamin Ludwig on 14/06/2020.
//  Copyright © 2020 benjazor. All rights reserved.
//

import Foundation
import SwiftUI
import Combine

class NetworkingManager: ObservableObject {
    var didChange = PassthroughSubject<NetworkingManager, Never>() // Define the didChange property
    
    var countryList = CountriesAPIList(Countries: []) { // Define the countryList property
        didSet {
            didChange.send(self) // Action executed when property value is changed
        }
    }
    
    init() { // Class init
        guard let url = URL(string: "https://api.covid19api.com/summary") else { return } // Set the request url
        
        URLSession.shared.dataTask(with: url) {(data, _, _) in // Prepare the request
            guard let data = data else { return } // Catch the data
            let countryList = try! JSONDecoder().decode(CountriesAPIList.self, from: data) // Decode the data
            DispatchQueue.main.async { // Prepare an ascynchronous call
                self.countryList = countryList // Set countryList property the value of decoded api data
            }
        }.resume() // Execute the request
    }
}
