//
//  CountryListView.swift
//  SupHealth
//
//  Created by Benjamin Ludwig on 16/06/2020.
//  Copyright © 2020 benjazor. All rights reserved.
//

import Foundation
import SwiftUI

struct CountryListView: View {

    @EnvironmentObject var countriesVM : CountriesViewModel
    @State private var isRefreshing = false
    @State private var showFavorites = false

    // Returns the correct country array according to the showFavorites property
    private func getFavoriteFilteredCountryArray() -> [Country] {
        return !self.showFavorites ?
            countriesVM.countries :
            countriesVM.countries.filter { self.countriesVM.favorties.contains($0.CountryCode)
                
            }
    }
    
    // Returns a boolean value telling us is the country is vaforite or not
    private func isFavorite(country: Country) -> Bool {
        return self.countriesVM.favorties.contains( country.CountryCode )
    }

    var body: some View {
        
        // List View
        NavigationView {
            
            List( getFavoriteFilteredCountryArray() ) { country in
                
                NavigationLink(
                    // Details View
                    destination: DetailView (
                        country: country,
                        isFavorite: self.isFavorite(country: country)
                    )
                ) {
                    // Item View
                    CountryItemView (
                        country: country,
                        isFavorite: self.isFavorite(country: country)
                    )
                }
            }
                // Pull to refresh handler
                .pullToRefresh(isShowing: $isRefreshing) {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                        self.isRefreshing = false
                    }
                    self.countriesVM.fetchCountries()
                }
            
                // Navigation view Title
                .navigationBarTitle(Text("Informations"))
                    
                // Navigation view Items
                .navigationBarItems(trailing: HStack() {
                    
                    Toggle(isOn: $showFavorites) {
                        Text("Favorites")
                    }
                    
                })
        }
    }
}
