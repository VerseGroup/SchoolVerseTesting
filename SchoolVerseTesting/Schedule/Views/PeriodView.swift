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
        VStack(alignment: .leading) {
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
            .padding()
            .foregroundColor(Color.white)
            .background(Color.purple)
            .cornerRadius(5)
        }
    }
}

struct PeriodView_Previews: PreviewProvider {
    static var previews: some View {
        PeriodView(period: PeriodInfo(period: .periodOne, className: "Math", startTime: "9:00AM", information: "Mr. Evans"))
    }
}
