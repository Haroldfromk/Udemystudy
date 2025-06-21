//
//  DetailView.swift
//  H4X0R News
//
//  Created by Dongik Song on 9/8/24.
//

import SwiftUI

struct DetailView: View {
    
    let url: String?
    
    var body: some View {
        WebView(urlString: url)
    }
}

#Preview {
    DetailView(url: "https://www.google.com")
}
