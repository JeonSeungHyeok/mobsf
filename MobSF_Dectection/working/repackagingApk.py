import os
import shutil
from zipfile import ZipFile
import glob
import platform
from Cryptodome.Cipher import AES
from Cryptodome.Util.Padding import unpad
from colors import *
import subprocess

class Packaging:
    def __init__(self, key, file_name) -> None:
        self.key = key
        self.output_apk = file_name

    def find_sdk_directory(self) -> str:
        print(f'{GREEN}[*]{RESET} Finding Android SDK Directory')
        for root, dirs, files in os.walk('/Users'):
            if 'Android' in root.split(os.sep) and any(dir.lower() == 'sdk' for dir in dirs):
                sdk_dir = os.path.join(root, next(dir for dir in dirs if dir.lower() == 'sdk'))
                build_tools_path = os.path.join(sdk_dir, 'build-tools')
                if os.path.exists(build_tools_path):
                    sub_dirs = os.listdir(build_tools_path)
                    if sub_dirs:
                        print(f'{BLUE}[+]{RESET} Successfully find the Android SDK Directory')
                        return os.path.join(build_tools_path, sub_dirs[0])
        print(f"{RED}[-]{RESET} Couldn't find Android SDK Directory")
        return None

    def make_folder(self, name: str) -> str:
        path = os.path.join(os.getcwd(), name)
        if not os.path.exists(path):
            print(f'{GREEN}[*]{RESET} Creating directory: {path}')
            os.mkdir(path)
        else:
            print(f'{YELLOW}[!]{RESET} Directory already exists: {path}')
        return path

    def delete_folder(self, root_path: str):
        print(f'{BLUE}[+]{RESET} Delete {root_path}')
        shutil.rmtree(root_path)

    def copy_file(self, source: str, destination: str):
        try:
            shutil.copy2(source, destination)
            print(f'{BLUE}[+]{RESET} Successfully copied from {source} to {destination}')
        except FileNotFoundError:
            print(f'{RED}[-]{RESET} No such file or directory {source}')

    def change_extension(self, original_path: str, from_ext: str, to_ext: str):
        for file in glob.glob(f'{original_path}/*{from_ext}'):
            if not os.path.isdir(file):
                print(f'{GREEN}[*]{RESET} Changing extension of {file} to {to_ext}')
                new_name = f'{os.path.splitext(file)[0]}{to_ext}'
                os.rename(file, new_name)

    def list_zip_files(self, original_path: str):
        return [file for file in os.listdir(original_path) if file.endswith('.zip')]

    def extract_dex(self, original_path: str, dex_path: str):
        print(f'{GREEN}[*]{RESET} Extracting dex file')
        for zip_file in self.list_zip_files(original_path):
            with ZipFile(os.path.join(original_path, zip_file), 'r') as zip_obj:
                for file_name in zip_obj.namelist():
                    if file_name.endswith('.dex'):
                        zip_obj.extract(file_name, dex_path)

    def aes_128_ecb_decode(self, file_name: str, file_data: bytes):
        cipher = AES.new(self.key, AES.MODE_ECB)
        try:
            decrypted_data = unpad(cipher.decrypt(file_data), AES.block_size)
            with open(os.path.join(os.getcwd(), file_name), 'wb') as file:
                file.write(decrypted_data)
            print(f'{BLUE}[+]{RESET} Decode complete: {file_name}')
        except ValueError:
            print(f'{RED}[-]{RESET} Decryption or padding error: {file_name}')

    def file_signature(self, path: str):
        decompiled_files = []
        print(f'{GREEN}[*]{RESET} Checking file signatures')
        for file_name in os.listdir(path):
            with open(os.path.join(path, file_name), 'rb') as file:
                file_header = file.read(3)
                file.seek(0)
                file_data = file.read()
                if file_header == b'dex':
                    print(f'{BLUE}[*]{RESET} {file_name} is a .dex file')
                else:
                    print(f'{RED}[*]{RESET} {file_name} is not a .dex file')
                    decompiled_files.append(file_name)
                    self.aes_128_ecb_decode(file_name, file_data)
        return decompiled_files

    def decompile_apk(self, apk_path: str, output_dir: str):
        print(f'{GREEN}[*]{RESET} Decompiling APK: {apk_path}')
        if platform.system() == 'Windows':
            subprocess.run(['cmd', '/c', 'echo.', '|', 'apktool.bat', 'd', apk_path, '-o', output_dir], shell=True)
        else:
            subprocess.run(['apktool', 'd', apk_path, '-o', output_dir])

    def recompile_apk(self, repackaging_path: str, apk_name: str):
        print(f'{GREEN}[*]{RESET} Recompiling APK: {apk_name}')
        if platform.system() == 'Windows':
            subprocess.run(['cmd', '/c', 'echo.', '|', 'apktool.bat', 'b', repackaging_path, '-o', f'repackaged_{apk_name}'], shell=True)
        else:
            subprocess.run(['apktool', 'b', repackaging_path, '-o', f'repackaged_{apk_name}'])

    def create_keystore(self, keystore: str, alias: str, storepass: str, keypass: str, dname: str):
        command = [
            'keytool', '-genkey', '-v', '-keystore', keystore,
            '-alias', alias, '-keyalg', 'RSA', '-keysize', '2048',
            '-validity', '10000', '-storepass', storepass, '-keypass', keypass, '-dname', dname
        ]
        print(f'{GREEN}[*]{RESET} Creating keystore: {keystore}')
        subprocess.run(command, check=True)

    def sign_apk(self, sdk_path: str, keystore: str, alias: str, storepass: str, keypass: str, input_apk: str, output_apk: str):
        apksigner = 'apksigner.bat' if platform.system() == 'Windows' else 'apksigner'
        command = [
            os.path.join(sdk_path, apksigner), 'sign', '--ks', keystore,
            '--ks-key-alias', alias, '--ks-pass', f'pass:{storepass}',
            '--key-pass', f'pass:{keypass}', '--out', output_apk, input_apk
        ]
        print(f'{GREEN}[*]{RESET} Signing APK: {input_apk}')
        subprocess.run(command, check=True)

    def verify_apk(self, sdk_path: str, apk_path: str):
        apksigner = 'apksigner.bat' if platform.system() == 'Windows' else 'apksigner'
        command = [os.path.join(sdk_path, apksigner), 'verify', apk_path]
        result = subprocess.run(command, capture_output=True, text=True)
        if result.returncode == 0:
            print(f'{BLUE}[+]{RESET} APK is valid: {apk_path}')
        else:
            print(f'{RED}[-]{RESET} APK  is not valid: {apk_path}')

    def delete_smali_and_copy_dex(self, repackaging_path: str, decompiled_files: list, dex_file: str):
        for file in decompiled_files:
            smali_path = os.path.join(repackaging_path, f"smali_{file.split('.')[0]}")
            if os.path.exists(smali_path):
                print(f'{GREEN}[*]{RESET} Deleting smali directory: {smali_path}')
                self.delete_folder(smali_path)
            else:
                print(f'{RED}[-]{RESET} Not exist smali directory: {smali_path}')
            self.copy_file(os.path.join(repackaging_path, '..', dex_file, file), repackaging_path + '/')

    def notice_apk_path(self, current_path: str):
        for apk in glob.glob(f'{current_path}/repackaged_*.apk'):
            print(f'{GREEN}[*]{RESET} Your APK => {YELLOW}{os.path.join(current_path, apk)}{RESET}')

    def get_apks(self, current_path: str):
        apks = []
        for apk in glob.glob(f'{current_path}/*.apk'):
            apks.append(os.path.join(current_path, apk))
        return apks

    def process(self, path: str):
        current_path = os.getcwd()
        apk_path = os.path.relpath(path, current_path)

        sdk_path = self.find_sdk_directory()
        tmp_folder_path = self.make_folder('tmp')

        os.chdir(tmp_folder_path)
        self.create_keystore(
            keystore='release-key.jks',
            alias='key-alias',
            storepass='password',
            keypass='password',
            dname='CN=., OU=., O=., ST=., C=.'
        )

        original_path = self.make_folder('original')
        repackaging_path = os.path.join(tmp_folder_path, 'repackaging')

        self.copy_file(path, original_path)
        self.change_extension(original_path, '.apk', '.zip')

        dex_path = os.path.join(tmp_folder_path, 'dex_files')
        self.extract_dex(original_path, 'dex_files')
        self.change_extension(original_path, '.zip', '.apk')

        os.chdir(dex_path)
        decompiled_files = self.file_signature(dex_path)

        os.chdir(tmp_folder_path)
        self.decompile_apk(os.path.join('original', os.path.basename(apk_path)), 'repackaging')

        originalAssetsPath = self.make_folder(os.path.join('original', 'assets'))
        repackAssetsPath = os.path.join(repackaging_path, 'assets')
        self.copy_file(os.path.join(repackAssetsPath, 'pgsHZz.apk'), originalAssetsPath)

        repackaging_path2 = os.path.join(tmp_folder_path, 'repackaging2')
        self.change_extension(originalAssetsPath, '.apk', '.zip')

        assetsdex_path = os.path.join(tmp_folder_path, 'assets_dex_files')
        self.extract_dex(originalAssetsPath, 'assets_dex_files')
        self.change_extension(originalAssetsPath, '.zip', '.apk')

        os.chdir(assetsdex_path)
        decompiled_files2 = self.file_signature(assetsdex_path)

        os.chdir(tmp_folder_path)
        self.decompile_apk(os.path.join(originalAssetsPath, 'pgsHZz.apk'),'repackaging2')

        os.chdir(repackaging_path2)
        self.delete_smali_and_copy_dex(repackaging_path2,decompiled_files2, 'assets_dex_files')

        os.chdir(repackAssetsPath)
        self.recompile_apk(repackaging_path2, 'pgsHZz.apk')
        os.remove(os.path.join(repackAssetsPath, 'pgsHZz.apk'))

        self.copy_file(os.path.join(repackAssetsPath, 'repackaged_pgsHZz.apk'), tmp_folder_path)
        os.chdir(tmp_folder_path)
        self.sign_apk(
            sdk_path=sdk_path,
            keystore='release-key.jks',
            alias='key-alias',
            storepass='password',
            keypass='password',
            input_apk='repackaged_pgsHZz.apk',
            output_apk='repackaged_pgsHZz.apk'
        )
        self.verify_apk(sdk_path=sdk_path,apk_path='repackaged_pgsHZz.apk')
        self.copy_file(os.path.join(tmp_folder_path, 'repackaged_pgsHZz.apk'), repackAssetsPath)

        os.chdir(repackaging_path)
        self.delete_smali_and_copy_dex(repackaging_path, decompiled_files, 'dex_files')

        os.chdir(tmp_folder_path)
        self.recompile_apk('repackaging', self.output_apk)

        self.sign_apk(
            sdk_path=sdk_path,
            keystore='release-key.jks',
            alias='key-alias',
            storepass='password',
            keypass='password',
            input_apk='repackaged_'+self.output_apk,
            output_apk='repackaged_'+self.output_apk
        )

        self.verify_apk(sdk_path=sdk_path,apk_path='repackaged_'+self.output_apk)
        self.copy_file(os.path.join(tmp_folder_path, 'repackaged_'+self.output_apk),os.path.join(current_path, '..'))
        self.copy_file(os.path.join(repackAssetsPath, 'repackaged_pgsHZz.apk'), os.path.join(current_path, '..'))
        os.chdir(current_path)
        self.delete_folder(tmp_folder_path)
        self.notice_apk_path(os.path.join(current_path, '..'))
        return self.get_apks(os.path.join(current_path, '..'))