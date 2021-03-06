//
//  FeedCollectionViewController.swift
//  ceoJokes
//
//  Created by Shaan Appel on 2/23/16.
//  Copyright © 2016 Shaan Appel. All rights reserved.
//

import UIKit

private let reuseIdentifier = "Cell"

class FeedCollectionViewController: UICollectionViewController {

    var names = ["Steve Jobs", "Tim Cook", "Bill Gates", "Larry Page", "Satya Nadella", "Michael S. Dell"]
    var productsAry = [["iphone", "ipad", "itouch", "ipod"], ["iphone", "ipad", "itouch", "ipod"], ["surface", "xbox", "nokia"], ["car", "cardboard", "glass"], ["surface", "xbox", "nokia"], ["desktop", "TV", "alienware"]]
    var jokes = ["How many programmers does it take to change a light bulb? None. It's a hardware problem.", "A programmer is at work when his wife calls and asks him to go to the store. She says she needs a gallon of milk, and if they have fresh eggs, buy a dozen. He comes home with 12 gallons of milk.", "I would tell you a UDP joke, but you might not get it.", "If you put a million monkeys at a million keyboards, one of them will eventually write a Java program. The rest of them will all write Perl programs.", "What do you call 8 Hobbits? A Hobbyte.", "Why aren't jokes funny in octal? Because seven ten eleven."]
    var prof_images = ["steve_jobs", "tim_cook", "bill_gates-1", "larry_page-1", "satya_nadella", "michael_dell"]
    var img_urls = ["https://en.wikipedia.org/wiki/Steve_Jobs", "https://en.wikipedia.org/wiki/Tim_Cook", "https://en.wikipedia.org/wiki/Bill_Gates", "https://en.wikipedia.org/wiki/Larry_Page", "https://en.wikipedia.org/wiki/Satya_Nadella", "https://en.wikipedia.org/wiki/Michael_Dell"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = UIColor(red: 52.0/255.0, green: 152.0/255.0, blue: 219.0/255.0, alpha: 1.0)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

    // MARK: UICollectionViewDataSource

    override func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }


    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return names.count
    }

    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(reuseIdentifier, forIndexPath: indexPath) as! FeedCollectionViewCell
    
        // Configure the cell
        cell.ceoName.text = names[indexPath.item];
        cell.ceoName.textColor = UIColor(red: 52.0/255.0, green: 73.0/255.0, blue: 94.0/255.0, alpha: 1.0)
        cell.backgroundColor = UIColor.whiteColor()
        cell.layer.cornerRadius = 5
        cell.ceoJokeLabel.text = jokes[indexPath.item];
        cell.ceoJokeLabel.textColor = UIColor(red: 52.0/255.0, green: 73.0/255.0, blue: 94.0/255.0, alpha: 1.0)
    
        let image = UIImage(named: prof_images[indexPath.item])
        cell.ceoImage.layer.borderWidth = 1
        cell.ceoImage.layer.borderColor = UIColor.blackColor().CGColor
        cell.ceoImage.layer.cornerRadius = cell.ceoImage.frame.height/2
        cell.ceoImage.clipsToBounds = true
        cell.ceoImage.image = image
        cell.ceoImage.accessibilityIdentifier = prof_images[indexPath.item]
        print(cell.ceoImage.accessibilityIdentifier)
        
        let tapGesture = UITapGestureRecognizer(target: self, action: "imageTapped:")

        // add it to the image view;
        cell.ceoImage.addGestureRecognizer(tapGesture)
        // make sure imageView can be interacted with by user
        cell.ceoImage.userInteractionEnabled = true
        
        return cell
    }
    
    func imageTapped(gesture: UIGestureRecognizer) {
        // if the tapped view is a UIImageView then set it to imageview
        
        if let picture = gesture.view as? UIImageView {
            //Send to URL
            print("tapped! right here!")
            for(var i = 0; i < prof_images.count; i++) {
                print(picture.accessibilityIdentifier)
                print(prof_images[i])
                if picture.accessibilityIdentifier == prof_images[i] {
                    print(prof_images[i])
                    if let url = NSURL(string: img_urls[i]) {
                        UIApplication.sharedApplication().openURL(url)
                    }
                }
            }
        }
    }
    
    override func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        self.performSegueWithIdentifier("ToProducts", sender: indexPath)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "ToProducts" {
            let vc = segue.destinationViewController as! ProductsTableViewController
            let row = (sender as! NSIndexPath).item
            let ary = productsAry[row]
            vc.productNames = ary
        }
    }


    // MARK: UICollectionViewDelegate

    /*
    // Uncomment this method to specify if the specified item should be highlighted during tracking
    override func collectionView(collectionView: UICollectionView, shouldHighlightItemAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment this method to specify if the specified item should be selected
    override func collectionView(collectionView: UICollectionView, shouldSelectItemAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
    override func collectionView(collectionView: UICollectionView, shouldShowMenuForItemAtIndexPath indexPath: NSIndexPath) -> Bool {
        return false
    }

    override func collectionView(collectionView: UICollectionView, canPerformAction action: Selector, forItemAtIndexPath indexPath: NSIndexPath, withSender sender: AnyObject?) -> Bool {
        return false
    }

    override func collectionView(collectionView: UICollectionView, performAction action: Selector, forItemAtIndexPath indexPath: NSIndexPath, withSender sender: AnyObject?) {
    
    }
    */

}
