
class Schedule {
    var task: String
    var next: Schedule?

    init(task: String, next: Schedule? = nil) {
        self.task = task
        self.next = next
    }
}

func createCalendar() -> [[[Schedule?]]] {
    var calendar = [[[Schedule?]]](repeating: [], count: 12)
 
    
    for i in 0..<12 {
      
        var nDays: Int
        
        switch i + 1 {
        case 1, 3, 5, 7, 8, 10, 12:
            nDays = 31
        case 4, 6, 9, 11:
            nDays = 30
        default:
            nDays = 28
        }
        
        for _ in 0..<nDays {
            calendar[i].append([])
        }
    }
    return calendar
}

var myCalendar = createCalendar()
var moreTask = true

while moreTask {
    print("Enter the Month: ")
    
    guard let mount = readLine(), let monthInt = Int(mount) else {
        print("Invalid input Month")
        continue
    }

    print("Enter the Day: ")
    
    guard let day = readLine(), let dayInt = Int(day) else {
        print("Invalid input Day")
        continue
    }

    print("Enter the Task: ")
    
    guard let taskDay = readLine() else {
        print("Invalid input Task")
        continue
    }

    let taskOnDayMonth = Schedule(task: taskDay)
    myCalendar[monthInt - 1][dayInt - 1].append(taskOnDayMonth)

    print("Do you want to add more tasks? (Y/N)")
    
    guard let confirmation = readLine(), confirmation.lowercased() == "y" else {
        moreTask = false
        continue
    }
}




for (monthIndex, month) in myCalendar.enumerated() {
  
    for (dayIndex, dayTasks) in month.enumerated() {
      
        if !dayTasks.isEmpty {
            print("\nMes \(monthIndex + 1), Día \(dayIndex + 1):")

            for (taskIndex, task) in dayTasks.enumerated() {
                print("    Tarea \(taskIndex + 1): \(task?.task ?? "N/A")")
            }
            print("-------------------------")
        }
    }
}