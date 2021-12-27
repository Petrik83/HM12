//
//  SettingSellModel.swift
//  HM12
//
//  Created by Александр Петрович on 27.12.2021.
//

import UIKit

struct SettingCell {
    
    enum CellAccecoryType {
        case switchCell
        case disclosureIndicator
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

struct Section {
    let title: Int
    let options: [SettingCell]
}


