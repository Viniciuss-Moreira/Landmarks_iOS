//
//  ContentView.swift
//  Landmarks
//
//  Created by Vinicius Silva Moreira on 29/05/25.
//

import SwiftUI

struct ContentView: View {
    @State private var selection: Tab = .featured
    
    enum Tab {
        case featured
        case list
    }
    
    var body : some View {
        TabView(selection: $selection) {
            CategoryHome()
                .tabItem{
                    Label("Destaques", systemImage: "star")
                }
                .tag(Tab.featured)
            
            LandmarkList()
                .tabItem{
                    Label("Listas", systemImage: "list.bullet")
                }
                .tag(Tab.featured)
            
            LandmarkList()
                .tag(Tab.list)
        }
    }
}

#Preview {
    ContentView()
        .environment(ModelData())
}
