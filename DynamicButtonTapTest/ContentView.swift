//
//  ContentView.swift
//  DynamicButtonTapTest
//
//  Created by Ryuton on 2019/11/21.
//  Copyright © 2019 Ryuton. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var viewModel = ScoreViewModel()

    var body: some View {
        VStack {
            VStack(alignment: .leading) {
                HStack {
                    Image("line")
                        .resizable()
                        .frame(width: 25, height: 25)
                    Text("LINE")
                        .foregroundColor(.gray)
                    Spacer()
                    Text("now")
                        .foregroundColor(.gray)
                        .font(.system(size: 15))
                }
                Text("score: \(viewModel.score)")
                    .lineLimit(10)
            }
                .padding()
                .background(TextBackgroundView())
            Button(action: {
                self.viewModel.score += 1
            }) {
                Text("Add Score")
            }
        }
    }
}

class ScoreViewModel: ObservableObject {
    @Published var score = 0
}

struct TextBackgroundView: View {
    var color: Color = Color.gray.opacity(0.05)
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                Path { path in
                    let w = geometry.size.width
                    let h = geometry.size.height
                    path.move(to: CGPoint(x: 0, y: 0))
                    path.addLine(to: CGPoint(x: 0, y: h))
                    path.addLine(to: CGPoint(x: w, y: h))
                    path.addLine(to: CGPoint(x: w, y: h))
                    path.addLine(to: CGPoint(x: w, y: 0))
                    path.addLine(to: CGPoint(x: 0, y: 0))
                }
                .fill(self.color)
                .cornerRadius(12)
                .frame(width: UIScreen.screenWidth * (97/100))
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

extension UIScreen {
   static let screenWidth = UIScreen.main.bounds.size.width
   static let screenHeight = UIScreen.main.bounds.size.height
   static let screenSize = UIScreen.main.bounds.size
}
