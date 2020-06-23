//
//  DetailsView.swift
//  SupHealth
//
//  Created by Benjamin Ludwig on 16/06/2020.
//  Copyright © 2020 benjazor. All rights reserved.
//

import Foundation
import SwiftUI

struct DetailView: View {
    
    @EnvironmentObject var countriesVM : CountriesViewModel
    @Environment(\.colorScheme) var colorScheme
    
    let country: Country
    @State var isFavorite : Bool
    
    var body: some View {
        ScrollView(.vertical) {
            
            HStack {
                Spacer()
            }
            
            DetailItem(
                labelText: "Cases",
                totalNumber: country.TotalConfirmed,
                dailyNumber: country.NewConfirmed,
                color: Color(UIColor.systemOrange)
            )
            
            DetailItem(
                labelText: "Deaths",
                totalNumber: country.TotalDeaths,
                dailyNumber: country.NewDeaths,
                color: Color(UIColor.systemRed)
            )
            
            DetailItem(
                labelText: "Recovered",
                totalNumber: country.TotalRecovered,
                dailyNumber: country.NewRecovered,
                color: Color(UIColor.systemGreen)
            )
            
        }
        .padding([.top, .horizontal])
        .navigationBarTitle(country.Country)
        .navigationBarItems(trailing:
            Button(action: {
                withAnimation {self.isFavorite.toggle()}
                if self.isFavorite {
                    self.countriesVM.favorties.append( self.country.CountryCode )
                } else {
                    self.countriesVM.favorties = self.countriesVM.favorties.filter { $0 != self.country.CountryCode}
                }
            }) {
                Image(systemName: isFavorite ? "star.fill" : "star")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 32.0)
                    .foregroundColor(
                        isFavorite ?
                            (colorScheme == .dark ? Color(UIColor.systemYellow) : .yellow):
                            Color(UIColor.systemGray3)
                    )
            }
        )
    }
}
