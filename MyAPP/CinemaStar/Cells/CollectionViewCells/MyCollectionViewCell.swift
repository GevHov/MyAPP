//
//  MyCollectionViewCell.swift
//  MyAPP
//
//  Created by Gevorg Hovhannisyan on 07.04.22.
//

import UIKit
import Kingfisher

class MyCollectionViewCell: UICollectionViewCell {
    
    //MARK: - ID
    static let id = "MyCollectionViewCell"
    
    //MARK: - @IBOutlet
    @IBOutlet weak var imageView: UIImageView!
    
    var models = [Models]()

    //MARK: - LifeCycle Methods
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
                
        if let model = URL(string: models.description) {
            
            imageView.kf.setImage(with: model, placeholder: UIImage(systemName: "folder"))
            
        }
    }
}
