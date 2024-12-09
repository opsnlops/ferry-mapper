import SwiftUI
import MapKit

struct VesselMapView: View {
    @State private var region: MKCoordinateRegion
    let vessels: [VesselLocation]

    init(vessels: [VesselLocation]) {
        self.vessels = vessels
        self._region = State(initialValue: VesselMapView.calculateRegion(for: vessels))
    }

    var body: some View {
        Map(coordinateRegion: $region, annotationItems: vessels) { vessel in
            MapMarker(
                coordinate: CLLocationCoordinate2D(latitude: vessel.latitude, longitude: vessel.longitude),
                tint: .purple
            )
        }
    }

    static func calculateRegion(for vessels: [VesselLocation]) -> MKCoordinateRegion {
        guard !vessels.isEmpty else {
            // If no vessels, default to Whidbey Island area or some fallback.
            return MKCoordinateRegion(
                center: CLLocationCoordinate2D(latitude: 48.0379, longitude: -122.4458),
                span: MKCoordinateSpan(latitudeDelta: 0.2, longitudeDelta: 0.2)
            )
        }

        let latitudes = vessels.map { $0.latitude }
        let longitudes = vessels.map { $0.longitude }

        let minLat = latitudes.min()!
        let maxLat = latitudes.max()!
        let minLon = longitudes.min()!
        let maxLon = longitudes.max()!

        let centerLat = (minLat + maxLat) / 2.0
        let centerLon = (minLon + maxLon) / 2.0

        // Provide a little padding so the markers don't sit right on the edges.
        let latDelta = (maxLat - minLat) * 1.2
        let lonDelta = (maxLon - minLon) * 1.2

        return MKCoordinateRegion(
            center: CLLocationCoordinate2D(latitude: centerLat, longitude: centerLon),
            span: MKCoordinateSpan(latitudeDelta: latDelta, longitudeDelta: lonDelta)
        )
    }
}

