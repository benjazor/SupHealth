//
//  ContentView.swift
//  SupHealth
//
//  Created by Benjamin Ludwig on 14/06/2020.
//  Copyright © 2020 benjazor. All rights reserved.
//

import SwiftUI
import SwiftUIRefresh

struct ContentView: View {
    
    var body: some View {
        TabView {
            
            // General View
            VStack(alignment: .leading) {
                Text("Some information")
                    .bold()
                    .font(.title)
                Text("Bite")
                Spacer().frame(maxWidth: .infinity)
            }
        .padding()
                
                // Tab Icon
                .tabItem {
                    Image(systemName: "house.fill")
                    Text("General")
                }
            
            // Country List View
            CountryListView()
                
                // Tab Icon
                .tabItem {
                    Image(systemName: "list.dash")
                    Text("List")
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
