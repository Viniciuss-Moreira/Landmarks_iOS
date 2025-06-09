//
//  LandmarkList.swift
//  Landmarks
//
//  Created by Vinicius Silva Moreira on 03/06/25.
//

import SwiftUI

struct LandmarkList: View {
    @Environment(ModelData.self) var modelData
    @State private var showFavoritesOnly = false
    var filteredLandmarks: [Landmark] {
        modelData.landmarks.filter { landmark in
            (!showFavoritesOnly || landmark.isFavorite)
        }
    }
    var body: some View {
        NavigationSplitView {
            List{
                Toggle(isOn: $showFavoritesOnly) {
                    Text("Apenas favoritos")
                }
                
                ForEach(filteredLandmarks) { landmark in
                NavigationLink {
                    LandmarkDetail(landmark: landmark)
                } label: {
                    LandmarkRow(landmark: landmark)
                }
            }
            }
            .animation(.default, value: filteredLandmarks)
            .navigationTitle("Pontos de Referência")
        } detail: {
            Text("Selecione um local para mais informações.")
        }
    }
}

#Preview {
    LandmarkList()
        .environment(ModelData())
}
