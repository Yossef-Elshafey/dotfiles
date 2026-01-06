#!/usr/bin/env python3
from datetime import timedelta, timezone, datetime
from time import sleep
from suntime import Sun
import sys


class ArabicClock:
    def __init__(self, lat, long) -> None:
        self.sun = Sun(lat, long)
        self.hour_debug = 20
        self.minute_debug = 2

    @property
    def system_utc(self) -> timezone:
        local_time = datetime.now().astimezone()
        utc_offset = local_time.utcoffset()

        if utc_offset is None:
            raise ValueError("System time is not timezone-aware")

        local_timezone = timezone(utc_offset)

        return local_timezone

    @property
    def sunset(self) -> datetime:
        ss = self.sun.get_sunset_time(time_zone=self.system_utc)
        return ss

    @property
    def sunrise(self) -> datetime:
        sr = self.sun.get_sunrise_time(time_zone=self.system_utc)
        return sr

    def time_until_next_status(self, t: datetime) -> timedelta:
        now = datetime.now(self.system_utc)
        # now = datetime(
        #     datetime.now().year,
        #     datetime.now().month,
        #     datetime.now().day,
        #     self.hour_debug,
        #     self.minute_debug,
        #     0,
        #     tzinfo=self.system_utc,
        # )
        t = t.astimezone(self.system_utc)
        next_event = now.replace(
            hour=t.hour,
            minute=t.minute,
            second=t.second,
            microsecond=t.microsecond,
        )
        if next_event < now:
            next_event += timedelta(days=1)
        return next_event - now

    def time_until_last_status(self, t: datetime) -> datetime:
        now = datetime.now(self.system_utc)
        # now = datetime(
        #     datetime.now().year,
        #     datetime.now().month,
        #     datetime.now().day,
        #     self.hour_debug,
        #     self.minute_debug,
        #     0,
        #     tzinfo=self.system_utc,
        # )
        event_time = t.astimezone(self.system_utc)
        last_event = now.replace(
            hour=event_time.hour,
            minute=event_time.minute,
            second=event_time.second,
            microsecond=event_time.microsecond,
        )
        if last_event > now:
            last_event -= timedelta(days=1)
        return last_event

    def format(self, t: timedelta):
        total_seconds = int(t.total_seconds())
        hours = total_seconds // 3600
        minutes = (total_seconds % 3600) // 60
        return f"{hours:02}:{minutes:02}"

    def clock(self):
        now = datetime.now(self.system_utc)

        # now = datetime(
        #     datetime.now().year,
        #     datetime.now().month,
        #     datetime.now().day,
        #     self.hour_debug,
        #     self.minute_debug,
        #     0,
        #     tzinfo=self.system_utc,
        # )
        until_sunset = self.time_until_next_status(self.sunset).total_seconds()
        until_sunrise = self.time_until_next_status(self.sunrise).total_seconds()

        if until_sunrise > until_sunset:
            print("sunset is coming next")
            last_status = self.time_until_last_status(self.sunrise)
        else:
            print("sunrise is coming next")
            last_status = self.time_until_last_status(self.sunset)

        return self.format(now - last_status)


if __name__ == "__main__":
    ac = ArabicClock(31.037933, 31.381523)
    delta = ac.clock()
    while True:
        print(delta)
        sleep(30)
