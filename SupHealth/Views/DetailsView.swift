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
    @State var isShareSheetShowing: Bool = false
    
    func shareButton() {
        isShareSheetShowing.toggle()
        
        let text = "\(country.Country): \(country.TotalConfirmed) Confirmed cases, \(country.TotalDeaths) Deaths, \(country.TotalRecovered) Recovered"
        let av = UIActivityViewController(activityItems: [text], applicationActivities: nil)
        UIApplication.shared.windows.first?.rootViewController?.present(av, animated: true, completion: nil)
        
    }
    
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
            HStack(spacing: 20.0) {
                Button(action: shareButton ) {
                    Image(systemName: "square.and.arrow.up")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 20.0)
                    .foregroundColor( Color(UIColor.systemBlue) )
                }
                
                
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
                        .frame(width: 28.0)
                        .foregroundColor(
                            isFavorite ?
                                (colorScheme == .dark ? Color(UIColor.systemYellow) : .yellow):
                                Color(UIColor.systemGray3)
                        )
                }
            }
        )
    }
}
