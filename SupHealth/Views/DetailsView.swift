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
    
    let country: Country
    @State var isFavorite : Bool
    
    var body: some View {
        VStack(alignment: .leading) {
            
            HStack(spacing: 50) {
                VStack() {
                    Text(String(country.NewConfirmed))
                        .font(.custom("AppleSDGothicNeo-Thin", size: 40))
                    Text("New case\(country.NewConfirmed > 0 ? "s" : "")")
                        .font(.headline)
                }
                VStack() {
                    Text(String(country.TotalConfirmed))
                        .font(.custom("AppleSDGothicNeo-Thin", size: 40))
                    Text("Total case\(country.TotalConfirmed > 0 ? "s" : "")")
                        .font(.headline)
                }
            }.frame(maxWidth: .infinity)
            
            HStack(spacing: 50) {
                VStack() {
                    Text(String(country.NewDeaths))
                        .font(.custom("AppleSDGothicNeo-Thin", size: 40))
                    Text("New death\(country.NewDeaths > 0 ? "s" : "")")
                        .font(.headline)
                }
                VStack() {
                    Text(String(country.TotalDeaths))
                        .font(.custom("AppleSDGothicNeo-Thin", size: 40))
                    Text("Total death\(country.TotalDeaths > 0 ? "s" : "")")
                        .font(.headline)
                }
            }.frame(maxWidth: .infinity)
            
            HStack(spacing: 50) {
                VStack() {
                    Text(String(country.NewRecovered))
                        .font(.custom("AppleSDGothicNeo-Thin", size: 40))
                    Text("New recovered")
                        .font(.headline)
                }
                VStack() {
                    Text(String(country.TotalRecovered))
                        .font(.custom("AppleSDGothicNeo-Thin", size: 40))
                    Text("Total recovered")
                        .font(.headline)
                }
            }.frame(maxWidth: .infinity)
            
            Spacer().frame(maxWidth: .infinity)
            }
        .padding(10)
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
                    .foregroundColor(.yellow)
            }
            
        )
    }
}
