#
# Title: Shutdown Script
#
# Description: This script provides a simple mechanism to shut down a system
#     after a specified period of time.
#     It consists of two threads:
#     one to execute the shutdown and the other to act as a watcher,
#     providing time-related sound.
#
# Author: Yossef
#
# Email: yossef1@mail.com
#
# ------------------------------------------------------------------------------

import time
import os
import threading


time_to_shutdown = int(input("Enter time in minutes: ")) * 60


# Function to handle shutdown
def excute_shutdown():
    """
    This function handles the system shutdown process.
    It takes the specified time in minutes and executes a poweroff command after the given time.
    """

    shutdown_time = time.time() + time_to_shutdown
    print("Shutdown at", time.strftime("%H:%M:%S", time.localtime(shutdown_time)))
    time.sleep(time_to_shutdown)
    os.system("doas poweroff")


# Function to act as a watcher, providing time-related sound notifications
def watcher():
    """
    This function continuously running until the uptime (running) is equal to hint time
    hint time is the whole time - 3/4 time
    once this condition is met is the sound will be triggerd through mpg123
    """
    running = 0
    hint_time = int((time_to_shutdown / 60) - time_to_shutdown / 60 / 4)
    # add desire sound notification & make sure you have mpg123
    sound = "warning-notification-call-184996.mp3"

    while True:
        if running == hint_time:
            # mpg is a terminal audio runner or atleast thats how i could describe it
            os.system("mpg123 " + sound)
            print("Remaining Time", running / 3)
            del running

        try:
            time.sleep(60)
            running += 1
        except UnboundLocalError:
            break


# Main function to start the threads
def main():
    """
    This function initializes and starts the two threads for shutdown execution and time monitoring.
    """
    thread_one = threading.Thread(target=excute_shutdown)
    thread_two = threading.Thread(target=watcher)

    thread_one.start()
    thread_two.start()


if __name__ == "__main__":
    main()
