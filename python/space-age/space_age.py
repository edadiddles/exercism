class SpaceAge:
    years = 0

    def __init__(self, seconds):
        self.years = seconds/31557600

    def on_earth(self):
        return round(100*self.years)/100

    def on_mercury(self):
        return round(100*self.years/0.2408467)/100

    def on_venus(self):
        return round(100*self.years/0.61519726)/100

    def on_mars(self):
        return round(100*self.years/1.8808158)/100

    def on_jupiter(self):
        return round(100*self.years/11.862615)/100

    def on_saturn(self):
        return round(100*self.years/29.447498)/100

    def on_uranus(self):
        return round(100*self.years/84.016846)/100

    def on_neptune(self):
        return round(100*self.years/164.79132)/100
