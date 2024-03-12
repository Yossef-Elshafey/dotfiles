import time
import os

time_to_shutdown = int(input("time in minutes: "))
time.sleep(time_to_shutdown * 60)
os.system("doas poweroff")
