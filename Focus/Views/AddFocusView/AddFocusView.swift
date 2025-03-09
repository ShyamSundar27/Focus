//
//  AddFocusView.swift
//  Focus
//
//  Created by shyam-15059 on 08/03/25.
//


import SwiftUI
import SwiftData

struct AddFocusView: View {
    @StateObject private var viewModel: AddFocusViewModel
    @Environment(\.dismiss) private var dismiss
    @Environment(\.modelContext) var context
    
    init() {
        _viewModel = StateObject(wrappedValue: AddFocusViewModel(context: nil))
    }
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 20) {
                
                // MARK: - Header
                HeaderTextView(prefixText: "create a", highlightText: "new focus")
                    .padding(.top, 20)
                
                TextField("what do you want to focus on?", text: $viewModel.name)
                    .padding(20)
                    .background(
                        RoundedRectangle(cornerRadius: 20)
                            .fill(XColor.CustomBG)
                    )
                    
                    .font(XFont.XRegular(16))
                    .foregroundColor(.black)
                    
                    .padding(.horizontal, 20)
                
                Spacer()
                
                // MARK: - Add Button
                Button(action: {
                    viewModel.addFocusData()
                    dismiss()
                }) {
                    Text("Add")
                        .font(.system(size: 18, weight: .semibold))
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.black)
                        .cornerRadius(20)
                }
                .padding(.horizontal, 20)
                .alert(isPresented: $viewModel.showAlert) {
                    Alert(title: Text("Error"), message: Text(viewModel.alertMessage), dismissButton: .default(Text("OK")))
                }
            }
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button(action: {
                        dismiss()
                    }) {
                        Image(systemName: "chevron.left")
                            .foregroundColor(.black)
                    }
                }
            }
            .background(Color.white)
            .padding(.bottom, 20)
        }
        .background(Color.white)
        .onAppear { 
            viewModel.context = context
        }
        
    }
}

//#Preview {
//    AddFocusView(context: ModelContext())
//}
