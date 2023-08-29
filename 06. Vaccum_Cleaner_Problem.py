import random

class Environment(object):
    def __init__(self):
        # Initialize locations and conditions
        # 0 indicates Clean and 1 indicates Dirty
        self.locationCondition = {'A': 0, 'B': 0}
        # Randomize conditions in locations A and B
        self.locationCondition['A'] = random.randint(0, 1)
        self.locationCondition['B'] = random.randint(0, 1)

class SimpleReflexVacuumAgent(Environment):
    def __init__(self, Environment):
        print(Environment.locationCondition)
        # Instantiate performance measurement
        Score = 0
        # Place vacuum at a random location
        vacuumLocation = random.randint(0, 1)
        # If vacuum is at A
        if vacuumLocation == 0:
            print("Vacuum is randomly placed at Location A.")
            # and Location A is Dirty.
            if Environment.locationCondition['A'] == 1:
                print("Location A is Dirty.")
                # Suck the dirt and mark it clean
                Environment.locationCondition['A'] = 0
                Score += 1
                print("Location A has been Cleaned.")
                # Move to B
                print("Moving to Location B…")
                Score -= 1
                # If B is Dirty
                if Environment.locationCondition['B'] == 1:
                    print("Location B is Dirty.")
                    # Suck and mark clean
                    Environment.locationCondition['B'] = 0
                    Score += 1
                    print("Location B has been Cleaned.")
            else:
                # Move to B
                Score -= 1
                print("Moving to Location B…")
                # If B is Dirty
                if Environment.locationCondition['B'] == 1:
                    print("Location B is Dirty.")
                    # Suck and mark clean
                    Environment.locationCondition['B'] = 0
                    Score += 1
                    print("Location B has been Cleaned.")
        elif vacuumLocation == 1:
            print("Vacuum randomly placed at Location B.")
            # and B is Dirty
            if Environment.locationCondition['B'] == 1:
                print("Location B is Dirty.")
                # Suck and mark clean
                Environment.locationCondition['B'] = 0
                Score += 1
                print("Location B has been Cleaned.")
                # Move to A
                Score -= 1
                print("Moving to Location A...")
                # If A is Dirty
                if Environment.locationCondition['A'] == 1:
                    print("Location A is Dirty.")
                    # Suck and mark clean
                    Environment.locationCondition['A'] = 0
                    Score += 1
                    print("Location A has been Cleaned.")
            else:
                # Move to A
                print("Moving to Location A...")
                Score -= 1
                # If A is Dirty
                if Environment.locationCondition['A'] == 1:
                    print("Location A is Dirty.")
                    # Suck and mark clean
                    Environment.locationCondition['A'] = 0
                    Score += 1
                    print("Location A has been Cleaned.")
        # Done cleaning
        print(Environment.locationCondition)
        print("Performance Measurement: " + str(Score))

theEnvironment = Environment()
theVacuum = SimpleReflexVacuumAgent(theEnvironment)
