//
//  ContentView.swift
//  Knock64
//
//  Created by 白数叡司 on 2024/05/18.
//

import CoreLocation
import MapKit
import SwiftUI

struct ContentView: View {
    @StateObject var viewState: ContentViewState = .init()
    
    var body: some View {
        ZStack {
            if let location = viewState.location {
                Map(
                    initialPosition:
                        MapCameraPosition.region(
                            MKCoordinateRegion(
                                center: location,
                                latitudinalMeters: 300,
                                longitudinalMeters: 300
                            )
                        )
                ) {
                    Annotation("User", coordinate: location) {
                        ZStack {
                            RoundedRectangle(cornerRadius: 25)
                                .frame(width: 50, height: 50)
                                .foregroundStyle(.red)
                        }
                    }
                    .annotationTitles(.hidden)
                }
            } else {
                ProgressView()
            }
        }
        .onAppear {
            viewState.onAppear()
        }
    }
    
}

class ContentViewState: NSObject, ObservableObject {
    @Published var location: CLLocationCoordinate2D?
    private let locationManager = CLLocationManager()
    
    func onAppear() {
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        let status = locationManager.authorizationStatus
        switch status {
        case .authorizedWhenInUse:
            locationManager.startUpdatingLocation()
        default:
            break
        }
    }
}

extension ContentViewState: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        switch status {
        case .authorizedWhenInUse:
            locationManager.startUpdatingLocation()
        default:
            break
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        self.location = manager.location?.coordinate
    }
}

#Preview {
    ContentView(viewState: ContentViewState())
}
