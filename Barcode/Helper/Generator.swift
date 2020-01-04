//
//  Generator.swift
//  Barcode
//
//  Created by Patsicha Tongteeka on 1/4/20.
//  Copyright © 2020 SCB. All rights reserved.
//

import UIKit

struct Generator {
    static func barcode(from string: String, size: CGSize? = nil) -> UIImage? {
      let data = string.data(using: String.Encoding.utf8)
      if let filter = CIFilter(name: "CICode128BarcodeGenerator") {
        filter.setValue(data, forKey: "inputMessage")
        filter.setValue(0.00, forKey: "inputQuietSpace")
        guard let outputImage = filter.outputImage else { return nil }
        if let size = size {
          let scaleX = size.width / outputImage.extent.size.width
          let scaleY = size.height / outputImage.extent.size.height
          let transform = CGAffineTransform(scaleX: scaleX, y: scaleY)
          let barcodeImageGenerated = outputImage.transformed(by: transform)
          return UIImage(ciImage: barcodeImageGenerated)
        }
        return UIImage(ciImage: outputImage)
      }
      return nil
    }
}
