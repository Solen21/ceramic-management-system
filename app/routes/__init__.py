from flask import Blueprint, render_template, request, redirect, url_for, flash
from app.models import Product, User, Role
from app import db
from .forms import ProductForm
from .main import main
from app.models import Product, User, Role


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

@main_routes.route('/add-product', methods=['GET', 'POST'])
def add_product():
    form = ProductForm()
    if form.validate_on_submit():
        # Create a new product instance
        new_product = Product(
            name=form.name.data,
            price=form.price.data,
            stock=form.stock.data
        )
        db.session.add(new_product)
        db.session.commit()
        flash('Product added successfully!', 'success')
        return redirect(url_for('main.products'))
    return render_template('products/product_form.html', form=form)
