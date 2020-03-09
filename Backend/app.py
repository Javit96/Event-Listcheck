from flask import Blueprint
from flask_restful import Api
from resources.Register import Register
from resources.Signin import Signin
from resources.task import Tasks
from resources.user import UserInfo

api_bp = Blueprint('api', __name__)
api = Api(api_bp)

# Route
api.add_resource(Register, '/register')

api.add_resource(Signin, "/singin")

api.add_resource(Tasks, "/tasks")

api.add_resource(UserInfo, "/info")