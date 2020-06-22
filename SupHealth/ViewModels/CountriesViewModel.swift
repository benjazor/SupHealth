//
//  CountriesViewModel.swift
//  SupHealth
//
//  Created by Benjamin Ludwig on 16/06/2020.
//  Copyright © 2020 benjazor. All rights reserved.
//

import Foundation
import SwiftUI

class CountriesViewModel: ObservableObject {
    
    // Published variables
    @Published var countries: [Country] = []
    @Published var favorties: [String] = UserDefaults.standard.array(forKey: "Favorites") as? [String] ?? [] as [String] {
        didSet {
            UserDefaults.standard.set(self.favorties, forKey: "Favorites")
        }
    }
    
    // Fetch countries when application Starts
    init() {
        fetchCountries()
    }
    
    // Update the countries property with the API data
    func fetchCountries() {
        
        guard let url = URL( string:"https://api.covid19api.com/summary" ) else { return }
        
        URLSession.shared.dataTask(with: url, completionHandler: {data, _, err in
        
        // Check if we got an error and data is ok
        guard let data = data, err == nil else {
            print("Something went wrong")
            return
        }
            
        // Update property countries in the right thread
            DispatchQueue.main.async {
                var decodedData: Response?
                do {
                    decodedData = try JSONDecoder().decode(Response.self, from: data)
                }
                catch {
                    print("JSON conversion failed: \(error.localizedDescription)")
                }
                self.countries = decodedData!.Countries
            }
        }).resume() // Execute request
        
    }
    
}
