//
//  ContentView.swift
//  Knock62
//
//  Created by 白数叡司 on 2024/05/11.
//

import SwiftUI
import MapKit

extension CLLocationCoordinate2D {
    static let akihabara = CLLocationCoordinate2D(
        latitude: 35.7005,
        longitude: 139.7726
    )
}

struct ContentView: View {
    @State private var position: MapCameraPosition = .region(
        MKCoordinateRegion(
            center: .akihabara,
            latitudinalMeters: 300,
            longitudinalMeters: 300
        )
    )
    
    var body: some View {
        Map(position: $position)
    }
}

#Preview {
    ContentView()
}
