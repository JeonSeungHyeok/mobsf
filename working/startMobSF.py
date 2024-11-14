import subprocess
import os
import platform
import psutil
from colors import *


class Starting:
    def __init__(self, mobsfName) -> None:
        self.process = None
        self.mobsfName = mobsfName

    def start_mobsf(self):
        print(f"{GREEN}[*]{RESET} Finding MobSF dir path")
        mobsfDirPath=''
        runScript = ''
        for root, dirs, files in os.walk('/Users'):
            if self.mobsfName in dirs:
                mobsfDirPath = os.path.join(root, self.mobsfName) + '/'
                break        
        if platform.system()=='Windows':
            runScript='run.bat'
        elif platform.system()=='Darwin':
            runScript='run.sh'
        if not os.path.exists(mobsfDirPath+runScript):
            print(f"{RED}[-]{RESET} Error: The {runScript} is not in this path {mobsfDirPath}")
            return
        self.process = subprocess.Popen(mobsfDirPath+runScript, shell=True, cwd=mobsfDirPath)
        print(f'{BLUE}[+]{RESET} MobSF Started Successfully')        
        return self.process

    def kill_mobsf(self):
        print(f'{GREEN}[*]{RESET} Terminating MobSF')
        if self.process and self.process.poll() is None:
            parent = psutil.Process(self.process.pid)
            for child in parent.children(recursive=True):
                child.terminate()
            self.process.terminate()
            self.process.wait()
        print(f"{GREEN}[*]{RESET} Byebye~")



