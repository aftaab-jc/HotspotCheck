//
//  Hotspot Checker .swift
//  Hotspot check
//
//  Created by Aftaab Mulla on 01/01/26.
//

import Network
import Combine

final class HotspotChecker: ObservableObject {
    private let monitor = NWPathMonitor()
    private let queue = DispatchQueue(label: "HotspotChecker")

    @Published var alreadyConnectedToHotspot = false

    init() {
        monitor.pathUpdateHandler = { path in
            DispatchQueue.main.async {
                self.alreadyConnectedToHotspot =
                    path.status == .satisfied &&
                    path.usesInterfaceType(.wifi) &&
                    path.isExpensive
            }
        }
        monitor.start(queue: queue)
    }
}

