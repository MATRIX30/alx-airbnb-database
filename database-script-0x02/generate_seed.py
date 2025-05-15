import uuid
from faker import Faker
import random

fake = Faker()

NUM_RECORDS = 200

# Generate Users
users = []
for _ in range(NUM_RECORDS):
    user_id = str(uuid.uuid4())
    first_name = fake.first_name()
    last_name = fake.last_name()
    email = fake.unique.email()
    password_hash = fake.sha256()
    phone_number = fake.phone_number()[:20]
    role = random.choice(['guest', 'host', 'admin'])
    users.append((user_id, first_name, last_name, email, password_hash, phone_number, role))

# Generate Properties (host_id must be a user with role 'host')
host_ids = [u[0] for u in users if u[6] == 'host']
properties = []
for _ in range(NUM_RECORDS):
    property_id = str(uuid.uuid4())
    host_id = random.choice(host_ids)
    name = fake.address().replace('\n', ', ')
    description = fake.text(100)
    location = fake.city()
    pricepernight = round(random.uniform(50, 500), 2)
    properties.append((property_id, host_id, name, description, location, pricepernight))

# Generate Bookings
property_ids = [p[0] for p in properties]
user_ids = [u[0] for u in users]
bookings = []
for _ in range(NUM_RECORDS):
    booking_id = str(uuid.uuid4())
    property_id = random.choice(property_ids)
    user_id = random.choice(user_ids)
    start_date = fake.date_between(start_date='-1y', end_date='today')
    end_date = fake.date_between(start_date=start_date, end_date='+30d')
    total_price = round(random.uniform(100, 5000), 2)
    status = random.choice(['pending', 'confirmed', 'canceled'])
    bookings.append((booking_id, property_id, user_id, start_date, end_date, total_price, status))

# Generate Payments
booking_ids = [b[0] for b in bookings]
payments = []
for _ in range(NUM_RECORDS):
    payment_id = str(uuid.uuid4())
    booking_id = random.choice(booking_ids)
    amount = round(random.uniform(100, 5000), 2)
    payment_method = random.choice(['credit_card', 'paypal', 'stripe'])
    payments.append((payment_id, booking_id, amount, payment_method))

# Generate Reviews
reviews = []
for _ in range(NUM_RECORDS):
    review_id = str(uuid.uuid4())
    property_id = random.choice(property_ids)
    user_id = random.choice(user_ids)
    rating = random.randint(1, 5)
    comment = fake.sentence()
    reviews.append((review_id, property_id, user_id, rating, comment))

# Generate Messages
messages = []
for _ in range(NUM_RECORDS):
    message_id = str(uuid.uuid4())
    sender_id = random.choice(user_ids)
    recipient_id = random.choice([uid for uid in user_ids if uid != sender_id])
    message_body = fake.sentence()
    messages.append((message_id, sender_id, recipient_id, message_body))

# Output SQL
with open('seed.sql', 'w') as f:
    f.write('-- Users\n')
    for u in users:
        f.write(f"INSERT INTO User (user_id, first_name, last_name, email, password_hash, phone_number, role) VALUES ('{u[0]}', '{u[1]}', '{u[2]}', '{u[3]}', '{u[4]}', '{u[5]}', '{u[6]}');\n")
    f.write('\n-- Properties\n')
    for p in properties:
        f.write(f"INSERT INTO Property (property_id, host_id, name, description, location, pricepernight) VALUES ('{p[0]}', '{p[1]}', '{p[2]}', '{p[3]}', '{p[4]}', {p[5]});\n")
    f.write('\n-- Bookings\n')
    for b in bookings:
        f.write(f"INSERT INTO Booking (booking_id, property_id, user_id, start_date, end_date, total_price, status) VALUES ('{b[0]}', '{b[1]}', '{b[2]}', '{b[3]}', '{b[4]}', {b[5]}, '{b[6]}');\n")
    f.write('\n-- Payments\n')
    for p in payments:
        f.write(f"INSERT INTO Payment (payment_id, booking_id, amount, payment_method) VALUES ('{p[0]}', '{p[1]}', {p[2]}, '{p[3]}');\n")
    f.write('\n-- Reviews\n')
    for r in reviews:
        f.write(f"INSERT INTO Review (review_id, property_id, user_id, rating, comment) VALUES ('{r[0]}', '{r[1]}', '{r[2]}', {r[3]}, '{r[4]}');\n")
    f.write('\n-- Messages\n')
    for m in messages:
        f.write(f"INSERT INTO Message (message_id, sender_id, recipient_id, message_body) VALUES ('{m[0]}', '{m[1]}', '{m[2]}', '{m[3]}');\n")