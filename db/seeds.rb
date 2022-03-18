Organization.destroy_all
Sport.destroy_all
User.destroy_all
Result.destroy_all
Event.destroy_all

user = User.create(
  first_name: 'Admin',
  last_name: 'Comitê',
  username: 'cob_admin',
  password: '12341234',
  password_confirmation: '12341234',
  role: 'admin',
  age: rand(20.50),
  email: 'admin@cob.com.br'
)

Organization.create(
  name: 'Comitê Olímpico Brasileiro',
  code: 'COB',
  user_id: user.id
)

Sport.create(
  name: '100 Metros Rasos',
  win_condition: 'asc',
  max_attempts: 1
)

Sport.create(
  name: 'Lançamento de Dardo',
  win_condition: 'desc',
  max_attempts: 3
)
