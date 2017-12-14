namespace :recurring do
  task init: :environment do
    
    # Delete any previously-scheduled recurring jobs
    Delayed::Job.where('(handler LIKE ?)', '--- !ruby/object:Recurring::%').destroy_all

    Recurring::FineWorker.schedule!
       
  
  end
end