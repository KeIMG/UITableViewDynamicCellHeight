//
//  CustomCell.swift
//  UITableViewDynamicCellHeight
//
//  Created by Ke Ma on 19/05/2017.
//  Copyright © 2017 Ke Ma. All rights reserved.
//

import UIKit

class CustomCell: UITableViewCell
{
  var nameLabel: UILabel = {
    let label = UILabel()
    label.textColor = .black
    label.numberOfLines = 0
    label.font = UIFont(name: "AvenirNext-DemiBold", size: 16)
    
    return label
  }()
  
  var detailLabel: UILabel = {
    let label = UILabel()
    label.textColor = .lightGray
    label.numberOfLines = 0
    label.font = UIFont(name: "Avenir-Book", size: 12)
    label.lineBreakMode = .byWordWrapping
    
    
    return label
  }()
  
  override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    
    let marginGuide = contentView.layoutMarginsGuide
    
    // Config Name Label
    contentView.addSubview(nameLabel)
    nameLabel.translatesAutoresizingMaskIntoConstraints = false
    nameLabel.leadingAnchor.constraint(equalTo: marginGuide.leadingAnchor).isActive = true
    nameLabel.topAnchor.constraint(equalTo: marginGuide.topAnchor).isActive = true
    nameLabel.trailingAnchor.constraint(equalTo: marginGuide.trailingAnchor).isActive = true
    
    // Config Detail Label
    contentView.addSubview(detailLabel)
    detailLabel.translatesAutoresizingMaskIntoConstraints = false
    detailLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor).isActive = true
    detailLabel.leadingAnchor.constraint(equalTo: marginGuide.leadingAnchor).isActive = true
    detailLabel.trailingAnchor.constraint(equalTo: marginGuide.trailingAnchor).isActive = true
    detailLabel.bottomAnchor.constraint(equalTo: marginGuide.bottomAnchor).isActive = true
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}

