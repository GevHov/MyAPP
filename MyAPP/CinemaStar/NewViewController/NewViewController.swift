//
//  NewViewController.swift
//  MyAPP
//
//  Created by Gevorg Hovhannisyan on 07.04.22.
//

import UIKit

class NewViewController: UIViewController {
    
    //MARK: - @IBOutlet
    @IBOutlet weak var viewerImage: UIImageView!

    
    // MARK: - Properties
    var imageURL: String!
    
    
    // MARK: - LifeCycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        setupImageViewer()
        
    }
    
    
    // MARK: - Private Methods
    private func setupImageViewer() {
        
        guard let name = imageURL, let imageURL = URL(string: name) else { return }
        
        viewerImage.load(url: imageURL)
    }
}

