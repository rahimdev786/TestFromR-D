//
//  ViewController.swift
//  TestFromR&D
//
//  Created by arshad on 5/5/22.
//

import UIKit

class ViewController: UIViewController , UITextFieldDelegate{
    @IBOutlet weak var textValidation:UITextField!
    
    
    let data = CharacterSet(charactersIn: "")
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        textValidation.delegate = self
    }
    
    @IBAction func validateData(){
        
        let text =  textValidation.text!
        print(text)
        let dics = text.reduce([:]) { d, c -> Dictionary<Character ,Int> in
            var d = d
            let i = d[c] ?? 0
            d[c] = i + 1
            return d
        }
        print(dics)
        
        var sringData = [String]()
        for i in dics{
            sringData.append("\(i.key)\(i.value)")
        }
        print(sringData)
        let FinalData = sringData.joined(separator:"")
        print(FinalData)
        textValidation.text = ""
        
    }
}


extension ViewController{
    
    func alert(msg:String){
        let alert = UIAlertController(title: "Alert", message: msg, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(alert, animated: true)
    }
}

extension ViewController{
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
    
        if string.rangeOfCharacter(from: .letters) != nil  || string == ""{
            return true
        }else
        {
            self.alert(msg: "only letter are accepted")
            return false
        }
        
    }
}

