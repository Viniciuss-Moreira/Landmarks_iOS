//
//  RotateBadgeSymbol.swift
//  Landmarks
//
//  Created by Vinicius Silva Moreira on 06/06/25.
//

import SwiftUI

struct RotateBadgeSymbol: View {
    let angle: Angle
    
    var body: some View {
        BadgeSymbol()
            .padding(-60)
            .rotationEffect(angle, anchor: .bottom)
    }
}

#Preview {
    RotateBadgeSymbol(angle: Angle(degrees: 5))
}
