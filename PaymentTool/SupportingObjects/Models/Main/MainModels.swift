//
//  MainModels.swift
//  SwiftVIPBaseProject
//
//  Created by Boris Sortino on 11/07/2020.
//  Copyright © 2020 Boris Sortino. All rights reserved.
//

enum MainModels {
    enum State {
        case amount
        case paymentMethods
        case banks
        case installments
        case confirm
        case error
        case success
    }
    
    struct Request {
        // Data from View to Interactor/Workers
    }
    struct Response {
        // Modeled Data from Interactor to Presenter
    }
    struct ViewModel {
        // Modeled view Data from Presenter to View
    }
}
