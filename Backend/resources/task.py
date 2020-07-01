from flask_restful import Resource
from flask import request, jsonify
from model import db, User, Task
import random
import string

class Tasks(Resource):

    def post(self):
        header = request.headers["Authorization"]
        json_data = request.get_json(force = True)

        if not header:
            return {"Message": "No api key!"}, 400
        else:
            user = User.query.filter_by(api_key=header).first()
            if user:
                task = Task(
                    user_id = user.id,
                    title = json_data['title'],
                    note = json_data['note'],
                    completed = json_data['completed'],
                    repeats = json_data['repeats'],
                    deadline = json_data['deadline'],
                    reminders = json_data['reminders'],
                )
                db.session.add(task)
                db.session.commit()

                result = Task.serialize(task)
                return {"status": 'success', 'data': result}, 201

            else:
                return {"Messege": "No user with that api key"}, 402

    def get(self):
        result = []

        header = request.headers["Authorization"]

        if not header:
            return {"Message": "No api key!"}, 400
        else:
            user = User.query.filter_by(api_key = header).first()
            if user: 
                tasks = Task.query.filter_by(user_id = user.id).all()
                
                for task in tasks:
                    toAppend = Task.serialize(task)
                    result.append(toAppend)
            

        return {"status": 'success', "data": result},201

    def delete(self):
        
        header = request.headers["Authorization"]
        json_data = request.headers["task_id"]

        if not header:
            return {"Message": "No api key!"}, 400
        else:
            user = User.query.filter_by(api_key = header).first()
            if user: 
                task = Task.query.filter_by(user_id = user.id, id = int(json_data)).first()
                db.session.delete(task)
                db.session.commit()
                return {"status": 'success', "message": "Tarea eliminada"},201
            else:
                return{"message": 'failed'}
        
                


                
                
                   
            

        


        