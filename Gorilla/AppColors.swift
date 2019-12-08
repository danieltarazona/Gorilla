//
//  AppColors.swift
//  Gorilla
//
//  Created by Daniel Tarazona on 12/7/19.
//  Copyright © 2019 Gorilla. All rights reserved.
//

import Foundation
import UIKit

struct AppColors {
  static let primaryColor = hexToUIColor(hex: "2EA2CC")
}

/**
 - Description: Convert the input string hex color into UIColor internal.
 - Parameter hex: The string of hex color.
 */
func hexToUIColor (hex: String) -> UIColor {

  let cString: String = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()

  if cString.count != 6 {
    return UIColor.gray
  }

  var rgbValue: UInt32 = 0
  Scanner(string: cString).scanHexInt32(&rgbValue)

  return UIColor(
    red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
    green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
    blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
    alpha: CGFloat(1.0)
  )
}



