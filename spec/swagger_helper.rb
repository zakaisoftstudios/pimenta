require 'rails_helper'

RSpec.configure do |config|
  # Specify a root folder where Swagger JSON files are generated
  # NOTE: If you're using the rswag-api to serve API descriptions, you'll need
  # to ensure that it's configured to serve Swagger from the same folder
  config.swagger_root = Rails.root.to_s + '/swagger'

  # Define one or more Swagger documents and provide global metadata for each one
  # When you run the 'rswag:specs:to_swagger' rake task, the complete Swagger will
  # be generated at the provided relative path under swagger_root
  # By default, the operations defined in spec files are added to the first
  # document below. You can override this behavior by adding a swagger_doc tag to the
  # the root example_group in your specs, e.g. describe '...', swagger_doc: 'v2/swagger.json'
  config.swagger_docs = {
    'v1/swagger.json' => {
      swagger: '2.0',
      info: {
        title: 'NextStep API',
        version: 'v1'
      },
      basePath: '/v1',
      schemes: ['http', 'https'],
      consumes: ['application/json'],
      produces: ['application/json'],
      securityDefinitions: {
        Bearer: {
          type: :apiKey,
          in: :header,
          name: 'Authorization'
        }
      },
      security: [Bearer: {}],
      definitions: {
        auth: {
          type: 'object',
          properties: {
            auth: {
              type: 'object',
              properties: {
                email: { type: 'string'  },
                password: { type: 'string' }
              },
              required: ['email', 'password']
            },
          },
          required: ['auth'],
        },
        jwt: {
          type: 'object',
          properties: {
            jwt: { type: 'string' }
          },
          required: ['jwt']
        },

        new_user: {
          type: 'object',
          properties: {
            user: {
              type: 'object',
              properties: {
                name: { type: 'string' },
                email: { type: 'string' },
                password: { type: 'string' },
                password_confirmation: { type: 'string' },
                profile_type: { type: 'string' }
              },
              required: ['email', 'password', 'password_confirmation', 'profile_type']
            },
            required: ['user']
          }
        },

        
        user: {
          type: 'object',
          properties: {
            id: { type: 'integer' },
            email: { type: 'string' },
            profile_type: { type: 'string' },
            jwt: { type: 'string' },
            profile: {
              type: 'object',
              properties: {
                name: { type: 'string' }
              },
              required: ['name']
            }
          },
          required: ['id', 'email', 'profile_type']
        },
        new_company_profile: {
          type: 'object',
          properties: {
            profile: {
              type: 'object',
              properties: {
                name: { type: 'string' },
                contact_person: { type: 'string' },
                industry_sector: { type: 'string' },
                number_of_employees: { type: 'string' },
                country: { type: 'string' },
                city: { type: 'string' },
                street: { type: 'string' },
                what_we_do: { type: 'string' },
                why_we_do_it: { type: 'string' },
                why_you_should_join_our_team: { type: 'string' },
                special_features: { type: 'string' },
                
                attachments_attributes: { type: 'array', items: {
                  '$ref' => '#/definitions/attachment'
                }}
              },
              required: [
                'contact_person', 
                'industry_sector', 
                'number_of_employees', 
                'country', 
                'city', 
                'street', 
                'what_we_do', 
                'why_we_do_it', 
                'why_you_should_join_our_team'
              ]
            },
            required: ['profile']
          },
        },
        company_profile: {
          type: 'object',
          properties: {
            id: { type: 'integer' },
            name: { type: 'string' },
            contact_person: { type: 'string' },
            industry_sector: { type: 'string' },
            number_of_employees: { type: 'integer' },
            country: { type: 'string' },
            city: { type: 'string' },
            street: { type: 'string' },
            what_we_do: { type: 'string' },
            why_we_do_it: { type: 'string' },
            why_you_should_join_our_team: { type: 'string' },
            special_features: { type: 'string' },
            attachments_attributes: { type: 'array', items: {
              '$ref' => '#/definitions/attachment'
            }}
          },
          required: [
            'id',
            'name', 
            'contact_person', 
            'industry_sector', 
            'number_of_employees', 
            'country', 
            'city', 
            'street', 
            'what_we_do', 
            'why_we_do_it', 
            'why_you_should_join_our_team'
          ]
        },


        university_profile: {
          type: 'object',
          properties: {
            id:                           { type: 'integer' },
            name:                         { type: 'string' },
            contact_person:               { type: 'string' },
            industry_sector:              { type: 'string' },
            number_of_employees:          { type: 'integer' },
            country:                      { type: 'string' },
            city:                         { type: 'string' },
            street:                       { type: 'string' },
            we_are:                       { type: 'string' },
            why_we_do_it:                 { type: 'string' },
            why_should_you_study_here:    { type: 'string' },
            special_features:             { type: 'string' },
            subject_areas:                { type: 'string' },
            partners:                     { type: 'string' },
            type_of_university:           { type: 'string' },
            attachments_attributes: { type: 'array', items: {
              '$ref' => '#/definitions/attachment'
            }}
          },
          required: [
            'id',
            'name', 
            'contact_person', 
            'industry_sector', 
            'number_of_employees', 
            'country', 
            'city', 
            'street', 
            'we_are', 
            'why_we_do_it', 
            'why_should_you_study_here'
          ]
        },

        new_company_profile: {
          type: 'object',
          properties: {
            id:                           { type: 'integer' },
            name:                         { type: 'string' },
            contact_person:               { type: 'string' },
            industry_sector:              { type: 'string' },
            number_of_employees:          { type: 'integer' },
            country:                      { type: 'string' },
            city:                         { type: 'string' },
            street:                       { type: 'string' },
            we_are:                       { type: 'string' },
            why_we_do_it:                 { type: 'string' },
            why_should_you_study_here:    { type: 'string' },
            special_features:             { type: 'string' },
            subject_areas:                { type: 'string' },
            partners:                     { type: 'string' },
            type_of_university:           { type: 'string' },
            attachments_attributes: { type: 'array', items: {
              '$ref' => '#/definitions/attachment'
            }}
          },
          required: [
            'id',
            'name', 
            'contact_person', 
            'industry_sector', 
            'number_of_employees', 
            'country', 
            'city', 
            'street', 
            'we_are', 
            'why_we_do_it', 
            'why_should_you_study_here'
          ]
        },

        new_job_offer: {
          type: 'object',
          properties: {
            job_offer: {
              type: 'object',
              properties: {
                category: { type: 'string' },
                content: { type: 'string' },
                what_is_expected_from_you: { type: 'string' },
                what_is_expected_from_us: { type: 'string' },
                tasks: { type: 'string' },
                perspectives: { type: 'string' },
                city: { type: 'string' },
                start: { type: 'string' },
                end_date: { type: 'number' },
                wage: { type: 'number' },
                free_places: { type: 'integer' },
                working_hours_per_week: { type: 'integer' },
                minimum_graduation: { type: 'string' },
                wage_period: { type: 'string' },
                attachments: { type: 'array', items: {
                  '$ref' => '#/definitions/attachment'
                }}

              },
              required: [
                'category', 
                'content', 
                'what_is_expected_from_you', 
                'what_is_expected_from_us', 
                'tasks', 
                'perspectives', 
                'city', 
                'start', 
                'wage', 
                'free_places',
                'attachments'
              ]
            },
            required: ['job_offer']
          }
        },
        job_offer: {
          type: 'object',
          properties: {
            id: { type: 'integer' },
            category: { type: 'string' },
            content: { type: 'string' },
            what_is_expected_from_you: { type: 'string' },
            what_is_expected_from_us: { type: 'string' },
            tasks: { type: 'string' },
            perspectives: { type: 'string' },
            city: { type: 'string' },
            start: { type: 'string' },
            end_date: { type: 'number' },
            wage: { type: 'number' },
            free_places: { type: 'integer' },
            working_hours_per_week: { type: 'integer' },
            minimum_graduation: { type: 'string' },
            wage_period: { type: 'string' },
            skills: { type: 'array', items: { 
              '$ref' => '#/definitions/skill' 
            }},
            interests: { type: 'array', items: {
              '$ref' => '#/definitions/interest'
            }},
            strengths: { type: 'array', items: {
              '$ref' => '#/definitions/strength'
            }},
            attachments: { type: 'array', items: {
              '$ref' => '#/definitions/attachment'
            }}
          },
          required: [
            'id', 
            'category', 
            'content', 
            'what_we_expect_from_you', 
            'what_you_can_expect_from_us', 
            'what_we_need_from_you', 
            'city', 
            'start', 
            'wage', 
            'free_places', 
            'skills',
            'interests',
            'strengths',
            'company_profile_id'
          ]
        },
        skill: {
          type: 'object',
          properties: {
            id: { type: 'integer' },
            label: { type: 'string' },
            value: { type: 'string' }
          },
          required: ['id', 'label', 'value']
        },
        interest: {
          type: 'object',
          properties: {
            id: { type: 'integer' },
            label: { type: 'string' },
            value: { type: 'string' }
          },
          required: ['id', 'label', 'value']
        },
        strength: {
          type: 'object',
          properties: {
            id: { type: 'integer' },
            label: { type: 'string' },
            value: { type: 'string' }
          },
          required: ['id', 'label', 'value']
        },
        attachment: {
          type: 'object',
          properties: {
            id:               { type: 'integer' },
            picture:          { type: 'string' },
            video:            { type: 'string' },
            purpose:          { type: 'string' }
          },
        },
        error: {
          type: 'object',
          properties: {
            error: { type: 'string' }
          },
          required: ['error']
        }
      }
    }
  }
end
