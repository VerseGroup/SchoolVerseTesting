//
//  SportsCellView.swift
//  SchoolVerseTesting
//
//  Created by Steven Yu on 5/20/22.
//

import SwiftUI

struct SportsCellView: View {
    let sports: SportsEvent
    @State var showSportsDetailView: Bool = false
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(sports.start.weekDateTimeString())
                Text(sports.description)
                    .font(.title2)
                    .bold()
                
                if let location = sports.location {
                    Text(location)
                        .font(.headline)
                }
            }
            Spacer()
        }
        .padding()
        .frame(maxWidth: .infinity)
        .foregroundColor(Color.white)
        .background(Color.purple)
        .cornerRadius(10)
        .sheet(isPresented: $showSportsDetailView) {
            SportsDetailView()
        }
        .onTapGesture {
            showSportsDetailView.toggle()
        }
    }
}

struct SportsCellView_Previews: PreviewProvider {
    static var previews: some View {
        SportsCellView(sports: SportsEvent(id: "id", description: "Description", location: "Location", start: Date(), end: Date()))
    }
}
