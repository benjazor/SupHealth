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
            HomeView()
                
                // Tab Icon
                .tabItem {
                    Image(systemName: "globe")
                    Text("Global")
                }
            
            // Country List View
            CountryListView()
                
                // Tab Icon
                .tabItem {
                    Image(systemName: "list.dash")
                    Text("Countries")
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
