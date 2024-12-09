//
//  ContentView.swift
//  MapTest
//
//  Created by April White on 11/30/24.
//

import MapKit
import SwiftUI

struct ContentView: View {


    private var region: MKCoordinateRegion {
        MKCoordinateRegion(
            center: CLLocationCoordinate2D(latitude: 47.967693, longitude: -122.327357),
            span: MKCoordinateSpan(latitudeDelta: 0.2, longitudeDelta: 0.2)
        )
    }

    var body: some View {
        Map(initialPosition: .region(region))

        
    }
}

#Preview {
    ContentView()
}
