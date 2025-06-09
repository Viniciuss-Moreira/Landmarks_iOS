//
//  Badge.swift
//  Landmarks
//
//  Created by Vinicius Silva Moreira on 06/06/25.
//

import SwiftUI

struct Badge: View {
    var badgeSymbols: some View {
        
        ForEach(0..<8) { index in
            RotateBadgeSymbol(
                angle: .degrees(Double(index) / Double(8) * 360.0)
            )
        }
        .opacity(0.5)
    }
    var body: some View {
        ZStack {
            BadgeBackground()
            
            
            GeometryReader { geometry in
                badgeSymbols
                    .scaleEffect(1.0 / 4.0, anchor: .top)
                    .position(x: geometry.size.width / 2, y: (3.0 / 4.0) * geometry.size.height)
            }
        }
        .scaledToFit()
    }
}

#Preview {
    Badge()
}
