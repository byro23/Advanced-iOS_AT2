//
//  NavigationController.swift
//  Advanced-iOS_AT2
//
//  Created by Byron Lester on 2/9/2024.
//

import Foundation
import SwiftUI

class NavigationController: ObservableObject {
    
    enum AppScreen: Hashable {
        case login
        case register
        case tab
        case transactions
        
    }
    
    enum Tab {
        case home
        case pay
        case transactions
        case categories
    }
    
    @Published var path = NavigationPath()
    @Published var currentTab = Tab.home
}

