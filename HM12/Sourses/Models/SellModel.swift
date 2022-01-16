//
//  SellModel.swift
//  HM12
//
//  Created by Александр Петрович on 16.01.2022.
//

import UIKit

struct CellModel {
    
    enum CellAccecoryType {
        case switchCell
        case disclosureIndicator
        case detailButton
    }

    enum CellStyle {
        case subtitle, value1, value2, `default`
    }
    
    let icon: UIImage?
    let title: String
    let style: CellStyle
    var detailTextLabel: String?
    let type: CellAccecoryType?
}
