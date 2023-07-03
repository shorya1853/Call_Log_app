from pymongo import MongoClient
from constant import mongoUrl

class Database:
    def __init__(self):
        self.client = MongoClient(mongoUrl)
        self.db = self.client['callLog_collection']

    def get_collection(self, callLog_collection):
        return self.db[callLog_collection]
    
    def image_collection(self, contact_profile_image):
        return self.db[contact_profile_image]
