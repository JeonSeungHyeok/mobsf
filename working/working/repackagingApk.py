import os
import shutil
import io
import zipfile
from zipfile import ZipFile
import glob
import base64
from Cryptodome.Cipher import AES
from Cryptodome.Util.Padding import unpad
import subprocess

GREEN = '\033[92m'
RED = '\033[91m'
BLUE = '\033[94m'
YELLOW = '\033[93m'
RESET = '\033[0m'

class packaging:
    def __init__(self, key, fileName) -> None:
        self.key = key
        self.outputApk = "new_"+fileName

    def find_sdk_directory(self) -> str:
        print(f"{BLUE}[*]{RESET} Finding Android dir path")
        for root, dirs, files in os.walk('/Users'):
            if 'Android' in root.split(os.sep) and any(dir.lower() == 'sdk' for dir in dirs) and 'build-tools' in os.listdir(os.path.join(root, next(dir for dir in dirs if dir.lower() == 'sdk'))):
                buildToolsPath = os.path.join(root, 'sdk', 'build-tools')
                subDirs = os.listdir(buildToolsPath)
                if subDirs:
                    print(f"{GREEN}[+]{RESET} Successfully find the Android Path")
                    return os.path.join(buildToolsPath,subDirs[0])
        print(f"{RED}[-]{RESET} Couldn't find Android path")
        return None

    def make_folder(self, name:str) -> str:
        currentPath=os.getcwd()
        path = os.path.join(currentPath, name)
        print(f"{BLUE}[*]{RESET} Directory Path : {path}")
        if not os.path.exists(path):
            os.mkdir(path)
        return path

    def delete_folder(self, rootPath:str):
        print(f"{BLUE}[*]{RESET} Delete {rootPath}")
        shutil.rmtree(rootPath)

    def copy_file(self, Path:str, currentPath:str):
        try:
            shutil.copy2(Path,currentPath)
            print(f"{GREEN}[+]{RESET} Successfully copied from {Path} to {currentPath}")
        except:
            print(f"{GREEN}[-]{RESET} No such file or directory")

    def change_extension_to_zip(self, original:str):
        apk = glob.glob(original+'/*.apk')
        for x in apk:
            if not os.path.isdir(x):
                print(f"{BLUE}[*]{RESET} Changing extension of {x} to zip")
                fileName = os.path.splitext(x)
                os.rename(x,fileName[0]+'.zip')

    def change_extension_to_apk(self, original:str):
        apk = glob.glob(original+'/*.zip')
        for x in apk:
            if not os.path.isdir(x):
                print(f"{BLUE}[*]{RESET} Changing extension of {x} to apk")
                fileName = os.path.splitext(x)
                os.rename(x,fileName[0]+'.apk')

    def list_zip_files(self, original:str):
        currentPath = original
        return [file for file in os.listdir(currentPath) if file.endswith('.zip')]

    def extract_dex(self, original:str):
        files = self.list_zip_files(original)
        print(f"{BLUE}[*]{RESET} Extracting dex file")
        for file in files:
            with ZipFile(original+'/'+file,'r') as zipObj:
                listOfFileNames = zipObj.namelist()
                for fileName in listOfFileNames:
                    if fileName.endswith('dex'):
                        zipObj.extract(fileName,'dex_files')

    def aes_128_ecb_decode(self, fileName:str, file_data):
        path = os.getcwd()
        cipher = AES.new(self.key, AES.MODE_ECB)
        decryptedData = cipher.decrypt(file_data)
        try:
            unpaddedData = unpad(decryptedData,AES.block_size)
            print(f"{GREEN}[+]{RESET} Decode Complete")
        except ValueError:
            print(f"{RED}[-]{RESET} Incorrect decryption or padding error")
            return
        with open(path+'/'+fileName,'wb') as file:
            file.write(unpaddedData)
    
    def file_signature(self, path:str):
        files = [file for file in os.listdir(path)]
        decompiledFiles = []
        print(f"{BLUE}[*]{RESET} Checking magic of files")
        for file in files:
            with open(path+file,'rb') as f:
                file_header = f.read(3)
                f.seek(0)
                file_data = f.read()
                if file_header==b"dex":
                    print(f"{BLUE}[*]{RESET} {file} is .dex")
                else:
                    print(f"{BLUE}[*]{RESET} {file} is not .dex")
                    decompiledFiles.append(file)
                    self.aes_128_ecb_decode(file, file_data)
        return decompiledFiles
    
    def decompile_apk(self, apkPath, outputDir):
        print(f"{BLUE}[*]{RESET} Depackaging the apk")
        subprocess.run(['apktool.bat','d', apkPath,'-o',outputDir]) #
    
    def recompile_apk(self, repackaging):
        print(f"{BLUE}[*]{RESET} Repackaging the apk to repackaged_app.apk")
        subprocess.run(['apktool.bat','b',repackaging,'-o','repackaged_app.apk'])

    def create_keystore(self,keystore,alias,storepass,keypass,dname):
        if os.path.isfile(keystore):
            print(f"{YELLOW}[!]{RESET} Keystore '{keystore}' already exists. Skipping creation.")
            return
        command = [
            'keytool', '-genkey', '-v', '-keystore', keystore,
            '-alias', alias, '-keyalg', 'RSA', '-keysize', '2048',
            '-validity', '10000', '-storepass', storepass, 
            '-keypass', keypass, '-dname', dname
        ]
        print(f"{BLUE}[*]{RESET} Creating the keystore")
        subprocess.run(command,check=True)

    def sign_apk(self,sdkPath,keystore,alias,storepass,keypass,input_apk,outputApk):
        command = [
            sdkPath+'apksigner.bat','sign','--ks',keystore,'--ks-key-alias',alias,'--ks-pass',
            f'pass:{storepass}','--key-pass',f'pass:{keypass}','--out','./'+outputApk,input_apk
        ]
        print(f"{BLUE}[*]{RESET} Signing the apk")
        subprocess.run(command,check=True)

    def verify_apk(self,sdkPath,apkPath):
        command = [sdkPath+'apksigner.bat','verify',apkPath]
        result = subprocess.run(command,capture_output=True,text=True)
        if result.returncode==0:
            print(f"{GREEN}[+]{RESET} APK {apkPath} is valid")
        else:
            print(f"{RED}[-]{RESET} APK {apkPath} error occured")

    def delete_smali_and_copy_dex(self,repackaging, decompiledFiles):
        for file in decompiledFiles:
            print(f"{BLUE}[*]{RESET} Deleting the smali_{file.split('.')[0]}")
            if os.path.exists(repackaging+'/'+'smali_'+file.split('.')[0]):
                self.delete_folder(repackaging+'/'+'smali_'+file.split('.')[0])
            self.copy_file(repackaging+'/../dex_files/'+file,repackaging+'/')
    
    def notice_apk_path(self, currentPath:str):
        print(f"{BLUE}[*]{RESET} Your apk => {YELLOW}{currentPath+'/'+self.outputApk}{RESET}")

    def absolute_to_relative(self,absPath):
        currentDir = os.getcwd() # C:\Users\jsh1\Downloads\working
        return os.path.relpath(absPath,currentDir)

    def process(self,path): # C:\Users\jsh1\downloads\pgsHZz\pgsHZz.apk
        currentPath = os.getcwd()
        apkPath = self.absolute_to_relative(path) # ..\pgsHZz\pgsHZz.apk

        sdkPath = self.find_sdk_directory()+'/' # /Users\jsh1\AppData\Local\Android\sdk\build-tools\34.0.0/
        dexPath = currentPath+'/tmp/dex_files/' # C:\Users\jsh1\Downloads\working/tmp/dex_files/
        tmpFolder = self.make_folder('tmp')
        
        os.chdir(tmpFolder) # C:\Users\jsh1\Downloads\working/tmp
        original = self.make_folder('original')
        repackaging = currentPath+'/tmp/repackaging'
        
        print(f'apkPath : {apkPath}')
        print(f'current : {os.getcwd()+"/original/"}' )
        self.copy_file(path, tmpFolder+'/original/') #
        
        self.change_extension_to_zip(original)
        self.extract_dex(original)
        self.change_extension_to_apk(original)
        os.chdir(dexPath)
        decompiledFiles = self.file_signature(dexPath)
        os.chdir(tmpFolder)
        apkPath1="original\\" + os.path.basename(apkPath)
        self.decompile_apk(apkPath1,"./repackaging") #
        os.chdir(repackaging)
        self.delete_smali_and_copy_dex(repackaging,decompiledFiles)
        os.chdir(tmpFolder)
        self.recompile_apk("./repackaging")
        self.create_keystore(
            keystore='release-key.jks',
            alias='key-alias',
            storepass='password',
            keypass='password',
            dname="CN=., OU=., O=., ST=., C=."
        )
        self.sign_apk(
            sdkPath=sdkPath,
            keystore='release-key.jks',
            alias='key-alias',
            storepass='password',
            keypass='password',
            input_apk='repackaged_app.apk',
            outputApk=self.outputApk
        )
        self.verify_apk(sdkPath=sdkPath,apkPath=self.outputApk)
        self.copy_file(tmpFolder+'/'+self.outputApk,tmpFolder+'/../')
        #self.delete_folder(tmpFolder)
        self.notice_apk_path(currentPath)
