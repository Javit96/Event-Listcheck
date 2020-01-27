from flask import Flask, jsonify, redirect
import pyodbc 
import json

##Coneccion Base de datos
cnxn = pyodbc.connect('DRIVER={ODBC Driver 17 for SQL Server};SERVER=SOPHIEJM;DATABASE=CalendarOffline; UID=Javier Ivan Moreno; PWD= Abuelosuligoy96;Trusted_Connection=yes;')



##Pagina 
app = Flask(__name__)
 
app.secret_key = 'mysecretkey'

@app.route("/add_user/<string:first_name>/<string:last_name>/<string:email>/<string:username>/<string:password>/<string:api_key>")
def AddnewUser(first_name, last_name, email, username, password, api_key):
    cursor = cnxn.cursor()
    tsql = "INSERT INTO Users (first_name, last_name, email, username, password, api_key) VALUES (?,?,?,?,?,?);"
    cursor.execute(tsql, first_name, last_name, email, username, password, api_key)
    cnxn.commit()
    return ("Contacto Agregado")


@app.route("/view_task/<int:User_Id>/Tasks")
def ListTask(User_Id):
    cursor = cnxn.cursor()
    tsql = "SELECT Task_name FROM Tasks WHERE User_Id = ?;"
    cursor.execute(tsql, User_Id)
    events = cursor.fetchall()
    cnxn.commit()
    return ({"event": events})

@app.route("/add_event/<int:User_Id>/<string:Task_name>/<string:Note>/<int:Completed>")
def Addnewtask(User_Id, Task_name, Note, Completed):
    cursor = cnxn.cursor()
    tsql = "INSERT INTO Tasks (User_Id, Task_name, Note, Completed) VALUES (?,?,?,?);"
    cursor.execute(tsql, User_Id, Task_name, Note, Completed)
    cnxn.commit()
    return ("Evento Agregado")

@app.route("/delete_event/<int:User_Id>/<string:Task_name>")
def Delete_event(User_Id, Task_name):
    cursor = cnxn.cursor()
    tsql = "DELETE FROM Tasks WHERE User_Id = ? and Task_name = ?;"
    cursor.execute(tsql, User_Id, Task_name)
    cnxn.commit()
    return ("Evento Eliminado")



if __name__ == '__main__':
    app.run(debug=True)