//
//  BarcodeView.swift
//  Search
//
//  Created by Patsicha Tongteeka on 1/2/20.
//  Copyright © 2020 SCB. All rights reserved.
//

import UIKit

class BarcodeView: UIView {
  
  @IBOutlet private var titleLabel: UILabel!
  @IBOutlet private var imageView: UIImageView!
  
  func updateUI(string: String) {
    if let image = Generator.barcode(from: string,
                                     size: imageView.frame.size) {
        imageView.image = image
    }
    titleLabel.text = string
  }
  
  required public init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
    setContetnViewToFitParent()
  }
  
  public func setContetnViewToFitParent() {
    let view = loadViewFromNib()
    if bounds.height > bounds.width {
      view.transform = CGAffineTransform(rotationAngle: CGFloat.pi/2)
    }
    view.frame = bounds
    view.autoresizingMask = [.flexibleLeftMargin,
                             .flexibleTopMargin,
                             .flexibleRightMargin,
                             .flexibleBottomMargin,
                             .flexibleWidth,
                             .flexibleHeight]
    view.translatesAutoresizingMaskIntoConstraints = true
    addSubview(view)
  }
  
  public func loadViewFromNib() -> UIView {
    let bundle = Bundle(for: type(of: self))
    let nib = UINib(nibName: String(describing: type(of: self)), bundle: bundle)
    if let view = nib.instantiate(withOwner: self, options: nil)[0] as? UIView {
      return view
    }
    return UIView()
  }
}

extension UIView {
  func setTransformRotation(toDegrees angleInDegrees: CGFloat) {
    let angleInRadians = angleInDegrees / 180.0 * CGFloat.pi
    let rotation = self.transform.rotated(by: angleInRadians)
    self.transform = rotation
  }
}
