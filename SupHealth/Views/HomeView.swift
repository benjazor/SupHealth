//
//  HomeView.swift
//  SupHealth
//
//  Created by Benjamin Ludwig on 23/06/2020.
//  Copyright © 2020 benjazor. All rights reserved.
//

import Foundation
import SwiftUI

struct HomeView: View {
    
    @EnvironmentObject var countriesVM : CountriesViewModel
    
    var body: some View {
        
        NavigationView() {
            ScrollView(.vertical) {
                HStack() {
                    Text("Worldwide COVID-19 evolution")
                        .font(.headline)
                    Spacer()
                }
                .padding(.horizontal, 10)
                    
                    DetailItem(
                        labelText: "Cases",
                        totalNumber: countriesVM.global?.TotalConfirmed ?? 0,
                        dailyNumber: countriesVM.global?.NewConfirmed ?? 0,
                        color: Color(UIColor.systemOrange))
                    
                    DetailItem(
                        labelText: "Deaths",
                        totalNumber: countriesVM.global?.TotalDeaths ?? 0,
                        dailyNumber: countriesVM.global?.NewDeaths ?? 0,
                        color: Color(UIColor.systemRed)
                    )
                    
                    DetailItem(
                        labelText: "Recovered",
                        totalNumber: countriesVM.global?.TotalRecovered ?? 0,
                        dailyNumber: countriesVM.global?.NewRecovered ?? 0,
                        color: Color(UIColor.systemGreen)
                    )
            }
            .navigationBarTitle( Text("SupHealth") )
            
        }
    }
    
}
