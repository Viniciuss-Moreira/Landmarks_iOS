//
//  CategoryHome.swift
//  Landmarks
//
//  Created by Vinicius Silva Moreira on 07/06/25.
//

import SwiftUI

struct CategoryHome: View {
    @Environment(ModelData.self) var modelData
    @State private var showingProfile = false
    
    var body: some View {
        NavigationSplitView{
            List{
                PageView(pages: modelData.features.map {FeatureCard(landmark: $0)})
                    .listRowInsets(EdgeInsets())
                
                ForEach(modelData.categories.keys.sorted(), id: \.self) { key in
                    CategoryRow(categoryName: key, items: modelData.categories[key]!)
                }
                .listRowInsets(EdgeInsets())
            }
            .listStyle(.inset)
                    .navigationTitle("Destaque")
                    .toolbar {
                        Button {
                            showingProfile.toggle()
                        } label: {
                            Label("Perfil de Usuario", systemImage: "person.crop.circle")
                        }
                    }
                    .sheet(isPresented: $showingProfile) {
                        ProfileHost()
                            .environment(modelData)
                    }
            
        } detail: {
            Text("Selecione um ponto de referência")
        }
    }
}

#Preview {
    CategoryHome()
        .environment(ModelData())
}
