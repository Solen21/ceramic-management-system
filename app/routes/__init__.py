from flask import Blueprint, render_template

main_routes = Blueprint('main', __name__)

@main_routes.route('/')
def home():
    return render_template('dashboard/dashboard.html')

@main_routes.route('/products')
def products():
    # In the future, you would fetch products from a database here
    return render_template('products/list.html')
