//
//  AppFonts.swift
//  Gorilla
//
//  Created by Daniel Tarazona on 12/7/19.
//  Copyright © 2019 Gorilla. All rights reserved.
//

import Foundation
import UIKit.UIFont

let fontFamily = "Helvetica"

final class AppFonts {

  struct Title {
    static let bold = UIFont(name: "\(fontFamily)-Bold", size: 32)
    static let light = UIFont(name: "\(fontFamily)-Light", size: 32)
    static let medium = UIFont(name: "\(fontFamily)-Medium", size: 32)
    static let regular = UIFont(name: "\(fontFamily)-Regular", size: 32)
  }

  struct Subtitle {
    static let bold = UIFont(name: "\(fontFamily)-Bold", size: 27)
    static let light = UIFont(name: "\(fontFamily)-Light", size: 27)
    static let medium = UIFont(name: "\(fontFamily)-Medium", size: 27)
    static let regular = UIFont(name: "\(fontFamily)-Regular", size: 27)
  }

  struct Heading1 {
    static let bold = UIFont(name: "\(fontFamily)-Bold", size: 22)
    static let light = UIFont(name: "\(fontFamily)-Light", size: 22)
    static let medium = UIFont(name: "\(fontFamily)-Medium", size: 22)
    static let regular = UIFont(name: "\(fontFamily)-Regular", size: 22)
  }

  struct Heading2 {
    static let bold = UIFont(name: "\(fontFamily)-Bold", size: 20)
    static let light = UIFont(name: "\(fontFamily)-Light", size: 20)
    static let medium = UIFont(name: "\(fontFamily)-Medium", size: 20)
    static let regular = UIFont(name: "\(fontFamily)-Regular", size: 20)
  }

  struct Heading3 {
    static let bold = UIFont(name: "\(fontFamily)-Bold", size: 18)
    static let light = UIFont(name: "\(fontFamily)-Light", size: 18)
    static let medium = UIFont(name: "\(fontFamily)-Medium", size: 18)
    static let regular = UIFont(name: "\(fontFamily)-Regular", size: 18)
  }

  struct Heading4 {
    static let bold = UIFont(name: "\(fontFamily)-Bold", size: 16)
    static let light = UIFont(name: "\(fontFamily)-Light", size: 16)
    static let medium = UIFont(name: "\(fontFamily)-Medium", size: 16)
    static let regular = UIFont(name: "\(fontFamily)-Regular", size: 16)
  }

  struct Heading5 {
    static let bold = UIFont(name: "\(fontFamily)-Bold", size: 14)
    static let light = UIFont(name: "\(fontFamily)-Light", size: 14)
    static let medium = UIFont(name: "\(fontFamily)-Medium", size: 14)
    static let regular = UIFont(name: "\(fontFamily)-Regular", size: 14)
  }

  struct Heading6 {
    static let bold = UIFont(name: "\(fontFamily)-Bold", size: 12)
    static let light = UIFont(name: "\(fontFamily)-Light", size: 12)
    static let medium = UIFont(name: "\(fontFamily)-Medium", size: 12)
    static let regular = UIFont(name: "\(fontFamily)-Regular", size: 12)
  }

}
