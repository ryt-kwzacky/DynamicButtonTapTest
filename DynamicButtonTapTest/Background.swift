//
//  Background.swift
//  DynamicButtonTapTest
//
//  Created by Ryuton on 2019/11/21.
//  Copyright © 2019 Ryuton. All rights reserved.
//

import SwiftUI

struct Background: View {
    var body: some View {
        ZStack {
            Image("background")
                .blur(radius: 15)
            Color.black
                .opacity(0.7)
        }
    }
}

struct Background_Previews: PreviewProvider {
    static var previews: some View {
        Background()
    }
}
