//
//  CourseCell.swift
//  Dollar
//
//  Created by Daniil Belikov on 01.09.2021.
//  Copyright © 2021 belikov.dev. All rights reserved.
//

import SwiftUI

struct CourseCell: View {
    
    let courseCellModel: CourseCellModel
    
    var body: some View {
        HStack {
            Image(courseCellModel.charCode)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 57.0, height: 34.0)
                .cornerRadius(4.0)
            
            Text(courseCellModel.currencyName)
                .foregroundColor(.white)
                .fontWeight(.regular)
                .padding(.leading, 6.0)
            
            Spacer()
            
            Text(courseCellModel.moneyValue)
                .foregroundColor(.white)
                .fontWeight(.regular)
        }
        .frame(height: 48.0,
               alignment: .center)
    }
    
}

struct CoursesCell_Previews: PreviewProvider {
    
    static var previews: some View {
        CourseCell(courseCellModel: CourseCellModel(charCode: "SCREENS.CURRENCYMANAGER.CHARCODE".localize(),
                                                    currencyName: "SCREENS.CURRENCYMANAGER.NAME".localize(),
                                                    moneyValue: "SCREENS.CURRENCYMANAGER.VALUE".localize()))
    }
    
}
