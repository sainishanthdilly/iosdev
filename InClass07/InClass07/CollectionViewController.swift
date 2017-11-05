//
//  CollectionViewController.swift
//  InClass07
//
//  Created by Sai Nishanth Dilly on 10/26/17.
//  Copyright © 2017 Sai Nishanth Dilly. All rights reserved.
//

import UIKit
import Firebase
import SDWebImage




class CollectionViewController: UICollectionViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
  
    
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("selected")
        print(indexPath.row)
        self.performSegue(withIdentifier: "fullPhotoIdentifier", sender: collectionView.cellForItem(at: indexPath))
        
    }
    
    var listURLS = Array<PhotosCl>()
    
    
    
    
    let imagesRef = Storage.storage().reference().child("images");
    
    var childRef = Database.database().reference().child("MyImages").child((Auth.auth().currentUser?.uid)!)

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        print("segue")
        print(sender as! VideoCell)
        //print(collectionView?.indexPath(for: sender as! VideoCell))
        
        let i = sender as! VideoCell
        let ip = collectionView?.indexPath(for:i)
        
        if let x = segue.destination as? UINavigationController{
            if let c = x.visibleViewController as? PhotoViewController{
                
                c.stringURL = listURLS[ip!.row].imgURL
                c.idToDelete = listURLS[ip!.row].id
                
                
            }
    }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        childRef.observe(.value) {[weak self] snapshot in
            if let c = self?.listURLS.count {
                if c>0{
                    self?.listURLS.removeAll()}
            }
            
            for child in snapshot.children {
                
                
                
                let snap = child as! DataSnapshot
                let ids = snap.children.allObjects[0] as! DataSnapshot
                let imgURL = snap.children.allObjects[1] as! DataSnapshot
               // print(imgURL.value!)
                let obj = PhotosCl( ids.value as! String ,iURL: imgURL.value as! String )
                
                self?.listURLS.append(obj)
                
                
            }
            
            self?.collectionView?.reloadData()
            
        }

       
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return listURLS.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellID", for: indexPath) as! VideoCell
        
        
        cell.myImage!.sd_setImage(with: URL(string: self.listURLS[indexPath.row].imgURL), placeholderImage: UIImage(named: "placeholder.png"))
        // Configure the cell
    
        return cell
    }
    
    
    @IBAction func addPhoto(_ sender: UIBarButtonItem) {
        
        let picker = UIImagePickerController()
        picker.delegate = self
        picker.allowsEditing = true
        self.present(picker, animated: true, completion: nil)
        
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        print("Cancelled")
        picker.dismiss(animated: true, completion: nil)
        
        
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        
        var selectedImg: UIImage?
        
        if let originalImage = info["UIImagePickerControllerOriginalImage"] as? UIImage{
            selectedImg = originalImage
            print(originalImage.size)
        }
        else if let editedImg = info["UIImagePickerControllerEditedImage"] as? UIImage{
            selectedImg = editedImg
            print(editedImg.size)
            
        }
        
        let upLoadData = UIImagePNGRepresentation(selectedImg!)
        
        let imName = NSUUID().uuidString
        
        imagesRef.child("\(imName).png").putData(upLoadData!, metadata: nil, completion:
    {(metadata, error) in
        
        if error != nil{
            print(error!)
            return
        }
        
        //print(metadata?.downloadURL()?.absoluteString)
        
        self.addImageHandler(metadata?.downloadURL()?.absoluteString, id: imName)
        


})
        
       picker.dismiss(animated: true, completion: nil)
        
    }
    
    func addImageHandler(_ url : String?, id ids: String?){
       // print(url!)
            listURLS.removeAll()
        childRef.child(ids!).updateChildValues(_: ["id":ids!,"imgURL":url!])
        
        
        
    }
    
    
    @IBAction func onLogout(_ sender: UIBarButtonItem) {
        
        do{
            try Auth.auth().signOut()
            self.dismiss(animated: true, completion: nil)
            
        }
        catch{
            
            print("Problems Signing out")
        }
    
    
        
    }
    
    

}







class VideoCell: UICollectionViewCell{
    
    
    var stringURL : String?
    
    
    
    @IBOutlet weak var myImage: UIImageView!
    

}




