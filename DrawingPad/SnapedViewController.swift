//
//  SnapedViewController.swift
//  DrawingPad
//
//  Created by RUPAM LAHA on 13/05/20.
//  Copyright © 2020 RUPAM LAHA. All rights reserved.
//

import UIKit

class SnapedViewController: UIViewController {

    @IBOutlet weak var snapedImage: UIImageView!
    
    var img = UIImage()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        snapedImage.image = img
        
    }
    
    //Done button tapped
    @IBAction func doneTapped(_ sender: Any) {
        
        self.dismiss(animated: true, completion: nil)
    }
    
    //Share button tapped
    @IBAction func shareTapped(_ sender: Any) {
        
        let shareVC = UIActivityViewController(activityItems: [img], applicationActivities: nil)
        shareVC.popoverPresentationController?.sourceView = self.view
        self.present(shareVC, animated: true, completion: nil)
        
    }
}
