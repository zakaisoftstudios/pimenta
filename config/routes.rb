require 'sidekiq/web'

Rails.application.routes.draw do
  mount Rswag::Api::Engine => '/api-docs'
  mount Rswag::Ui::Engine => '/api-docs'

  mount ActionCable.server => '/cable'
  mount Sidekiq::Web => '/sidekiq'

  scope module: 'api' do
    namespace 'v1' do
      resources :contacts,              only: [:create]
      resources :attachments,           except: [:new, :edit]
      resources :links,                 except: [:new, :edit]
      resources :pings,                 only: [:index]
      resources :user_token,            only: [:create]
      resource  :email_confirmations,   only: [:create]
      resource  :current_user,          only: [:show]
      resources :users,                 only: [:create]
      resources :skills,                only: [:index]
      resources :interests,             only: [:index]
      resources :strengths,             only: [:index]
      resource  :chat_notifications,    only: [:destroy]
      resources :password_resets,       only: [:create, :update]
      resources :subject_likes, only: [:create, :destroy, :index]
      resources :facebook_user_tokens,  only: :create
      resources :conversations do 
        resources :conversation_messages, only: [:index, :create]
      end

      delete 'account' => 'account#destroy'

      namespace 'admin' do
        resources :profile, only: :index
        resources :dashboard, only: :index
        namespace :university do
          resources :profiles, only: [:index, :destroy]
          resources :subject_offers, only: :destroy
        end
        namespace :company do
          resources :profiles, only: [:index, :destroy]
          resources :job_offers, only: :destroy
        end
        namespace :student do
          resources :profiles, only: [:index, :destroy]
        end
      end

      namespace 'non_authenticated' do
        resources :job_search, only: [:index]
        resources :subject_search, only: [:index]
      end

      namespace 'company' do
        delete 'account' => 'account#destroy'
        resources :subject_search, only: [:index, :show]
        resource :profile, only: [:update, :show] do
          resources :job_offers, only: [
            :create, :index, :show, :update, :destroy
          ] do
            resources :attachments, 
              only: [:update], 
              controller: 'job_attachments'
          end
        end

        resources :hunting, only: [:index]
        resources :hunts, only: [:index, :create, :destroy]
        resources :liked_from, only: [:index, :destroy]
        resource :like_back, only: [:create, :destroy]
        resource :blocks, only: [:create]
        resources :student_search,  only: [:index]
        resources :conversations, only: [:index, :destroy]
      end

      namespace 'university' do
        delete 'account' => 'account#destroy'
        resource  :profile,   only: [:update, :show] do
          resources :subject_offers,   
            only: [:index, :create, :update, :show, :destroy] do
            resources :attachments, 
              only: [:update], 
              controller: 'subject_attachments'
          end
        end

        resources :liked_from, only: [:index]
      end

      namespace 'student' do
        delete 'account' => 'account#destroy'
        resource  :profile, only: [:update, :show]
        resources :job_search, only: [:index, :show]
        resources :subject_search, only: [:index, :show]
        resources :hunted_by, only: [:index]
        resources :likes, only: [:create, :destroy, :index]
        resource :hunt_likes, only: [:create, :destroy]
        resource :blocks, only: [:create]
        resources :conversations, only: [:index, :destroy]
      end
    end
  end
end
