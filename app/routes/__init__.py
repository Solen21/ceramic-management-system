from flask import Blueprint, render_template
from app.models import Product, User, Role
from app import db

main_routes = Blueprint('main', __name__)

@main_routes.route('/')
def home():
    # Query for dashboard statistics
    product_count = Product.query.count()
    total_stock = db.session.query(db.func.sum(Product.stock)).scalar() or 0
    user_count = User.query.count()

    return render_template('dashboard/dashboard.html', product_count=product_count,
                           total_stock=total_stock, user_count=user_count)

@main_routes.route('/products')
def products():
    # Fetch all products from the database
    all_products = Product.query.all()
    return render_template('products/list.html', products=all_products)
