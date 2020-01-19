1. user is able to create an account based on first name, last name, email and password (registration)
2. user is able to login to its homepage if already has an account (session)
3. after logging in, user can see the quantity patients that any user has, what diseases they have, what to prescribe as treatment
4. user can see descrition of user, patient, disease, prescription
5. user can chain the information => user A has many patients, from where, patient B has disease C with prescritions D
6. user can edit users, patients, diseases, drugs

create or download database users, patients, diseases and drugs

questions
- how to show @error messages?
- how to establish many_to_many relationship? patients has many drugs, drugs has many patients,
disease has many drugs, drugs has many diseases
- why redirecting to params[:id] rather than @patient.id? +
- how to use helper methods?
- how to show patient, which belong to particular user?
- how to eliminate duplications? (uniq)
- redirect in if else statement doesn't work
- how to use Active record build method?
- how to avoid duplication in creating database?
- how to use password authentication

views/patient/new.erb
<label for="type_of_disease">Type of disease: </label>
<input type="text" name="disease[patient][][name]"><br>
<select name="disease[patient][][name]">
<% @diseases.each do |disease| %>
<option value="<%= disease.id %>"><%= disease.name %></option>
<% end %>
</select><br>