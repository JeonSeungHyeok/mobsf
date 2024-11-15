import requests
import os
import json
from datetime import datetime
from requests_toolbelt import MultipartEncoder
from colors import *

class Analysis:
    def __init__(self,server,filePath,fileName,apiKey,device) -> None:
        self.server = server
        self.path = filePath
        self.filePath = filePath+'/new_'+fileName
        self.apiKey=apiKey
        self.scanHash=''
        self.device=device

    def upload_apk(self):
        print(f'{GREEN}[*]{RESET} Uploading APK')
        multipartData = MultipartEncoder(
            fields = {'file':(self.filePath, open(self.filePath,'rb'),'application/octet-stream')}
        )
        headers = {
            'Content-Type':multipartData.content_type,
            'Authorization':self.apiKey
        }
        response = requests.post(f'{self.server}/api/v1/upload',data=multipartData, headers=headers)
        result = response.json()
        if 'hash' in result:
            self.scanHash = result['hash']
            print(f'{BLUE}[+]{RESET} Upload completed')
        else:
            print(f'{RED}[-]{RESET} Not upload completed')

    def scan_apk(self):
        print(f'{GREEN}[*]{RESET} Scanning Started')
        data = {
            'hash':self.scanHash,
            'scan_type':self.filePath.split('.')[-1],
            'file_name':os.path.basename(self.filePath)
            }
        headers = {
            'Authorization':self.apiKey
        }
        response = requests.post(f'{self.server}/api/v1/scan',data=data,headers=headers)
        if response.status_code == 200:
            print(f'{BLUE}[+]{RESET} Scanning completed')
        else:
            print(f'{RED}[-]{RESET} Not scanning completed')

    def static_json(self):
        print(f"{GREEN}[*]{RESET} Generating Static json")
        data = {
            "hash":self.scanHash
        }
        headers = {
            "Authorization":self.apiKey
        }
        response = requests.post(f"{self.server}/api/v1/report_json",data=data,headers=headers)
        date = datetime.now().strftime("%Y-%m-%d")
        with open(self.path+f'/static_report-{date}.json','w+') as f:
            json.dump(response.json(),f)
        return response

    def download_pdf(self):
        print(f'{BLUE}[*]{RESET} Downloading the pdf')
        data = {
            'hash':self.scanHash,
        }
        headers = {
            'Authorization':self.apiKey
        }
        response = requests.post(f'{self.server}/api/v1/download_pdf',data=data,headers=headers)
        date = datetime.now().strftime("%Y-%m-%d")
        with open(self.path+f'/static_analysis_report-{date}.pdf','wb') as f:
            f.write(response.content)
        print(f'{GREEN}[+]{RESET} Download complete')
        print(f'{BLUE}[*]{RESET} Result of static analyze is at {YELLOW}{self.path+"/static_analysis_report.pdf"}{RESET}')

    def delete(self):
        print(f"{RED}[*]{RESET} Deleting")
        data = {
            "hash":self.scanHash
        }
        headers = {
            "Authorization":self.apiKey
        }
        response = requests.post(f"{self.server}/api/v1/delete_scan",data=data,headers=headers)
        return response

    def get_apps(self):
        print(f"{GREEN}[*]{RESET} Connecting to Emulator")
        headers = {
            'Authorization':self.apiKey
        }
        response = requests.get(f"{self.server}/api/v1/dynamic/get_apps",headers=headers)
        return response

    def start_dynamic_analysis(self):
        print(f"{GREEN}[*]{RESET} Starting Dynamic Analysis")
        data = {
            "hash":self.scanHash
        }
        headers = {
            "Authorization":self.apiKey
        }
        response = requests.post(f"{self.server}/api/v1/dynamic/start_analysis",data=data,headers=headers)
        return response

    def stop_dynamic_analysis(self):
        print(f"{RED}[*]{RESET} Stop Dynamic Analysis")
        data = {
            "hash":self.scanHash
        }
        headers = {
            "Authorization":self.apiKey
        }
        response = requests.post(f"{self.server}/api/v1/dynamic/stop_analysis",data=data,headers=headers)
        return response

    def dynamic_report_json(self):
        print(f"{GREEN}[*]{RESET} Making Dynamic json report")
        data = {
            "hash":self.scanHash
        }
        headers = {
            "Authorization":self.apiKey
        }
        response = requests.post(f"{self.server}/api/v1/dynamic/report_json",data=data,headers=headers)
        date = datetime.now().strftime("%Y-%m-%d")
        with open(self.path+f'/dynamic_report-{date}.json','w+') as f:
            json.dump(response.json(),f)
        return response
    
    def dynamic_act_tester(self, test):
        print(f"{GREEN}[*]{RESET} Dynamic Act Tester {test}")
        data = {
            "hash":self.scanHash,
            "test":test
        }
        headers = {
            "Authorization":self.apiKey
        }
        response = requests.post(f"{self.server}/api/v1/android/activity",data=data,headers=headers)
        return response
    
    def dynamic_start_activity(self,activity):
        print(f"{BLUE}[*]{RESET} Dynamic Start Activiry")
        data = {
            "hash":self.scanHash,
            "activity":activity
        }
        headers = {
            "Authorization":self.apiKey
        }
        response = requests.post(f"{self.server}/api/v1/android/start_activity",data=data,headers=headers)
        return response
    
    def dynamic_tls_test(self):
        print(f"{BLUE}[*]{RESET} Dynamic TLS Test")
        data = {
            "hash":self.scanHash
        }
        headers = {
            "Authorization":self.apiKey
        }
        response = requests.post(f"{self.server}/api/v1/android/tls_tests",data=data,headers=headers)
        return response
    
    def frida_instrument(self,default_hooks='',auxiliary_hooks='',frida_code='',class_name=None,class_search=None,class_trace=None):
        data = {
            'hash':self.scanHash,
            'default_hooks':default_hooks,
            'auxiliary_hooks':auxiliary_hooks,
            'frida_code':frida_code
        }
        if class_name:
            data['class_name']=class_name
        if class_search:
            data['class_search']=class_search
        if class_trace:
            data['class_trace']=class_trace
        headers = {
            'Authorization':self.apiKey
        }
        response = requests.post(f"{self.server}/api/v1/frida/instrument",data=data,headers=headers)
        return response
    
    def frida_monitor(self):
        data = {
            'hash':self.scanHash
        }
        headers = {
            'Authorization':self.apiKey
        }
        response = requests.post(f"{self.server}/api/v1/frida/api_monitor",data=data,headers=headers)
        return response
    
    def frida_get_dependencies(self):
        data = {
            'hash':self.scanHash
        }
        headers = {
            'Authorization':self.apiKey
        }
        response = requests.post(f"{self.server}/api/v1/frida/get_dependencies",data=data,headers=headers)
        return response
    
    def frida_logs(self):
        data = {
            'hash':self.scanHash
        }
        headers = {
            'Authorization':self.apiKey
        }
        response = requests.post(f"{self.server}/api/v1/frida/logs",data=data,headers=headers)
        return response
    
    def frida_list_script(self):
        data = {
            'device':self.device
        }
        headers = {
            'Authorization':self.apiKey
        }
        response = requests.post(f"{self.server}/api/v1/frida/list_script",data=data,headers=headers)
        return response
    
    def frida_get_script(self,scripts):
        data = {
            'scripts[]':scripts,
            'device':self.device
        }
        headers = {
            'Authorization':self.apiKey
        }
        response = requests.post(f"{self.server}/api/v1/frida/get_script",data=data,headers=headers)
        return response
    
    def Analysis(self):
        self.upload_apk()
        self.scan_apk()
        self.static_json()
        self.get_apps()
        self.start_dynamic_analysis()
        self.start_dynamic_analysis()
        
        self.dynamic_act_tester("exported")
        self.dynamic_act_tester("test")
        self.dynamic_tls_test()
        self.stop_dynamic_analysis()
        self.dynamic_report_json()
        self.download_pdf()
        self.delete()