Ultra Light Wizard
==================

No time to manage a wizard state machine, session variables, or complicated controllers? Use Ultra Light Wizard!! A RESTful session-less validation-friendly simple wizard approach in Rails.

![Ultra Light Wizard Image](https://cdn.rawgit.com/AndyObtiva/ultra_light_wizard/master/ultra_light_wizard.jpg)

This RailsConf 2014 talk video explains it all:
https://www.youtube.com/watch?v=muyfoiKHMMA

Instructions
============

rails generate ultra_light_wizard:wizard (resource) steps=(step1),(step2),(step3),...

This will generate wizard step routes, controller, models, and views

Example:

rails generate ultra_light_wizard:wizard Project steps:basic_info,project_detail,file_uploads,preview

Output:

```
create  app/controllers/project_steps_controller.rb
create  app/models/project/basic_info.rb
create  app/views/project_steps/basic_info.html.erb
create  app/models/project/project_detail.rb
create  app/views/project_steps/project_detail.html.erb
create  app/models/project/file_uploads.rb
create  app/views/project_steps/file_uploads.html.erb
create  app/models/project/preview.rb
create  app/views/project_steps/preview.html.erb
 route  resources :projects, only: [:create, :show] do
resources :project_steps, only: [:edit, :update]
end
```

If you'd like to customize the term "step", you can add a step_alias:(alias) option as in the following:

Example:

rails generate ultra_light_wizard:wizard Project steps:basic_info,project_detail,file_uploads,preview step_alias:part

Output:

```
create  app/controllers/project_parts_controller.rb
create  app/models/project/basic_info.rb
create  app/views/project_parts/basic_info.html.erb
create  app/models/project/project_detail.rb
create  app/views/project_parts/project_detail.html.erb
create  app/models/project/file_uploads.rb
create  app/views/project_parts/file_uploads.html.erb
create  app/models/project/preview.rb
create  app/views/project_parts/preview.html.erb
 route  resources :projects, only: [:create, :show] do
resources :project_parts, only: [:edit, :update]
end
```

Once the files are generated, you can proceed to place your own code customizations in the wizard step models and views.

To learn more about the Ultra Light Wizard philosophy and function, please read this [Code Painter](http://www.codepainter.ca) blog post: [Ultra Light & Maintainable Wizard in Rails] (http://www.codepainter.ca/2013/10/ultra-light-maintainable-wizards-in.html)

Features
========

- Wizard step generator (model part builder MVC components)
  + [DONE] Routes
  + [DONE] Controller steps
  + [DONE] Model parts
  + [DONE] View parts
  - Helper (or Controller SuperModule trait) for ultra light wizard support
  - Forms
  - Support for nested resources
  - Modularize (perhaps extracting sub-generators)
  - [DONE] Customize name conventions

License
=======

MIT
