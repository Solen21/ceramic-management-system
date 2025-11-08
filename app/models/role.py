from app import db

class Role(db.Model):
    __tablename__ = 'roles'  # ✅ use plural or unique name
    id = db.Column(db.Integer, primary_key=True)
    name = db.Column(db.String(80), unique=True, nullable=False)
