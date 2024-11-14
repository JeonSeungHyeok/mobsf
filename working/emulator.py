import subprocess
from colors import *
import platform
import time

class emulator:
    def __init__(self,name, path) -> None:
        self.name = name
        self.path = path

    def start_emulator(self):
        print(f"{BLUE}[*]{RESET} Starting the Emulator {self.name}")
        if platform.system() == 'Windows':
            command = f'start cmd /k {self.path} -avd {self.name} -writable-system -no-snapshot'
            subprocess.run(command,shell=True)
        elif platform.system() == 'Darwin':
            command = f"tell application \"Terminal\" to do script \"cd {self.path} && ./emulator -avd {self.name} -writable-system -no-snapshot\""
            subprocess.run(["osascript", "-e", command])

    def stop_emulator(self):
        print(f"{RED}[*]{RESET} Stopping the Emulator {self.name}")
        if platform.system() == 'Windows':
            subprocess.run(["taskkill", "/F", "/IM", "emulator.exe"], shell=True)
        elif platform.system() == 'Darwin':
            subprocess.run(["pkill", "-f", "emulator"])
    
    def emulator_ready_verify(self):
        try:
            devices = subprocess.check_output(["adb", "devices"]).decode().strip()
            
            if "emulator-5554" in devices and "device" in devices:
                boot_completed = subprocess.check_output(
                    ["adb", "shell", "getprop", "sys.boot_completed"]
                ).decode().strip()
                if boot_completed == "1":
                    return True
        except subprocess.CalledProcessError:
            pass
        return False
    
    def emulator_ready(self):
        print(f"{GREEN}[*]{RESET}Waiting for emulator to be ready...")
        while not self.emulator_ready_verify():
            time.sleep(10)
        print(f"{BLUE}[*]{RESET}Emulator is ready!")