import os
from app import create_app

# Create the Flask application
app = create_app()

if __name__ == "__main__":
    # Get the port from environment variable or use default (5000 for API 1 and 5001 for API 2)
    port = os.environ.get('FLASK_PORT', 5000)  # Default to 5000 if not set
    app.run(debug=True, host='0.0.0.0', port=int(port))
