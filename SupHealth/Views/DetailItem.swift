//
//  DetailItem.swift
//  SupHealth
//
//  Created by Benjamin Ludwig on 22/06/2020.
//  Copyright © 2020 benjazor. All rights reserved.
//

import Foundation
import SwiftUI

struct DetailItem: View {
    
    // Properties
    var labelText: String
    var totalNumber: Int
    var dailyNumber: Int
    var color: Color
    
    // Struct init
    init(labelText: String, totalNumber: Int, dailyNumber: Int, color: Color) {
        self.labelText = labelText
        self.totalNumber = totalNumber
        self.dailyNumber = dailyNumber
        self.color = color
    }
    
    // Body
    var body: some View {
        HStack {
            // Label
            Text( labelText )
                .font(.headline)
            
            Spacer()
            
            // Data
            VStack(alignment: .trailing) {
                
                Text( String(totalNumber) )
                    .font(.title)
                    .fontWeight(.black)
                    .foregroundColor(color)
                
                Text( "+ \(String(dailyNumber)) Today")
                    .font(.caption)
                    .foregroundColor(color)
                
            }
        }
        .padding(20.0)
        .background(Color(UIColor.systemGray6))
        .cornerRadius(12.0)
        .padding(8.0)
    }
}
