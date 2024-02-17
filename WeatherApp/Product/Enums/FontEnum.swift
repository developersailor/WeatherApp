//
//  Font.swift
//  WeatherApp
//
//  Created by Mehmet Fışkındal on 3.08.2023.
//

import Foundation
enum Font {
  case robotoBlack, robotoBlackItalic, robotoBold, robotoBoldItalic, robotoItalic, robotoLight, robotoLightItalic, robotoMedium, robotoMediumItalic, robotoRegular, robotoThin, robotoThinItalic
  func getFont() -> String {
    switch self {
    case .robotoBlack:
      return Fonts.robotoBlack
    case .robotoBlackItalic:
      return Fonts.robotoBlackItalic
    case .robotoBold:
      return Fonts.robotoBold
    case .robotoBoldItalic:
      return Fonts.robotoBoldItalic
    case .robotoItalic:
      return Fonts.robotoItalic
    case .robotoLight:
      return Fonts.robotoLight
    case .robotoLightItalic:
      return Fonts.robotoLightItalic
    case .robotoMedium:
      return Fonts.robotoMedium
    case .robotoMediumItalic:
      return Fonts.robotoMediumItalic
    case .robotoRegular:
      return Fonts.robotoRegular
    case .robotoThin:
      return Fonts.robotoThin
    case .robotoThinItalic:
      return Fonts.robotoThinItalic
    }
  }

}
