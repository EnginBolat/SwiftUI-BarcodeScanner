//
//  ContentView.swift
//  BarcodeScanner
//
//  Created by Engin Bolat on 20.06.2024.
//

import SwiftUI

struct BarcodeScannerView: View {
    
    @StateObject var viewModel = BarcodeScannerViewModel()
        
    var body: some View {
        NavigationView {
            VStack {
                ScannerView(scannedCode: $viewModel.scannedCode,
                            alertItem: $viewModel.alertItem)
                    .frame(maxWidth: .infinity,maxHeight: 350)
                
                Spacer().frame(height: 60)
                
                Label(
                    title: { Text("Scanned Barcode") },
                    icon: { Image(systemName: "barcode.viewfinder") }
                ).font(.title)
                
                Text(viewModel.statusText)
                    .bold()
                    .font(.largeTitle)
                    .foregroundStyle(viewModel.statusTextColor)
                    .padding()
            }
            .navigationTitle("Barcode Scanner")
            .alert(item: $viewModel.alertItem,content: {
                alertItem in Alert(title: Text(alertItem.title),
                                   message: Text(alertItem.message),
                                   dismissButton: alertItem.dismissButton)
            })
        }
    }
}

#Preview {
    BarcodeScannerView()
}
