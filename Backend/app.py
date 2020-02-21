from flask import Blueprint
from flask_restful import Api
from Backend.resources.Register import Register
from Backend.resources.Signin import Signin
from Backend.resources.task import Tasks

api_bp = Blueprint('api', __name__)
api = Api(api_bp)

# Route
api.add_resource(Register, '/register')

api.add_resource(Signin, "/singin")

api.add_resource(Tasks, "/tasks")