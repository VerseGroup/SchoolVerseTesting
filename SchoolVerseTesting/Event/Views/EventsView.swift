//
//  EventsView.swift
//  SchoolVerseTesting
//
//  Created by Steven Yu on 5/19/22.
//

import SwiftUI

struct EventsView: View {
    @StateObject var eventListVM: EventListViewModel = EventListViewModel()
    
    var body: some View {
        VStack {
            List {
                ForEach(eventListVM.events) { event in
                    EventCellView(event: event)
                        .listRowBackground(EmptyView())
                        .listRowSeparator(.hidden)
                }
            }
        }
        .navigationTitle("Events 🗓️")
    }
}

struct EventsView_Previews: PreviewProvider {
    static var previews: some View {
        EventsView()
    }
}
