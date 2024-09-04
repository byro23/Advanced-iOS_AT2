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
        case landing
        case register
        case pay
        case deposit
        case transfer
        case profile
    }
    
    enum Tab {
        case home
        case pay
    }
    
    @Published var path = NavigationPath()
    @Published var currentTab = Tab.home
}

