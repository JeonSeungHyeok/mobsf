import subprocess
import os
import platform
import time
import psutil

GREEN = '\033[92m'
RED = '\033[91m'
BLUE = '\033[94m'
YELLOW = '\033[93m'
RESET = '\033[0m'

class Starting:
    def __init__(self) -> None:
        self.process = None

    def start_mobsf(self):
        print(f"{GREEN}[*]{RESET} Finding MobSF dir path")
        mobsfDirPath=''
        runScript = ''
        for root, dirs, files in os.walk('/Users'):
            if 'Mobile-Security-Framework-MobSF-master' in dirs:
                mobsfDirPath = os.path.join(root,'Mobile-Security-Framework-MobSF-master') + '/'
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



