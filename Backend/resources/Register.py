from flask_restful import Resource
from flask import request
from Model import db, User
import random
import string

class Register(Resource):
    def get(self):
        user = User.query.all()
        user_list = []
        for i in range(0, len(users)):
            user_list.append(users[i].serialize())
        return {"status": str(user_list)}, 200

    def post(self):
        json_data = request.get_json(force = True)

        if not json_data:
            return {"message": 'No input data provided'}, 400

        user = User.query.filter_by(username = json_data['username']).first()
        if user :
            return {'message' : 'Username not avaliable'}, 400

        user = User.query.filter_by(emailadress = json_data['emailadress']).first()
        if user :
            return {'message' : 'Email already register'}, 400

        api_key = self.generate_key()

        user = User.query.filter_by(api_key=api_key).first()
        if user:
            return {'message': 'API key already exists'}, 400

        user = User(
            api_key = api_key,
            first_name = json_data['first_name'],
            last_name = json_data['last_name'],
            emailadress = json_data['emailadress'],
            password = json_data['password'],
            username = json_data['username'],
        )
        db.session.add(user)
        db.session.commit()

        result = User.serialize(user)

        return{"status" : 'Success!!', 'data' : result},201

    def generate_key(self):
        return ''.join(random.choice(string.ascii_letters + string.digits) for _ in range(50))
        