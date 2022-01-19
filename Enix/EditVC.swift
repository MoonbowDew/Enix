import UIKit
import CoreData

class EditVC: UIViewController
{
    var selectedNote: NoteCell? = nil
    
    @IBOutlet weak var titleTF: UITextField!
    
    //@IBOutlet weak var descTV: UITextView!
    
    @IBOutlet weak var categoryLBL: UILabel!
    
    override func viewDidLoad()
    {
        print("you're somewhere here")
        super.viewDidLoad()
        if(selectedNote != nil)
        {
            categoryLBL.text = selectedNote!.titleLabel.text
            titleTF.text = selectedNote!.descLabel.text //number

        }
        
        
    }
    
    
    @IBAction func saveAction(_ sender: Any) {
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context: NSManagedObjectContext = appDelegate.persistentContainer.viewContext

        print("in save Action")
        print(titleTF.text)
        print(categoryLBL.text)
            let requestEx = NSFetchRequest<NSFetchRequestResult>(entityName: "Expense")
            let requestIn = NSFetchRequest<NSFetchRequestResult>(entityName: "Income")
            do {
                let resultsEx:NSArray = try context.fetch(requestEx) as NSArray
                let resultsIn:NSArray = try context.fetch(requestIn) as NSArray
                
                let results1 = resultsEx as! [Expense]
                let results2 = resultsIn as! [Income]
                
                if results1.contains(where: {Double($0.time) == selectedNote!.timeNoteCell})
                {
                    
                for result in resultsEx
                {
                    

                    let note = result as! Expense
                    if(Double(note.time) == selectedNote!.timeNoteCell)
                    {
                        if(note.food == selectedNote!.descLabel.text)
                        {
                            note.food = titleTF.text
                        }
                        else if note.stuff == selectedNote!.descLabel.text
                        {
                            note.stuff = titleTF.text
                        }
                        else if note.personal == selectedNote!.descLabel.text
                        {
                            note.personal = titleTF.text
                        }
                        else if note.subscription == selectedNote!.descLabel.text
                        {
                            note.subscription = titleTF.text
                        }

                        
                            //print("in if statement")

                        
                    
                    }
                }
                }
                    
                    else
                    {
                        for result in resultsIn
                        {
                        let note = result as! Income
                        if(Double(note.time) == selectedNote!.timeNoteCell)
                        {
                            if(note.commission == selectedNote!.descLabel.text)
                            {
                                note.commission = titleTF.text
                            }
                            else if note.other == selectedNote!.descLabel.text
                            {
                                note.other = titleTF.text
                            }
                            else if note.photo == selectedNote!.descLabel.text
                            {
                                note.photo = titleTF.text
                            }
                            else if note.work == selectedNote!.descLabel.text
                            {
                                note.work = titleTF.text
                            }

                            
                                //print("in if statement")
                            try context.save()
                            navigationController?.popViewController(animated: true)
                            
                        
                        }
                        }
                
                    }
            }
            catch
            {
                print("Fetch Failed")
            }
    }
}
