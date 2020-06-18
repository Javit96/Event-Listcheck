from flask_restful import Resource
from flask import request
from model import db, User

class UserInfo(Resource):
    def get(self):
        result = ""
        
        header = request.headers["Authorization"]

        if not header:
            print("No apiKey")
            return{"Message": 'No apiKey'}, 400

        else:
            user = User.query.filter_by(api_key = header).first()
            

            if user:
                result = User.serialize(user)
                
            else:
                print("Wrong api Key")
                return{"Message": "Wrong api"},400

        return{"status": 'success', "data": result},201
