from startMobSF import *
from uploadAPK import *
from repackagingApk import *
from key import *
import os

GREEN = '\033[92m'
RED = '\033[91m'
BLUE = '\033[94m'
YELLOW = '\033[93m'
RESET = '\033[0m'

def main():
    apkPath = input(f'{BLUE}[*]{RESET} {YELLOW}Please enter the path of apk to analyze{RESET} : ')
    currnetPath = os.getcwd()
    
    # mobsf execute
    mobsf = Starting()
    mobsf.start_mobsf()
    
    # mobsf apikey
    apiKey = key()

    pack = packaging(key=b'dbcdcfghijklmaop', fileName=os.path.basename(apkPath))
    pack.process(path=apkPath)
    
    static = StaticAnalysis('http://127.0.0.1:8000',currnetPath,apiKey.api_key(), fileName=os.path.basename(apkPath))
    static.staticAnalysis()

    mobsf.kill_mobsf()

if __name__=="__main__":
    main()