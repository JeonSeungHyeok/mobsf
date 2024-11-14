from startMobSF import *
from mobSFRestAPI import *
from repackagingApk import *
from key import *
from colors import *
from emulator import *
import os
import config

def main():
    
    
    apkPath = config.APK_PATH
    currnetPath = os.getcwd()
    
    # mobsf execute
    mobsf = Starting(config.MOBSF_NAME)
    mobsf.start_mobsf()
    
    # mobsf apikey
    apiKey = key(config.USER_HOME)

    pack = packaging(config.AES_KEY, os.path.basename(apkPath))
    pack.process(path=apkPath)
    
    emulate = emulator(config.EMULATOR_NAME, config.EMULATOR_PATH)
    emulate.start_emulator()
    emulate.emulator_ready()

    static = Analysis(config.SERVER,currnetPath, os.path.basename(apkPath), apiKey.api_key(), config.DEVICE)
    static.Analysis()
    
    mobsf.kill_mobsf()
    emulate.stop_emulator()

if __name__=="__main__":
    main()