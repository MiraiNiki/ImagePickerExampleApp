//
//  ViewController.swift
//  imagepicker
//
//  Created by MiraiNIKI on 2017/09/21.
//  Copyright © 2017年 UnivercityofTsukuba. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIImagePickerControllerDelegate,
    UINavigationControllerDelegate {

    @IBOutlet weak var photoImageView: UIImageView!
    @IBOutlet weak var label: UILabel!
    // pickerのインスタンスを作成
    let picker = UIImagePickerController()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        // pickerのdelegate先を
        picker.delegate = self

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
            let chosenImage = info[UIImagePickerControllerOriginalImage] as! UIImage //2
            photoImageView.contentMode = .scaleAspectFit //3
            photoImageView.image = chosenImage //4
            dismiss(animated: true, completion: nil) //5
    }

    func imagePickerControllerDidCancel(picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }

    @IBAction func picButtonPushed(_ sender: Any) {
        let album = UIImagePickerControllerSourceType.photoLibrary
        if UIImagePickerController.isSourceTypeAvailable(album) {
            picker.sourceType = UIImagePickerControllerSourceType.photoLibrary
            picker.allowsEditing = true
            self.present(picker, animated: true, completion: nil)
        }
    }

}

