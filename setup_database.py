from app import create_app, db
from app.models import Product, Role, User

def setup_database():
    """
    Creates all database tables and populates initial data for roles and products.
    """
    print("Setting up the database...")
    app = create_app()
    with app.app_context():
        # Create all tables based on the models
        db.create_all()
        print("Tables created.")

        # Populate Roles
        roles_to_create = ['Admin / Director', 'Store Manager', 'Worker / Staff', 'Customer']
        for role_name in roles_to_create:
            if not Role.query.filter_by(name=role_name).first():
                role = Role(name=role_name)
                db.session.add(role)
        db.session.commit()
        print(f"Roles populated: {Role.query.all()}")

        # Populate sample Products
        if not Product.query.first():
            p1 = Product(name='Classic Ceramic Mug', price=12.50, stock=50)
            p2 = Product(name='Hand-painted Plate', price=25.00, stock=30)
            p3 = Product(name='Large Serving Bowl', price=45.99, stock=15)
            db.session.add_all([p1, p2, p3])
            db.session.commit()
            print(f"Sample products populated: {Product.query.all()}")

    print("Database setup complete.")

if __name__ == '__main__':
    setup_database()