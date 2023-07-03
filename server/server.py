import base64
from flask import Flask, jsonify, render_template, json
from database import Database
from bson import ObjectId
import io


app = Flask(__name__)
db = Database()
collection = db.get_collection('callLog_collection')
image_collection = db.image_collection('contact_profile_image')


@app.route('/insert')
def your_endpoint():
    collection.insert_many()
    # Use the collection object to execute database operations, e.g., find, insert, etc.
    # Process the data and return a response
    return jsonify({'message': 'Success'})

@app.route("/user")
def user_profile():
    collection.find()
    return jsonify({'message': 'Success'})
# Other API endpoints and routes can be defined here

@app.route("/add", methods=['POST'])
def profile_image(name, image):
    with open(image, 'rb') as image_file:
        image_data = image_file.read()
    image_document = {
        'name': name,
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