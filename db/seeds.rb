# rake db:seed
User.destroy_all
Patient.destroy_all
Disease.destroy_all
Drug.destroy_all

@user1 = User.create(first_name: "Tom", last_name: "Cruize", email: "tomcruize@gmail.com", password_digest: "tom")
@user2 = User.create(first_name: "John", last_name: "Smith", email: "johnsmith@gmail.com", password_digest: "john")
@user3 = User.create(first_name: "Adam", last_name: "Jones", email: "adamjones@gmail.com", password_digest: "adam")

@chf = Disease.create(name: "Chronic Heart Failure", symptoms: "Shortness of breath, fatigue and weakness, rapid or irregular heartbeat")
@diabetes = Disease.create(name: "Type 2 diabetes", symptoms: "Frequent urination, increased thirst, blurry vision")
@arthrosis = Disease.create(name: "Arthrosis", symptoms: "Pain, stiffness, swelling, redness")
@gastritis = Disease.create(name: "Gastritis", symptoms: "Nausea or recurrent upset stomach, abdominal bloating, abdominal pain")
@stroke = Disease.create(name: "Stroke", symptoms: "Sudden numbness or weakness in the face, arm, or leg, especially on one side of the body")
@pneumonia = Disease.create(name: "Pneumonia", symptoms: "Cough, which may produce greenish, yellow or even bloody mucus, fever, sweating and shaking chills, shortness of breath")

@patient1a = Patient.create(name: Faker::Name.name, gender: Faker::Gender.binary_type, age: 30, condition: "moderate", user: @user1, disease: @chf)
@patient1b = Patient.create(name: Faker::Name.name, gender: Faker::Gender.binary_type, age: 35, condition: "mild", user: @user1, disease: @diabetes)
@patient1c = Patient.create(name: Faker::Name.name, gender: Faker::Gender.binary_type, age: 40, condition: "severe", user: @user1, disease: @arthrosis)
@patient2a = Patient.create(name: Faker::Name.name, gender: Faker::Gender.binary_type, age: 49, condition: "mild", user: @user2, disease: @diabetes)
@patient2b = Patient.create(name: Faker::Name.name, gender: Faker::Gender.binary_type, age: 38, condition: "moderate", user: @user2, disease: @gastritis)
@patient2c = Patient.create(name: Faker::Name.name, gender: Faker::Gender.binary_type, age: 55, condition: "severe", user: @user2, disease: @stroke)
@patient3a = Patient.create(name: Faker::Name.name, gender: Faker::Gender.binary_type, age: 68, condition: "severe", user: @user3, disease: @arthrosis)
@patient3b = Patient.create(name: Faker::Name.name, gender: Faker::Gender.binary_type, age: 46, condition: "mild", user: @user3, disease: @diabetes)
@patient3c = Patient.create(name: Faker::Name.name, gender: Faker::Gender.binary_type, age: 55, condition: "severe", user: @user3, disease: @pneumonia)

@b_blocker = Drug.create(name: "B-blockers", dosage: "5mg", patient: @patient1a)
@metformin = Drug.create(name: "Metformin", dosage: "500mg", patient: @patient1b)
@nsaid = Drug.create(name: "Non-steroidal anti-inflammatory drugs", dosage: "500mg", patient: @patient1c)
@omeprazole = Drug.create(name: "Omeprazol", dosage: "500mg", patient: @patient2b)
@Aateplase = Drug.create(name: "Atelpaze", dosage: "200mg", patient: @patient2c)
@clindamycin = Drug.create(name: "Clindamycin", dosage: "150mg", patient: @patient3c)