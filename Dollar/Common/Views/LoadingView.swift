//
//  LoadingView.swift
//  Dollar
//
//  Created by Daniil Belikov on 01.09.2021.
//  Copyright © 2021 belikov.dev. All rights reserved.
//

import SwiftUI

struct LoadingView: View {
    
    var body: some View {
        ProgressView()
            .progressViewStyle(CircularProgressViewStyle(tint: .white))
    }
    
}

struct LoadingView_Previews: PreviewProvider {
    
    static var previews: some View {
        LoadingView()
    }
    
}
