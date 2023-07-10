import base64
from flask import Flask, jsonify, render_template, json,request, redirect, url_for
from database import Database
from bson import ObjectId
from bson.json_util import dumps
import io


app = Flask(__name__)
db = Database()
collection = db.get_collection('callLog_collection')
image_collection = db.image_collection('contact_profile_image')

# @app.route('/', methods=["GET","POST"])
# def home():
#     if(request.method == 'POST'):
#         desc = request.form['description']
#         call_date = request.form['call_date']
#         return redirect(url_for("insert", description = desc, call_dates = call_date))
#     return render_template('index.html')

    
@app.route('/insert', methods=['POST'])
def insert():
    try:
        data = request.get_json()
        response = collection.insert_many(data)
        return jsonify({'message': 'success'})
    except Exception as ex:
        print(ex)


@app.route('/description', methods=['GET'])
def get_desc():
    response = collection.find({}, {'_id': False})
    json_data = dumps(response)
    return json_data, 200, {'Content-Type': 'application/json'}


@app.route("/imagefile", methods=['POST'])
def profile_image():
    image = request.files["files"]
    with open(image, 'rb') as image_file:
        image_data = image_file.read()
    image_document = {
        'name': request.form['name'],
        'profile_image': image_data
    }
    image_collection.insert_one(image_document)

    return jsonify({'message': 'Success'})

@app.route('/image/<name>', methods=['GET'])
def get_image(name):
    user_image = image_collection.find_one({'name': name})
    if user_image:
        image_data = user_image['profile_image']
        
        # Convert image data to base64 encoding
        base64_image = base64.b64encode(image_data).decode('utf-8')
        
        # Render the HTML page with the embedded image
        return render_template('index.html', image_data=base64_image)
    
    # Return an error response if the image document doesn't exist
    return 'Image not found', 404

if __name__ == '__main__':
    app.run()