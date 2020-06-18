//
//  CountryItemView.swift
//  SupHealth
//
//  Created by Benjamin Ludwig on 17/06/2020.
//  Copyright © 2020 benjazor. All rights reserved.
//

import Foundation
import SwiftUI

struct CountryItemView: View {
    
    var country: Country
    var isFavorite: Bool
    
    var body: some View {
        
        // Navigation cell
        HStack() {
            
            // Country flag
            Image(country.CountryCode)
                .resizable()
                .cornerRadius(8.0)
                .scaledToFit()
                .frame(width: 64.0)
            
            // Country name label
            Text(country.Country)
            
            Spacer()
            
            // Favorite indicator
            if self.isFavorite {
                Image(systemName: "star.fill").foregroundColor(.yellow)
            }
        }
        
    }
}
