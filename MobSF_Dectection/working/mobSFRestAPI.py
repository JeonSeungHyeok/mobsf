import requests
import os
import json
from datetime import datetime
from requests_toolbelt import MultipartEncoder
from colors import *

class Analysis:
    def __init__(self, server, file_path, apks, api_key, device, frida_path) -> None:
        self.server = server
        self.path = file_path
        self.apks = apks
        self.api_key = api_key
        self.scan_hash = ''
        self.device = device
        self.frida_path = frida_path

    def upload_apk(self, file_path):
        print(f'{GREEN}[*]{RESET} Uploading APK: {YELLOW}{os.path.basename(file_path)}{RESET}')
        multipart_data = MultipartEncoder(
            fields = {'file': (file_path, open(file_path, 'rb'), 'application/octet-stream')}
        )
        headers = {
            'Content-Type': multipart_data.content_type,
            'Authorization': self.api_key
        }
        response = requests.post(f'{self.server}/api/v1/upload', data=multipart_data, headers=headers)
        result = response.json()
        if 'hash' in result:
            self.scan_hash = result['hash']
            print(f'{BLUE}[+]{RESET} Upload completed: {YELLOW}{os.path.basename(file_path)}{RESET}')
        else:
            print(f'{RED}[-]{RESET} Not upload completed')

    def scan_apk(self, file_path):
        print(f'{GREEN}[*]{RESET} Scanning Started: {YELLOW}{os.path.basename(file_path)}{RESET}')
        data = {
            'hash': self.scan_hash,
            'scan_type': file_path.split('.')[-1],
            'file_name': os.path.basename(file_path)
        }
        headers = {'Authorization': self.api_key}
        response = requests.post(f'{self.server}/api/v1/scan', data=data, headers=headers)
        if response.status_code == 200:
            print(f'{BLUE}[+]{RESET} Scanning completed')
        else:
            print(f'{RED}[-]{RESET} Not scanning completed')

    def static_json(self, file_path):
        print(f'{GREEN}[*]{RESET} Generating Static JSON: {YELLOW}{os.path.basename(file_path)}{RESET}')
        data = {'hash': self.scan_hash}
        headers = {'Authorization': self.api_key}
        response = requests.post(f'{self.server}/api/v1/report_json', data=data, headers=headers)
        date = datetime.now().strftime('%Y-%m-%d')
        with open(os.path.join(self.path, f'static_report-{os.path.basename(file_path)}-{date}.json'), 'w+') as file:
            json.dump(response.json(), file, indent=4)
        return response

    def download_pdf(self, file_path):
        print(f'{GREEN}[*]{RESET} Downloading the pdf: {file_path}')
        data = {'hash': self.scan_hash}
        headers = {'Authorization': self.api_key}
        response = requests.post(f'{self.server}/api/v1/download_pdf', data=data, headers=headers)
        date = datetime.now().strftime('%Y-%m-%d')
        with open(os.path.join(self.path, f'static_analysis_report-{os.path.basename(file_path)}-{date}.pdf'), 'wb') as file:
            file.write(response.content)
        print(f'{BLUE}[+]{RESET} Download complete')
        print(f'{BLUE}[+]{RESET} Result of static analyze is at {YELLOW}{os.path.join(self.path, f'static_analysis_report-{os.path.basename(file_path)}-{date}.pdf')}{RESET}')

    def delete(self):
        print(f'{RED}[*]{RESET} Deleting')
        data = {'hash': self.scan_hash}
        headers = {'Authorization': self.api_key}
        response = requests.post(f'{self.server}/api/v1/delete_scan', data=data, headers=headers)
        return response

    def get_apps(self):
        print(f'{GREEN}[*]{RESET} Connecting to Emulator')
        headers = {'Authorization': self.api_key}
        response = requests.get(f'{self.server}/api/v1/dynamic/get_apps', headers=headers)
        return response

    def start_dynamic_analysis(self):
        print(f'{GREEN}[*]{RESET} Starting Dynamic Analysis')
        data = {'hash': self.scan_hash}
        headers = {'Authorization': self.api_key}
        response = requests.post(f'{self.server}/api/v1/dynamic/start_analysis', data=data, headers=headers)
        return response

    def stop_dynamic_analysis(self):
        print(f'{RED}[*]{RESET} Stop Dynamic Analysis')
        data = {'hash': self.scan_hash}
        headers = {'Authorization': self.api_key}
        response = requests.post(f'{self.server}/api/v1/dynamic/stop_analysis', data=data, headers=headers)
        return response

    def dynamic_report_json(self):
        print(f'{GREEN}[*]{RESET} Making Dynamic json report')
        data = {'hash': self.scan_hash}
        headers = {'Authorization': self.api_key}
        response = requests.post(f'{self.server}/api/v1/dynamic/report_json', data=data, headers=headers)
        date = datetime.now().strftime('%Y-%m-%d')
        with open(os.path.join(self.path, f'dynamic_report-{date}.json'),'w+') as file:
            json.dump(response.json(), file, indent=4)
        return response

    def dynamic_act_tester(self, test):
        print(f'{GREEN}[*]{RESET} Dynamic Act Tester {test}')
        data = {'hash': self.scan_hash, 'test': test}
        headers = {'Authorization': self.api_key}
        response = requests.post(f'{self.server}/api/v1/android/activity', data=data, headers=headers)
        return response

    def dynamic_start_activity(self, activity):
        print(f'{BLUE}[*]{RESET} Dynamic Start Activiry')
        data = {'hash': self.scan_hash, 'activity': activity}
        headers = {'Authorization': self.api_key}
        response = requests.post(f'{self.server}/api/v1/android/start_activity', data=data, headers=headers)
        return response

    def dynamic_tls_test(self):
        print(f'{GREEN}[*]{RESET} Dynamic TLS Test')
        data = {'hash': self.scan_hash}
        headers = {'Authorization': self.api_key}
        response = requests.post(f'{self.server}/api/v1/android/tls_tests', data=data, headers=headers)
        return response

    def frida_instrument(self, default_hooks='', auxiliary_hooks='', frida_code='', class_name=None, class_search=None, class_trace=None):
        print(f'{GREEN}[*]{RESET} frida instrument')
        data = {
            'hash': self.scan_hash,
            'default_hooks': default_hooks,
            'auxiliary_hooks': auxiliary_hooks,
            'frida_code': frida_code
        }
        if class_name:
            data['class_name'] = class_name
        if class_search:
            data['class_search'] = class_search
        if class_trace:
            data['class_trace'] = class_trace
        headers = {'Authorization': self.api_key}
        response = requests.post(f'{self.server}/api/v1/frida/instrument', data=data, headers=headers)
        return response

    def frida_monitor(self):
        print(f'{GREEN}[*]{RESET} frida api monitor')
        data = {'hash': self.scan_hash}
        headers = {'Authorization': self.api_key}
        response = requests.post(f'{self.server}/api/v1/frida/api_monitor', data=data, headers=headers)
        return response

    def frida_get_dependencies(self):
        print(f'{GREEN}[*]{RESET} frida get dependencies')
        data = {'hash': self.scan_hash}
        headers = {'Authorization': self.api_key}
        response = requests.post(f'{self.server}/api/v1/frida/get_dependencies', data=data, headers=headers)
        return response

    def frida_logs(self):
        print(f'{GREEN}[*]{RESET} frida logs')
        data = {'hash': self.scan_hash}
        headers = {'Authorization': self.api_key}
        response = requests.post(f'{self.server}/api/v1/frida/logs', data=data, headers=headers)
        return response

    def frida_list_script(self):
        data = {'device': self.device}
        headers = {'Authorization': self.api_key}
        response = requests.post(f'{self.server}/api/v1/frida/list_script', data=data, headers=headers)
        return response

    def frida_get_script(self, scripts):
        data = {'scripts[]': scripts, 'device': self.device}
        headers = {'Authorization': self.api_key}
        response = requests.post(f'{self.server}/api/v1/frida/get_script', data=data, headers=headers)
        return response

    def get_frida_code(self):
        try:
            with open(self.frida_path, 'r') as file:
                return file.read()
        except Exception as e:
            print(f'Error reading the Frida script: {e}')
            return None

    def analyze(self):
        for apk in self.apks: # 정적 분석 리패키징 apk
            if 'repackaged_' in apk:
                self.upload_apk(apk)
                self.scan_apk(apk)
                self.static_json(apk)
                self.download_pdf(apk)

        self.apks = [apk for apk in self.apks if 'repackaged_' not in apk]

        for apk in self.apks: # 동적 분석 본 apk
            self.upload_apk(apk)
            self.scan_apk(apk)
            self.static_json(apk)
            self.get_apps()

            while True:
                if self.start_dynamic_analysis().status_code == 200:
                    break

            self.frida_instrument(default_hooks=True, frida_code=self.get_frida_code())
            #self.frida_get_dependencies()

            self.dynamic_act_tester('activity')
            self.dynamic_act_tester('exported')

            self.frida_monitor()

            self.frida_instrument(default_hooks=True, frida_code=self.get_frida_code())
            self.dynamic_tls_test()
            self.frida_logs()

            self.stop_dynamic_analysis()
            self.dynamic_report_json()
            self.download_pdf(apk)
            self.delete()