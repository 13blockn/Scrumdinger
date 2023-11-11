//
//  ThemeView.swift
//  Scrumdinger
//
//  Created by Nate Block on 11/10/23.
//

import SwiftUI


struct ThemeView: View {
    var theme: Theme
    var body: some View {
        Text(theme.name)
            .padding(4)
            .frame(maxWidth: .infinity)
            .background(theme.mainColor)
            .foregroundColor(theme.accentColor)
            .clipShape(RoundedRectangle(cornerRadius: 4))

    }
}


struct ThemeView_Previews: PreviewProvider {
    static var previews: some View {
        ThemeView(theme: Theme.buttercup)
    }
}
