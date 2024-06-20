//
//  BarcodeScannerViewModel.swift
//  BarcodeScanner
//
//  Created by Engin Bolat on 20.06.2024.
//

import SwiftUI

final class BarcodeScannerViewModel: ObservableObject {
    
    @Published var scannedCode  : String        = ""
    @Published var alertItem    : AlertItem?
    
    var statusText: String {
        return scannedCode.isEmpty ? "Not Yet Scanned" : scannedCode
    }
    
    var statusTextColor: Color {
        return statusText.isEmpty ? .red : .green
    }
}
