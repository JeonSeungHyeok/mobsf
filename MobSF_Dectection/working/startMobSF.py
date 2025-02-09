import subprocess
import os
import platform
import psutil
from colors import *

class Starting:
    def __init__(self, mobsf_name) -> None:
        self.process = None
        self.mobsf_name = mobsf_name

    def start_mobsf(self):
        print(f'{GREEN}[*]{RESET} Finding MobSF dir path')
        mobsf_dir_path = os.path.join(os.getcwd(), self.mobsf_name)
        run_script = ''    
        if platform.system() == 'Windows':
            run_script = 'run.bat'
        elif platform.system() == 'Darwin':
            run_script = 'run.sh'
        if not os.path.exists(os.path.join(mobsf_dir_path, run_script)):
            print(f'{RED}[-]{RESET} Error: The {run_script} is not in this path {mobsf_dir_path}')
            return
        self.process = subprocess.Popen(os.path.join(mobsf_dir_path, run_script), shell=True, cwd=mobsf_dir_path)
        print(f'{BLUE}[+]{RESET} MobSF Started Successfully')        
        return self.process

    def kill_mobsf(self):
        print(f'{RED}[*]{RESET} Terminating MobSF')
        if self.process and self.process.poll() is None:
            parent = psutil.Process(self.process.pid)
            for child in parent.children(recursive=True):
                child.terminate()
            self.process.terminate()
            self.process.wait()
        print(f'{RED}[*]{RESET} Byebye~')



