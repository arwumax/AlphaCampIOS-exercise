protocol RaceDelegate {
    func raceDidStart()
    func raceStatus(lapNumber: Int, first: AnyObject)
    func raceDidEnd(winner: AnyObject)
}

// Participants

class Horse {
    func giddyUp() {}
}

class Car {
    func vroomVroom() {}
}

class RaceCar {
    func readySetGo() {}
}

// Races

class Race {
    var laps: Int = 0
    var delegate: RaceDelegate?
    
    func start() {
        // Some set up
    }
    
    func updateProgress() {
        
    }
    
    func end() {
        // Some tear down
    }
}

class HorseRace: Race {
    
    let participants: [Horse]
    
    init(laps: Int, horses: [Horse]) {
        self.participants = horses
        super.init()
        self.laps = laps
    }
    
    override func start() {
        delegate?.raceDidStart()
    }
    
    override func updateProgress() {
        laps += 1
        delegate?.raceStatus(laps, first: Horse())
    }
    override func end() {
        delegate?.raceDidEnd(Horse())
    }
}

// Tracker

class Tracker: RaceDelegate {
    func raceDidStart() {
        println("Tracker notified that the race started!")
    }
    
    func raceStatus(lapNumber: Int, first: AnyObject) {
        println("Tracker notified that race status has been updated! Current lap: \(lapNumber) with first place: \(first)")
    }
    
    func raceDidEnd(winner: AnyObject) {
        println("Tracker notified that the race ended! The winner is: \(winner)")
    }
    
}

// Usage

let participants: [Horse] = [Horse(), Horse(), Horse()]
let race = HorseRace(laps: 4, horses: participants)

let tracker = Tracker()
race.delegate = tracker
race.start()

// Broadcast Class


class Broadcast: RaceDelegate {
    func raceDidStart() {
        println("Hey everyone!!!! The race started!")
    }
    
    func raceStatus(lapNumber: Int, first: AnyObject) {
        println("Woot woot! Another lap finished")
    }
    
    func raceDidEnd(winner: AnyObject) {
        println("Yayy! The race ended and the winner is \(winner)")
    }
}

race.delegate = Broadcast()
race.end()

