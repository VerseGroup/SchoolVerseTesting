//
//  TabBarItemViewModifier.swift
//  SchoolVerseTesting
//
//  Created by Steven Yu on 5/23/22.
//

import Foundation
import SwiftUI

struct TabBarItemsPreferenceKey: PreferenceKey {
    static var defaultValue: [TabBarItem] = []
    
    static func reduce(value: inout [TabBarItem], nextValue: () -> [TabBarItem]) {
        value += nextValue()
    }
}

struct TabBarItemViewModifer: ViewModifier {
    
    @State private var didLoad: Bool = false
    let tab: TabBarItem
    let selection: TabBarItem
    
    func body(content: Content) -> some View {
        ZStack {
            if didLoad || selection == tab {
                content
                    .preference(key: TabBarItemsPreferenceKey.self, value: [tab])
                    .opacity(selection == tab ? 1 : 0)
                    .onAppear {
                        didLoad = true
                    }
            }
        }
    }

}

extension View {
    
    /// Tag a View with a value. Use selection to determine which tab is currently displaying.
    func tabBarItem(tab: TabBarItem, selection: TabBarItem) -> some View {
        modifier(TabBarItemViewModifer(tab: tab, selection: selection))
    }
    
}
