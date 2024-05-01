//
//  ContentView.swift
//  AlertTask
//
//  Created by MacBookPro on 29.04.2024.
//

import SwiftUI

struct ContentView: View {
    
    private enum Constants {
        static let showButtonText = "Показать"
        static let emptyAlertText = "Пример Алерт"
        static let actionAlertLabel = "Это алерт с кнопкой"
        static let actionAlertText = "Пример Alert с 2 кнопками и логикой"
        static let toggleAlertText = "Текст изменён"
        static let titleText = "Alert & ActionSheet"
        static let actionSheetText = "Пример ActionSheet"
        static let actionSheetActionText = "Пример ActionSheet кнопками и логикой"
        static let hello = "Привет"
        static let helloWorld = "Hello World"
    }
    
    @State private var isEmptyAlert = false
    @State private var isActionAlert = false
    @State private var isEmtyActionSheet = false
    @State private var isNewText = false
    @State private var isActionActionSheet = false
    @State private var labelAlertAction = Constants.actionAlertLabel
    @State private var actionAlertText = Constants.actionAlertText
    
    var body: some View {
        VStack(alignment: .center, spacing: 60) {
            Text(Constants.titleText)
                .padding()
                .font(.title)
            HStack(alignment: .center, spacing: 58) {
                VStack(alignment: .center, spacing: 24) {
                    createLabel(text: Constants.emptyAlertText)
                    createLabel(text: actionAlertText)
                    createLabel(text: Constants.actionSheetText)
                    createLabel(text: Constants.actionSheetActionText)
                }
                
                VStack(alignment: .center, spacing: 24) {
                    showEmtyAlertButton()
                    showActionAlertButton()
                    showEmptyActionSheet()
                    showActionActionSheet()
                }
            } .padding([.leading, .trailing], 16)
             Spacer()
        }
    }
    
    private func showEmtyAlertButton() -> some View {
        Button {
            isEmptyAlert.toggle()
        } label: {
            Text(Constants.showButtonText)
        }.alert(isPresented: $isEmptyAlert) {
            Alert(title: Text(Constants.emptyAlertText))
        }.padding()
            .frame(maxWidth: 150, maxHeight: 48)
            .background(Color.blue)
            .clipShape(RoundedRectangle(cornerRadius: 12))
            .foregroundColor(.white)
    }
    
    private func showActionAlertButton() -> some View {
        Button {
            isActionAlert.toggle()
        } label: {
            Text(Constants.showButtonText)
        }.alert(isPresented: $isActionAlert) {
            Alert(title: Text(Constants.actionAlertLabel), dismissButton: .cancel(Text("Изменить текст"), action: {
                toggleTextAlert()
            }))
        } .padding()
            .frame(width: 150, height: 48)
            .background(Color.blue)
            .clipShape(RoundedRectangle(cornerRadius: 12))
            .foregroundColor(.white)
    }
    
    private func showEmptyActionSheet() -> some View {
        Button {
            isEmtyActionSheet.toggle()
        } label: {
            Text(Constants.showButtonText)
        }.actionSheet(isPresented: $isEmtyActionSheet) {
            ActionSheet(title: Text(Constants.actionSheetText))
        } .padding()
            .frame(width: 150, height: 48)
            .background(Color.blue)
            .clipShape(RoundedRectangle(cornerRadius: 12))
            .foregroundColor(.white)
    }
    
    private func showActionActionSheet() -> some View {
        Button {
            isActionActionSheet.toggle()
        } label: {
            Text(Constants.showButtonText)
        }.actionSheet(isPresented: $isActionActionSheet) {
            ActionSheet(title: Text(Constants.actionSheetActionText), buttons: [.cancel(Text(Constants.hello), action: {
                print(Constants.helloWorld)
            })])
        } .padding()
            .frame(width: 150, height: 48)
            .background(Color.blue)
            .clipShape(RoundedRectangle(cornerRadius: 12))
            .foregroundColor(.white)
    }
    
    private func createLabel(text: String) -> some View {
        Text(text)
            .frame(maxWidth: 150, maxHeight: .infinity, alignment: .leading)
            .frame(width: 150, height: 48)
            .fixedSize(horizontal: false, vertical: true)
            .font(.system(size: 13, weight: .black))
            .lineLimit(2)
    }
    
    private func toggleTextAlert() {
        isNewText.toggle()
        if isNewText {
            actionAlertText = Constants.toggleAlertText
        } else {
            actionAlertText = Constants.actionAlertText
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
