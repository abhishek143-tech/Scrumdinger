//
//  SpeakerArc.swift
//  Scrumdinger
//
//  Created by Abhishek Dilip Dhok on 28/10/23.
//

import SwiftUI

struct SpeakerArc: Shape {
    let speakerIndex: Int
    let totalSpeakers: Int

    private var degreesPerSpekar: Double {
        360.0 / Double(totalSpeakers)
    }

    private var startAngle: Angle {
        Angle(degrees: degreesPerSpekar * Double(speakerIndex) + 1.0)
    }

    private var endAngle: Angle {
        Angle(degrees: startAngle.degrees + degreesPerSpekar - 1.0)
    }

    func path(in rect: CGRect) -> Path {
        let diameter = min(rect.size.width, rect.size.height) - 24.0
        let radius = diameter / 2.0
        let center = CGPoint(x: rect.midX, y: rect.midY)
        return Path { path in
            path.addArc(center: center, radius: radius, startAngle: startAngle, endAngle: endAngle, clockwise: false)
        }
    }
}
