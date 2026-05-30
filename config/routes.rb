Rails.application.routes.draw do

  get "admins/dashboard"
  get "departments/dashboard"
  get "teachers/dashboard"
  get "students/dashboard"

  get  "/results", to: "results#index"
  get  "/results/search", to: "results#search", as: :search_results

  root "home#index"

  get 'department/students',
      to: 'departments#students',
      as: :department_students

  get 'department/teachers',
      to: 'departments#teachers',
      as: :department_teachers

  devise_for :users

  namespace :admin do

    resources :students do
      member do
        get :academics
      end
    end

    resources :teachers

    resources :departments do

      resources :department_semesters do

        resources :subjects do
          member do
            get :mark_entry
            get :show_marks
            post :bulk_save
          end

          resources :student_marks, only: [:create, :update] do
            collection do
              post :bulk_save
            end
          end


        end

      end

    end

    resources :academic_details

    resources :users

    get 'students',
        to: 'students#index'

    get 'students/department/:department_id',
        to: 'students#department_students',
        as: 'department_students'
  

  end

  get "/debug_users", to: "application#debug_users"

end