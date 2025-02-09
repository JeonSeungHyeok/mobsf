import os
import logging
import shutil
import hashlib
logger = logging.getLogger(__name__)

class Key:
    def __init__(self, user_home) -> None:
        self.user_home = user_home

    def api_key(self):
        """Print REST API Key."""
        if os.environ.get('MOBSF_API_KEY'):
            logger.info('\nAPI Key read from environment variable')
            return os.environ['MOBSF_API_KEY']
    
        secret_file = os.path.join(self.user_home, '.MobSF', 'secret')
        if self.is_file_exists(secret_file):
            try:
                with open(secret_file, 'r') as file:
                    api_key = file.read().strip()
                    return self.generate_sha256_hash(api_key)
            except Exception:
                logger.exception('Cannot read API key')
    
    def is_file_exists(self, file_path):
        if os.path.isfile(file_path):
            return True
        # This fix situation where a user just typed "adb" or another executable
        # inside settings.py/config.py
        if shutil.which(file_path):
            return True
        return False
    
    def generate_sha256_hash(self, msg):
        """Generate SHA-256 hash of the message."""
        if isinstance(msg, str):
            msg = msg.encode('utf-8')
        hash_object = hashlib.sha256(msg)
        return hash_object.hexdigest()
