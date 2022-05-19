//
//  PeriodView.swift
//  SchoolVerseTesting
//
//  Created by Steven Yu on 5/18/22.
//

import SwiftUI

struct PeriodView: View {
    var period: PeriodInfo
    
    var body: some View {
        VStack {
            Text(period.period.description)
            VStack(alignment: .leading) {
                Text(period.startTime)
                Text(period.className)
                    .bold()
                HStack {
                    Text(period.information)
                    Spacer()
                }
            }
        }
    }
}

struct PeriodView_Previews: PreviewProvider {
    static var previews: some View {
        PeriodView(period: PeriodInfo(period: .periodOne, className: "Math", startTime: "9:00AM", information: "Mr. Evans"))
    }
}
