//
//  TaskListViewModel.swift
//  SchoolVerseTesting
//
//  Created by Steven Yu on 4/3/22.
//

import Foundation
import Combine

// TODO: change to dependency injection (DI)

class TaskListViewModel: ObservableObject {
    private let repo = TaskRepository()
    @Published var taskCellViewModels = [TaskCellViewModel]()
    @Published var errorMessage: String?
    
    private let api = APIService()
    @Published var apiStatus: Bool = false
    @Published var scrapeStatus: ScrapeMessage?
    @Published var scrapeException: String?
    
    @Published var showBanner: Bool = false
    @Published var bannerTitle: String = ""
    @Published var bannerDetail: String? = nil
    
    private var cancellables = Set<AnyCancellable>()
    
    init() {
        addSubscribers()
    }
    
    func addSubscribers() {
        
        // firebase vars
        
        // updates task cell view models
        repo.$tasks
            .map { tasks in
                tasks.map { task in
                    TaskCellViewModel(task: task)
                }
            }
            .sink { [weak self] (returnedTaskCellVMs) in
                self?.taskCellViewModels = returnedTaskCellVMs
            }
            .store(in: &cancellables)
        
        // updates error message
        repo.$errorMessage
            .sink { [weak self] (returnedErrorMessage) in
                self?.errorMessage = returnedErrorMessage
            }
            .store(in: &cancellables)
        
        // api vars
        
        api.$status
            .sink { [weak self] (returnedStatus) in
                self?.apiStatus = returnedStatus
                
                self?.bannerTitle = "API is \(returnedStatus ? "online" : "offline")!"
                self?.showBanner = true
            }
            .store(in: &cancellables)
        
        api.$scrapeStatus
            .sink { [weak self] (returnedScrapeStatus) in
                self?.scrapeStatus = returnedScrapeStatus
                
                self?.bannerTitle = returnedScrapeStatus?.description ?? "No status"
                self?.showBanner = true
            }
            .store(in: &cancellables)
        
        // dismisses scrapeStatus after 5 seconds
        $scrapeStatus
            .debounce(for: .seconds(5), scheduler: RunLoop.main)
            .sink { _ in
                self.scrapeStatus = nil
            }
            .store(in: &cancellables)
        
        api.$scrapeException
            .sink { [weak self] (returnedScrapeException) in
                self?.scrapeException = returnedScrapeException
                
                self?.bannerDetail = returnedScrapeException
            }
            .store(in: &cancellables)
        
        // dismisses scrapeException after 5 seconds
        $scrapeException
            .debounce(for: .seconds(5), scheduler: RunLoop.main)
            .sink { _ in
                self.scrapeException = nil
            }
            .store(in: &cancellables)
        
    }
    
    // checks if API is online
    func pingAPI() {
        api.ping()
    }
    
    // TODO: refactor later?
    let debouncer = Debouncer(timeInterval: 10)
    
    // don't scrape too much (MONEY!!!!!)
    func scrape() {
        debouncer.renewInterval()
        debouncer.handler = {
            self.api.scrape()
        }
    }
}
