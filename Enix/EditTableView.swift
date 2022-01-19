import UIKit
import CoreData

var firstLoadEdit = true

var timeArray = [Expense]() as [Time]
var timeArray1 = [Income]() as [Time]

class EditTableView: UITableViewController
{
//    var timeArray = [Expense]() as [Time]
//    var timeArray1 = [Income]() as [Time]
    override func viewDidLoad()
    {
        
        timeArray = expenseList as [Time]
        timeArray1 = incomeList as [Time]
        timeArray += timeArray1
        timeArray.sort { Double($0.time) < Double($1.time) }
        print(timeArray.count)
        
        //timeArray.sort { Double($0.time) < Double($1.time) }
        
//        for exp in expenseList
//        {
//        print(exp.food)
//        print(exp.time)
//        print(exp.subscription)
//        print(exp.personal)
//        print(exp.stuff)
//        }
        
        //deleteRecords()
    }
    
    func deleteRecords() -> Void {
        let moc = getContext()
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Expense")

         let result = try? moc.fetch(fetchRequest)
            let resultData = result as! [Expense]

            for object in resultData {
                moc.delete(object)
            }

            do {
                try moc.save()
                print("saved!")
            } catch let error as NSError  {
                print("Could not save \(error), \(error.userInfo)")
            } catch {

            }

    }

    // MARK: Get Context

    func getContext () -> NSManagedObjectContext {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        return appDelegate.persistentContainer.viewContext
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        print("Got to tableView")
        let noteCell = tableView.dequeueReusableCell(withIdentifier: "noteCellID", for: indexPath) as! NoteCell
        
        let thisTime: Time!
        thisTime = timeArray[timeArray.count - 1 - indexPath.row]

        if expenseList.contains(where: {$0.time == thisTime.time})
        {
           let thisExpense: Expense!
            thisExpense = expenseList[expenseList.firstIndex(where: {$0.time == thisTime.time}) ?? 0]

           if(thisExpense.food != "0")
           {
           noteCell.titleLabel.text = "Food"
           noteCell.descLabel.text = "\(thisExpense.food!)" //money for food
           noteCell.timeNoteCell = Double(thisExpense.time!)
           }
           else if (thisExpense.personal != "0")
           {
               noteCell.titleLabel.text = "Personal"
               noteCell.descLabel.text = "\(thisExpense.personal!)" //money for personal
               noteCell.timeNoteCell = Double(thisExpense.time!)
           }
           else if (thisExpense.stuff != "0")
           {
               noteCell.titleLabel.text = "Stuff"
               noteCell.descLabel.text = "\(thisExpense.stuff!)" //money for stuff
               noteCell.timeNoteCell = Double(thisExpense.time!)
           }
           else
           {
               noteCell.titleLabel.text = "Subscription"
               noteCell.descLabel.text = "\(thisExpense.subscription!)" //money for stuff
               noteCell.timeNoteCell = Double(thisExpense.time!)
           }
           
           //noteCell.titleLabel.text = "Food" // outputs in ascending order, needs to be sorted!
           //noteCell.descLabel.text = "\(thisExpense.time!)" //money for food
           print(indexPath.row)
           print(thisExpense.time)
           
           return noteCell
        }
        else
        {
           let thisIncome: Income!
           thisIncome = incomeList[incomeList.firstIndex(where: {$0.time == thisTime.time}) ?? 0]

           if(thisIncome.commission != "0")
           {
           noteCell.titleLabel.text = "Commission"
           noteCell.descLabel.text = "\(thisIncome.commission!)" //money for food
           noteCell.timeNoteCell = Double(thisIncome.time!)
           }
           else if (thisIncome.other != "0")
           {
               noteCell.titleLabel.text = "Other"
               noteCell.descLabel.text = "\(thisIncome.other!)" //money for personal
               noteCell.timeNoteCell = Double(thisIncome.time!)
           }
           else if (thisIncome.photo != "0")
           {
               noteCell.titleLabel.text = "Photo"
               noteCell.descLabel.text = "\(thisIncome.photo!)" //money for stuff
               noteCell.timeNoteCell = Double(thisIncome.time!)
           }
           else
           {
               noteCell.titleLabel.text = "Work"
               noteCell.descLabel.text = "\(thisIncome.work!)" //money for stuff
               noteCell.timeNoteCell = Double(thisIncome.time!)
           }
           
           //noteCell.titleLabel.text = "Food" // outputs in ascending order, needs to be sorted!
           //noteCell.descLabel.text = "\(thisExpense.time!)" //money for food
           print(indexPath.row)
           print(thisIncome.time)
           
           return noteCell
        }
        
        //

    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return expenseList.count + incomeList.count
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        self.performSegue(withIdentifier: "editNote", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        if(segue.identifier == "editNote")
        {
            let indexPath = tableView.indexPathForSelectedRow!
            let cell = tableView.cellForRow(at: indexPath) as! NoteCell
            
            print(cell.descLabel.text)
            print(cell.titleLabel.text)
            

            let noteDetail = segue.destination as? EditVC
            
            noteDetail!.selectedNote = cell
            
            tableView.deselectRow(at: indexPath, animated: true)
        }
    }
    
    override func viewDidAppear(_ animated: Bool)
    {
        tableView.reloadData()
    }
    
    
    
}
