//
//  ContentView.swift
//  SuiTasks
//
//  Created by MacBookPro on 01.05.2024.
//

import SwiftUI
/// Вью плеера
struct PlayerView: View {
    @State private var progress: Float = 0
    @State private var isDownloadTap = false
    @State private var isSendTap = false
    @ObservedObject var viewModel = PlayerViewModel()
    
    var body: some View {
        VStack(spacing: 30) {
            Spacer()
            Image(viewModel.currentSong.imageName)
                .resizable()
                .clipShape(RoundedRectangle(cornerRadius: 12))
                .scaledToFit()
                .frame(maxWidth: 280, maxHeight: 280)
            HStack {
                Image(viewModel.currentSong.autorImage)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 60, height: 60)
                    .clipShape(RoundedRectangle(cornerRadius: 30))
                VStack(alignment: .leading) {
                    HStack {
                        Text(viewModel.currentSong.autor).foregroundColor(.white)
                        Spacer()
                        createButton(image: "download") {
                            isDownloadTap.toggle()
                        }.actionSheet(isPresented: $isDownloadTap) {
                            ActionSheet(title: Text("\(viewModel.currentSong.name) сохранен в загрузки"))
                        }
                        createButton(image: "send") {
                            isSendTap.toggle()
                        }.alert(isPresented: $isSendTap) {
                            Alert(title: Text("Поделится?"), primaryButton: .default(Text("Да")), secondaryButton: .cancel(Text("Нет")))
                        }

                    }
                    Text(viewModel.currentSong.name).foregroundColor(.white)
                }
            }
            HStack {
                Slider(value: Binding(get: {
                    viewModel.currentDuration
                }, set: { newValue in
                    progress = newValue
                    viewModel.setTime(value: newValue)
                }), in: 0...viewModel.maxDuration)
                .tint(.white)
                .scaleEffect(CGSize(width: 1, height: 1))
                Text(viewModel.currentTime).frame(maxWidth: 61, maxHeight: 21)
                    .foregroundColor(.white)
            }
            Spacer(minLength: 10)
            HStack(spacing: 40) {
                createButton(image: "back") {
                    viewModel.backTrack()
                }
                createButton(image: "pause") {
                    viewModel.startPlay()
                }.frame(width: 66, height: 66)
                createButton(image: "next") {
                    viewModel.nextTrack()
                }
            }
            Spacer()
        }
        .padding()
        .background(Color.background)
    }
    
    private func createButton(image: String, action: @escaping () -> ()) -> some View {
        Button(action: action) {
            Image(image)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        PlayerView()
    }
}
