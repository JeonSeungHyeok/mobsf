from startMobSF import *
from mobSFRestAPI import *
from repackagingApk import *
from key import *
from colors import *
from emulator import *
import os
import config

def main():
    emulate = emulator(config.EMULATOR_NAME, config.EMULATOR_PATH)
    emulate.start_emulator()
    
    # mobsf execute
    mobsf = Starting(config.MOBSF_NAME)
    mobsf.start_mobsf()
    
    # mobsf apikey
    apiKey = key(config.USER_HOME)

    pack = Packaging(config.AES_KEY, os.path.basename(config.APK_PATH))
    apks = pack.process(config.APK_PATH)
    
    a= os.path.join(os.getcwd(), '..')
    apks = []
    for apk in glob.glob(f'{a}/*.apk'):
        apks.append(os.path.join(a, apk))
    emulate.emulator_ready()
    
    
    static = Analysis(config.SERVER, os.path.join(os.getcwd(), '..'), apks, apiKey.api_key(), config.DEVICE, config.FRIDA_PATH)
    static.Analysis()
    
    mobsf.kill_mobsf()
    emulate.stop_emulator()

if __name__=="__main__":
    main()