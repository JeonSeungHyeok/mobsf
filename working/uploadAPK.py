import requests
import os
from requests_toolbelt import MultipartEncoder

GREEN = '\033[92m'
RED = '\033[91m'
BLUE = '\033[94m'
YELLOW = '\033[93m'
RESET = '\033[0m'

class StaticAnalysis:
    def __init__(self,server,filePath,apiKey, fileName) -> None:
        self.server = server
        self.path = filePath
        self.filePath = filePath+'/new_'+fileName
        self.apiKey=apiKey
        self.scanHash=''

    def upload_apk(self):
        print(f'{BLUE}[*]{RESET} Uploading APK')
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
            print(f'{GREEN}[+]{RESET} Upload completed')

    def scan_apk(self):
        print(f'{BLUE}[*]{RESET} Scanning Started')
        data = {
            'hash':self.scanHash,
            'scan_type':self.filePath.split('.')[-1],
            'file_name':os.path.basename(self.filePath)
            }
        headers = {
            'Authorization':self.apiKey
        }
        response = requests.post(f'{self.server}/api/v1/scan',data=data,headers=headers)
        print(f'{GREEN}[+]{RESET} Scanning completed')

    def download_pdf(self):
        print(f'{BLUE}[*]{RESET} Downloading the pdf')
        data = {
            'hash':self.scanHash,
        }
        headers = {
            'Authorization':self.apiKey
        }
        response = requests.post(f'{self.server}/api/v1/download_pdf',data=data,headers=headers)
        with open(self.path+'/static_analysis_report.pdf','wb') as f:
            f.write(response.content)
        print(f'{GREEN}[+]{RESET} Download complete')
        print(f'{BLUE}[*]{RESET} Result of static analyze is at {YELLOW}{self.path+"/static_analysis_report.pdf"}{RESET}')

    def staticAnalysis(self):
        self.upload_apk()
        self.scan_apk()
        self.download_pdf()


