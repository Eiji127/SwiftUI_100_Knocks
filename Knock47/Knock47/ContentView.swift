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
    
    @State private var searchResults: [MKMapItem] = []
    
    var body: some View {
        Map {
            Annotation("Parking", coordinate: .parking) {
                ZStack {
                    RoundedRectangle(cornerRadius: 5)
                        .fill(.background)
                    RoundedRectangle(cornerRadius: 5)
                        .stroke(.secondary, lineWidth: 5)
                    Image(systemName: "car")
                        .padding(5)
                }
            }
            .annotationTitles(.hidden)
            
            ForEach(searchResults, id: \.self) { result in
                Marker(item: result)
            }
        }
        .mapStyle(.standard(elevation: .realistic))
        .safeAreaInset(edge: .bottom) {
            HStack {
                Spacer()
                BeantownButtons(searchResults: $searchResults)
                    .padding(.top)
                Spacer()
            }
            .background(.thinMaterial)
        }
    }
}

#Preview {
    ContentView()
}

