use std::fmt;

pub struct Clock {
    hours: i32,
    minutes: i32,
}

impl Clock {
    pub fn new(hours: i32, minutes: i32) -> Self {
        let mut clock = Clock { hours: 0, minutes: 0 };
        let h = ((hours%24) + 24) % 24;
        clock = clock.add_minutes(h*60);
        clock = clock.add_minutes(minutes);

        clock
    }

    pub fn add_minutes(&self, minutes: i32) -> Self {
        let m = self.minutes + minutes;
        let mut k = 0;
        if m < 0 && m != -60 {
            k = -1;
        }
        let h = self.hours + m/60 + k;

        Self { hours: ((h%24) + 24) % 24, minutes: ((m%60) + 60) % 60, }
    }
}

impl fmt::Display for Clock {
    fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
        write!(f, "{:02}:{:02}", self.hours, self.minutes)
    }
}

impl fmt::Debug for Clock {
    fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
        f.debug_struct("Clock")
            .field("hours", &self.hours)
            .field("minutes", &self.minutes)
            .finish()
    }
}

impl PartialEq for Clock {
    fn eq(&self, other: &Self) -> bool {
        self.hours == other.hours && self.minutes == other.minutes
    }
}
