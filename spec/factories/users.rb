FactoryBot.define do
  factory :user do
    name { "test1" }
    email { "test1@email.com" }
    password { "test123" }
    password_confirmation { "test123" }
    admin { "false" }
    status {"求職者"}
  end

  factory :second_user, class: User do
    name { "test2" }
    email { "test2@test.com" }
    password { "test234" }
    password_confirmation { "test234" }
    admin { "false" }
    status {"店舗"}
  end

  factory :third_user, class: User do
    name { "admin_guest_sessions_user" }
    email { "admin_user@mail.com" }
    password { "9999999" }
    admin { "true" }
  end

  factory :forth_user, class: User do
    name { "test4" }
    email { "test4@test.com" }
    password { "test234" }
    password_confirmation { "test234" }
    admin { "false" }
    status {"店舗"}
  end

  factory :fifth_user, class: User do
    name { "test5" }
    email { "test5@test.com" }
    password { "test234" }
    password_confirmation { "test234" }
    admin { "false" }
    status {"店舗"}
  end
end
