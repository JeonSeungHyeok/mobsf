import subprocess
from colors import *
import platform
import time
import os

class emulator:
    def __init__(self,name, path) -> None:
        self.name = name
        self.path = path

    def start_emulator(self):
        print(f"{GREEN}[*]{RESET} Starting the Emulator {self.name}")
        if platform.system() == 'Windows':
            subprocess.run(f'start cmd /k emulator -avd {self.name} -writable-system -no-snapshot', shell=True)
        elif platform.system() == 'Darwin':
            subprocess.run(["osascript", "-e", f"tell application \"Terminal\" to do script \"cd {self.path} && ./emulator -avd {self.name} -writable-system -no-snapshot\""])

    def stop_emulator(self):
        print(f"{RED}[*]{RESET} Stopping the Emulator {self.name}")
        if platform.system() == 'Windows':
            subprocess.run(["taskkill", "/F", "/IM", "emulator.exe"], shell=True)
        elif platform.system() == 'Darwin':
            subprocess.run(["pkill", "-f", "emulator"])
    
    def emulator_ready_verify(self):
        try:        
            boot_completed = subprocess.check_output(
                ["adb", "shell", "getprop", "sys.boot_completed"]
            ).decode().strip()
            if boot_completed == "1":
                return True
        except subprocess.CalledProcessError as e:
            pass
        return False
    
    def emulator_ready(self):
        print(f"{GREEN}[*]{RESET}Waiting for emulator to be ready...")
        while not self.emulator_ready_verify():
            time.sleep(10)
        print(f"{BLUE}[+]{RESET}Emulator is ready!")
        time.sleep(10)