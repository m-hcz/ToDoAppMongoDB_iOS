//
//  SmallAddButton.swift
//  ToDoAppMongoDB
//
//  Created by M H on 28/12/2021.
//

import SwiftUI

struct SmallAddButton: View {
    var body: some View {
		ZStack {
			Circle()
				.frame(height: 50)
				.foregroundColor(.green)
			
			Image(systemName: "plus")
				.font(.system(size: 25))
				.foregroundColor(.white)
				
		} // z
		.frame(height: 50)
    }
}

struct SmallAddButton_Previews: PreviewProvider {
    static var previews: some View {
        SmallAddButton()
    }
}
