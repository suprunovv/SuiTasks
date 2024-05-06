import SwiftUI

struct VpnView: View {
    
    private enum Constants {
        static let titles = ["IP Address", "Received", "Sent"]
        static let values = ["127.0.0.1", "0 MB", "0 MB"]
    }
    
    @State var isOnToggle = false
    
    var body: some View {
        VStack {
            Spacer().frame(maxHeight: 80)
            toggleBody
            Spacer().frame(maxHeight: 53)
            descriptionBody
            Spacer()
            Text("Service will expire after 15 days.").padding(.bottom)
                .font(.system(size: 18))
        }
    }
    
    private var toggleBody: some View {
        VStack(alignment: .center, spacing: 45) {
                Image("flag")
                Toggle(isOn: $isOnToggle) {
                    Text("")
                }.frame(maxWidth: 54)
            }
    }
    
    private var descriptionBody: some View {
        createDescription(titles: Constants.titles, values: Constants.values)
    }
    
    private func createDescription(titles: [String], values: [String]) -> some View {
        return HStack(spacing: 40) {
            VStack(alignment: .leading, spacing: 14) {
                ForEach(titles.indices, id: \.self) {
                    Text(titles[$0])
                        .font(.system(size: 18))
                }
            }
            VStack(alignment: .trailing, spacing: 14) {
                ForEach(values.indices, id: \.self) {
                    Text(values[$0])
                        .font(.system(size: 18, weight: .bold))
                }
            }
        }
    }
}
