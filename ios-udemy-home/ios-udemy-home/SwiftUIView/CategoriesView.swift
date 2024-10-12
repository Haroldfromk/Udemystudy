//
//  CategoriesView.swift
//  ios-udemy-home
//
//  Created by Dongik Song on 10/10/24.
//

import SwiftUI

struct CategoriesView: View {
    let titles: [String]
    
    var onTap: ((String) -> Void)?
    
    var midPoint: Int {
        return Int(titles.count / 2)
    }
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            LazyVStack(alignment: .leading, spacing: 8) {
                HStack {
                    ForEach(titles[..<midPoint], id: \.self) { title in
                        CatgoryButton(title: title) {
                            onTap?(title)
                        }
                        
                    }
                }
                
                HStack {
                    ForEach(titles[midPoint...], id: \.self) { title in
                        CatgoryButton(title: title) {
                            onTap?(title)
                        }
                        
                    }
                }
            }
            .padding(.horizontal, 20)
        }
    }
}

struct CatgoryButton: View {
    let title: String
    let onTap: (() -> Void)?
    
    var body: some View {
        Button {
            self.onTap?()
        } label: {
            Text(title)
                .padding(.all, 12)
                .font(.system(size: 10,weight: .semibold))
                .foregroundStyle(.black)
                .background(RoundedRectangle(cornerRadius: 20, style: .continuous).stroke(.black, lineWidth: 1.0))
        }
    }
}

#Preview {
    CategoriesView(titles: Category.allCases.map({$0.rawValue.camelCaseToEnglish.useShortAndFormat}))
}
