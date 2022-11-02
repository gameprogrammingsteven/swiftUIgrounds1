//
//  bindableViewModel.swift
//  swiftUIgrounds1
//
//  Created by Stephen Johnson on 11/1/22.
//

import Foundation
import SwiftUI
import Combine


class BindableViewModelList: ObservableObject {
    @Published var list:[BindableViewModel] = [BindableViewModel]()
}

struct BindableViewModel: Identifiable {
    let id = UUID()
    let name: String
    let idNumber: Int
}

