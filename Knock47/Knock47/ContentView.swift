//
//  ContentView.swift
//  Knock47
//
//  Created by 白数叡司 on 2024/04/10.
//

import SwiftUI
import MapKit

extension CLLocationCoordinate2D {
    static let parking = CLLocationCoordinate2D(latitude: 42.354528, longitude: -71.068369)
}

struct ContentView: View {
    var body: some View {
        Map {
            Marker("Parking", coordinate: .parking)
        }
    }
}

#Preview {
    ContentView()
}

