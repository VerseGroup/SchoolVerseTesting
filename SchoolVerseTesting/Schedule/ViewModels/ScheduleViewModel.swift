//
//  ScheduleViewModel.swift
//  SchoolVerseTesting
//
//  Created by Steven Yu on 5/15/22.
//

import Foundation
import Combine

class ScheduleViewModel: ObservableObject {
    private let repo = ScheduleRepository()
    @Published var errorMessage: String?
    
    @Published var dayEvents: [DayEvent] = []
    @Published var schedule: Schedule?
    
    @Published var selectedDayEvent: DayEvent?
    
    private var cancellables = Set<AnyCancellable>()
    
    init() {
        addSubscribers()
        print(selectedDayEvent?.id ?? "no id")
         // automatically set selectedDayEvent to today
    }
    
    func addSubscribers() {
        repo.$dayEvents
            .sink { [weak self] (returnedDayEvents) in
                self?.dayEvents = returnedDayEvents
//                print(self?.dayEvents.debugDescription)
            }
            .store(in: &cancellables)
        
        repo.$schedule
            .sink { [weak self] (returnedSchedule) in
                self?.schedule = returnedSchedule
            }
            .store(in: &cancellables)
        
        // sets selectedDayEvent to the current day
        $dayEvents
            .sink { (dayEvents) in
                self.selectedDayEvent = dayEvents.first(where: { dayEvent in
                    Calendar.current.isDateInToday(dayEvent.date)
                }) ?? nil
                print(self.selectedDayEvent?.id ?? "no id2")
            }
            .store(in: &cancellables)
    }
    
    //source: https://www.hackingwithswift.com/example-code/system/how-to-check-whether-one-date-is-similar-to-another
}
